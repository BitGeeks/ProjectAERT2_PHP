<?php

namespace App\Http\Controllers;

use App\Models\ShoppingSession;
use App\Models\CartItem;
use App\Models\Coupon;
use App\Models\PaymentDetail;
use App\Models\OrderDetail;
use App\Models\OrderItem;
use Illuminate\Http\Request;
use App\Models\ShippingMethod;
use App\Http\Helpers\MiscHelper;

class CartController extends Controller
{
    public function GetSession (Request $request) {
        $user = $request->userData;
        $total = 0;
        $sessionCheck = ShoppingSession::where("User_id", $user->id)
                ->orderBy("Id", "DESC")
                ->first();

        if ($sessionCheck == null) {
            $session = [
                "User_id" => $user->id,
                "Total" => 0,
                "Updated_at" => \Carbon\Carbon::now(),
                "Created_at" => \Carbon\Carbon::now()
            ];
            ShoppingSession::insert($session);

            $sessionCheck = ShoppingSession::where("User_id", $user->id)
                ->orderBy("Id", "DESC")
                ->first();
        }
        if ($sessionCheck != null) {
            $ctext = ShoppingSession::with(["cartitems", "cartitems.product", "cartitems.product.productcategory", "cartitems.product.productimages", "cartitems.product.productinventory", "coupon", "discount"])
                // ->join("coupon", "coupon.Id", "=", "shoppingsessions.Coupon_id")
                // ->join("discounts", "discounts.Id", "=", "shoppingsessions.Discount_id")
                // ->join("cartitems", "shoppingsessions.Id", "=", "cartitems.Session_id")
                // ->join("products", "products.Id", "=", "cartitems.Product_id")
                // ->join("productcategories", "productcategories.Id", "=", "products.Category_id")
                // ->join("productinventories", "productinventories.Id", "=", "products.Inventory_id")
                ->where("shoppingsessions.User_id", $user->id)
                ->orderBy("shoppingsessions.Id", "DESC")
                ->first();

            foreach ($ctext->cartitems as $c) {
                $cartPrice = $c->product->PricePromotion != 0 ? $c->product->PricePromotion : $c->product->Price;
                $total += $c->product->productinventory->Quantity * $cartPrice;
            }

            $ctext->Total = $total;
            return response()->json($ctext);
        }

        return "NotFound";
    }

    public function GetCartItems(Request $request) {
        $user = $request->userData;
        $sessionCheck = ShoppingSession::where("User_id", $user->id)
                ->orderBy("Id", "DESC")
                ->first();

        if ($sessionCheck != null) {
            $results = CartItem::with(["product", "product.productcategory", "product.productimages", "product.productinventory"])
            // join("products", "products.Id", "=", "cartitems.Product_id")
            // ->join("productcategories", "productcategories.Id", "=", "products.Category_id")
            // ->join("productinventories", "productinventories.Id", "=", "products.Inventory_id")
            ->where("cartitems.Session_id", $sessionCheck->Id)
            ->get();

            return response()->json($results);
        }

        return "NotFound";
    }

    public function IncrementCartItem (Request $request) {
        $user = $request->userData;
        $sessionCheck = ShoppingSession::where("User_id", $user->id)
                ->orderBy("Id", "DESC")
                ->first();

        if ($sessionCheck != null) {
            $updateObj = CartItem::with(["product", "product.productcategory", "product.productimages", "product.productinventory"])
            // join("products", "products.Id", "=", "cartitems.Product_id")
            // ->join("productcategories", "productcategories.Id", "=", "products.Category_id")
            // ->join("productinventories", "productinventories.Id", "=", "products.Inventory_id")
            ->where([
                ["Session_id", $sessionCheck->Id],
                ["Id", $request->cartItemId]
            ])
            ->first();

            if ($updateObj != null) {
                // $updateObj->Quantity += $request->amount;
                // return response()->json($updateObj);
                // $updateObj->save();
                CartItem::where("Id", $updateObj->Id)->update([
                    "Quantity" => $updateObj->Quantity + $request->amount
                ]);

                return $this->GetSession($request);
            }
        }

        return "NotFound";
    }

