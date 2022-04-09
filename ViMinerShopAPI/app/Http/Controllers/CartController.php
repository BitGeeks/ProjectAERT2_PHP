<?php

namespace App\Http\Controllers;

use App\Models\ShoppingSession;
use App\Models\CartItem;
use App\Models\Coupon;
use App\Models\PaymentDetail;
use App\Models\OrderDetail;
use App\Models\OrderItem;
use Illuminate\Http\Request;

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
                "Updated_at" => date(),
                "Created_at" => date()
            ];
            ShoppingSession::insert($session);
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
                ->get();

            foreach ($ctext as $c) {
                if ($c->PricePromotion == null || $c->Price == null || $c->Quantity == null) return "NotFound";
                $cartPrice = $c->PricePromotion != 0 ? $c->PricePromotion : $c->Price;
                $total += $c->Quantity * $cartPrice;
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
                ["cartitems.Session_id", $sessionCheck->Id],
                ["cartitems.Id", $request->cartItemId]
            ])
            ->first();

            if ($updateObj != null) {
                $updateObj->Quantity += $request->amount;
                CartItem::update($updateObj);

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
                if ($request->amount <= $updateObj->Quantity)
                    $updateObj->Quantity = $request->amount;
                else
                    $updateObj->Quantity = $updateObj->Quantity;
                CartItem::update($updateObj);

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

            if ($sessionCheck->coupon->Coupon_id != null && (
                $sessionCheck->coupon->Expired_at > date() &&
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
                "Created_at" => date(),
                "Updated_at" => date()
            ];
            PaymentDetail::insert($PaymentDetail);

            $orderDetail = [
                "User_id" => $user->id,
                "Total" => $total + $shippingAmount,
                "SubTotal" => $subTotal,
                "DiscountAmount" => $discountAmount,
                "CouponAmount" => $couponAmount,
                "ShippingAmount" => $shippingAmount,
                "Payment_id" => $PaymentDetail->Id,
                "ShippingMethod_id" => $request->ShippingMethod_Id,
                "ShippingAddress" => $request->shippingAddress,
                "Coupon_id" => $sessionCheck->Coupon_id,
                "Discount_id" => $sessionCheck->Discount_id,
                "LocationName" => $request->LocationName,
                "Latitute" => $request->Latitute,
                "Longitute" => $request->Longitute,
                "Created_at" => date(),
                "Updated_at" => date()
            ];

            OrderDetail::insert($orderDetail);

            foreach ($CartItems as $item) {
                $orderItem = [
                    "Order_id" => $orderDetail->Id,
                    "Product_id" => $item->Product_id,
                    "Quantity" => $item->Quantity,
                    "Created_at" => date(),
                    "Updated_at" => date()
                ];
                OrderItem::insert($orderItem);
                CartItem::where([
                    ["Session_id", $request->Id],
                    ["Id", $item->Id]
                ])->delete();
            }

            ShoppingSession::where([
                ["Id", $request->Id],
                ["User_id", $user->id]
            ])->orderBy("Id", "DESC")->delete();

            // Gửi email?

            return $this->GetOrderById($orderDetail->Id);
        }

        return "NotFound";
    }

    public function GetOrderById (Request $request, $id) {
        $user = $request->userData;
        $total = 0;

        $sessionCheck = ShoppingSession::with("coupon")
        // join("coupon", "coupon.Id", "=", "shoppingsessions.Coupon_id")
                ->where("User_id", $user->id)
                ->orderBy("Id", "DESC")
                ->first();

        if ($sessionCheck == null) return "NotFound";

        return response()->json($sessionCheck);
    }

    public function SetShippingPos (Request $request) {
        // Under development
    }
}