    public function setCartNum (Request $request) {
        $user = $request->userData;
        $sessionCheck = ShoppingSession::where("User_id", $user->id)
                ->orderBy("Id", "DESC")
                ->first();

        if ($sessionCheck != null) {
            $updateObj = CartItem::with(["product", "product.productcategory", "product.productimages", "product.productinventory"])
            // join("products", "products.Id", "=", "cartitems.Product_id")
            // ->join("productcategories", "productcategories.Id", "=", "products.Category_id")
            // ->join("productinventories", "productinventories.Id", "=", "products.Inventory_id")
            ->where([
                ["cartitems.Session_id", $sessionCheck->Id],
                ["cartitems.Id", $request->cartItemId]
            ])
            ->first();

            if ($updateObj != null) {
                if ($request->amount <= $updateObj->product->productinventory->Quantity)
                    $updateObj->Quantity = $request->amount;
                else
                    $updateObj->Quantity = $updateObj->product->productinventory->Quantity;
                CartItem::where("Id", $updateObj->Id)->update([
                    "Quantity" => $updateObj->Quantity
                ]);

                return $this->GetSession($request);
            }
        }

        return "NotFound";
    }

    public function ConfirmCartItem (Request $request) {
        $user = $request->userData;
        $sessionCheck = ShoppingSession::with("coupon")
        // join("coupon", "coupon.Id", "=", "shoppingsessions.Coupon_id")
                ->where("User_id", $user->id)
                ->orderBy("Id", "DESC")
                ->first();

        if ($sessionCheck) {
            $subTotal = $request->Total;
            $total = $request->Total;
            $shippingAmount = $request->shippingAmount;
            $couponAmount = 0;
            $discountAmount = 0;

            if ($sessionCheck->coupon != null && (
                $sessionCheck->coupon->Expired_at > \Carbon\Carbon::now() &&
                $sessionCheck->coupon->Active &&
                $sessionCheck->coupon->MinPrice < $request->Total
            )) {
                $cptick = Coupon::where("Id", $sessionCheck->coupon->Coupon_id)->first();
                $couponAmount = $total * (floatval($sessionCheck->coupon->CouponPercent) / 100);
                $total -= $total * (floatval($sessionCheck->coupon->CouponPercent) / 100);
                $cptick->coupon->CouponLeft -= 1;
                Coupon::update($cptick);
            }

            $PaymentDetail = [
                "Amount" => $total,
                "Provider" => 0,
                "Status" => 0,
                "ReferralBy" => $user->ReferralBy,
                "Created_at" => \Carbon\Carbon::now(),
                "Updated_at" => \Carbon\Carbon::now()
            ];
            $PaymentDetailID = PaymentDetail::insertGetId($PaymentDetail);

            $orderDetail = [
                "User_id" => $user->id,
                "Total" => $total + $shippingAmount,
                "SubTotal" => $subTotal,
                "DiscountAmount" => $discountAmount,
                "CouponAmount" => $couponAmount,
                "ShippingAmount" => $shippingAmount,
                "Payment_id" => $PaymentDetailID,
                "ShippingMethod_id" => $request->ShippingMethod_Id,
                "ShippingAddress" => $request->shippingAddress,
                "Coupon_id" => $sessionCheck->Coupon_id,
                "Discount_id" => $sessionCheck->Discount_id,
                "LocationName" => $request->locationName,
                "Latitute" => $request->latitute,
                "Longitute" => $request->longitute,
                "Created_at" => \Carbon\Carbon::now(),
                "Updated_at" => \Carbon\Carbon::now()
            ];

            $orderDetailID = OrderDetail::insertGetId($orderDetail);

            foreach ($request->cartitems as $item) {
                $orderItem = [
                    "Order_id" => $orderDetailID,
                    "Product_id" => $item["product_id"],
                    "Quantity" => $item["quantity"],
                    "Created_at" => \Carbon\Carbon::now(),
                    "Updated_at" => \Carbon\Carbon::now()
                ];
                OrderItem::insert($orderItem);
                CartItem::where([
                    ["Session_id", $request->Id],
                    ["Id", $item["id"]]
                ])->delete();
            }

            ShoppingSession::where([
                ["Id", $request->Id],
                ["User_id", $user->id]
            ])->orderBy("Id", "DESC")->delete();

            // Gửi email?

            return $this->GetOrderById($request, $orderDetailID);
        }

        return "NotFound";
    }

    public function GetOrderById (Request $request, $id) {
        $user = $request->userData;

        $sessionCheck = OrderDetail::with(["paymentdetail", "shippingmethod", "orderitems", "orderitems.product", "orderitems.product.productcategory", "orderitems.product.productinventory", "orderitems.product.productimages", "user", "coupon", "discount"])
        // join("coupon", "coupon.Id", "=", "shoppingsessions.Coupon_id")
                ->where("User_id", $user->id)
                ->orderBy("Id", "DESC")
                ->first();

        if (!$sessionCheck) return "2NotFound";

        return response()->json($sessionCheck);
    }

    public function SetShippingPos (Request $request) {
        $shippingMethod = ShippingMethod::where("Id", $request->shippingId)->first();

        $miscHelper = new MiscHelper();

        $distance = $miscHelper->mxmsdistance(13.977583958282, 107.99479541302, $request->latitute, $request->longitute, "K") * $shippingMethod->avgfeeperkm;

        return $distance;
    }

    public function GetOrders (Request $request) {
        $user = $request->userData;

        $sessionCheck = OrderDetail::with(["paymentdetail", "shippingmethod", "user"])
            ->where("User_id", $user->id)->get();
            
            if (sessionCheck == null)
                return "NotFound";
            return response()->json($sessionCheck);
    }

    public function DecrementCartItem (Request $request) {
        $user = $request->userData;

        $sessionCheck = ShoppingSession::
        where("User_id", $user->id)
        ->orderBy("Id", "DESC")->first();

        if (!$sessionCheck)
        {
            $session = [
                "User_id" => $user->id,
                "Total" => 0,
                "Updated_at" => \Carbon\Carbon::now(),
                "Created_at" => \Carbon\Carbon::now()
            ];
            ShoppingSession::insert($session);
            $sessionCheck = ShoppingSession::
                where("User_id", $user->id)
                ->orderBy("Id", "DESC")->first();
        }
        if ($sessionCheck)
        {
            $updateObj = CartItem::where(["Session_id" => $sessionCheck->Id, "Id" => $request->cartItemId])->first();
            if ($updateObj)
            {
                if ($updateObj->Quantity - $request->amount <= 0) {
                    CartItem::where("Id", $updateObj->Id)->delete();
                }
                else {
                    $updateObj->Quantity -= $request->amount;
                    CartItem::where("Id", $updateObj->Id)->update([
                        "Quantity" => $updateObj->Quantity
                    ]);
                }
                return $this->GetSession($request);
            }
        }

        return "NotFound";
    }

    public function GetCartItem (Request $request, $id) {
        $cartItem = CartItem::where("Id", $id)->first();

        if (!$cartItem)
        {
            return "NotFound";
        }

        return response()->json($cartItem);
    }

    public function PostCartItem (Request $request) {
        $user = $request->userData;

        $sessionCheck = ShoppingSession::
        where("User_id", $user->id)
        ->orderBy("Id", "DESC")->first();

        if (!$sessionCheck)
        {
            $session = [
                "User_id" => $user->id,
                "Total" => 0,
                "Updated_at" => \Carbon\Carbon::now(),
                "Created_at" => \Carbon\Carbon::now()
            ];
            ShoppingSession::insert($session);
            $sessionCheck = ShoppingSession::
                where("User_id", $user->id)
                ->orderBy("Id", "DESC")->first();
        }
        if ($sessionCheck)
        {
            $checkCart = CartItem::where(["Session_id" => $sessionCheck->Id, "Product_id" => $request->ProductId])->first();
            if (!$checkCart)
            {
                $cart = [
                    "Product_id" => $request->productId,
                    "Session_id" => $sessionCheck->Id,
                    "Quantity" => $request->amount,
                    "Updated_at" => \Carbon\Carbon::now(),
                    "Created_at" => \Carbon\Carbon::now()
                ];
                CartItem::insert($cart);
            } else {
                $checkCart->Quantity += $request->amount;
                $checkCart->save();
            }
        }

        return $this->GetSession($request);
    }

    public function DeleteCartItem (Request $request, $id) {
        $cartItem = CartItem::where("Id", $id)->delete();

        return $this->GetSession($request);
    }

    public function ToggleCoupon (Request $request) {
        $user = $request->userData;

        $check = Coupon::where([
            "User_id" => $user->id,
            "CouponCode" => $request->code
        ])->where("Expired_at", ">", \Carbon\Carbon::now())->first();

        $sessionCheck = ShoppingSession::where("User_id", $user->id)->orderBy("Id", "DESC")->first();

        if (!$check)
        {
            $sessionCheck->Coupon_id = null;
        }
        else
        {
            if ($sessionCheck->Coupon_id == $check->Id) $sessionCheck->Coupon_id = null;
            else $sessionCheck->Coupon_id = $check->Id;
        }

        ShoppingSession::where("Id", $sessionCheck->Id)->update($sessionCheck);

        return $this->GetSession($request);
    }
}