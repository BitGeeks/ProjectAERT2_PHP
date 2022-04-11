<?php

namespace App\Http\Controllers;

use App\Models\OrderDetail;
use App\Models\ProductCategory;
use App\Models\Algorithm;
use Illuminate\Http\Request;
use App\Models\PaymentProvider;
use App\Models\PaymentDetail;
use App\Http\Helpers\MiscHelper;

class OrderController extends Controller
{
    public function GetAllOrderByType (Request $request, $type) {
        $user = $request->userData;
        $results = OrderDetail::with(["orderitems", "orderitems.product", "orderitems.product.productcategory", "orderitems.product.productinventory", "orderitems.product.productimages"])
                    ->join("paymentdetail", "paymentdetail.id", "=", "orderdetail.payment_id")
                    ->where(["User_id" => $user->id]);


        if ($type == 2) $results = $results->where("paymentdetail.status", 0);
        elseif ($type == 3) $results = $results->where("paymentdetail.status", 1);
        elseif ($type == 4) $results = $results->where("paymentdetail.status", 2);
        elseif ($type == 5) $results = $results->where("paymentdetail.status", 3);
        elseif ($type == 6) $results = $results->where("paymentdetail.status", 4);
        elseif ($type == 7) {
            $expDate = Carbon::now()->subDays(30);
            $results = $results->whereDate('Created_at', '>=', $expDate - 30);
        }

        return response()->json($results->get());
    }

    public function GetAllOrderCountByType (Request $request, $type) {
        $user = $request->userData;
        $results = OrderDetail::with(["orderitems", "orderitems.product", "orderitems.product.productcategory", "orderitems.product.productinventory", "orderitems.product.productimages"])
                    ->join("paymentdetail", "paymentdetail.id", "=", "orderdetail.payment_id")
                    ->where(["User_id" => $user->id]);


        if ($type == 2) $results = $results->where("paymentdetail.status", 0);
        elseif ($type == 3) $results = $results->where("paymentdetail.status", 1);
        elseif ($type == 4) $results = $results->where("paymentdetail.status", 2);
        elseif ($type == 5) $results = $results->where("paymentdetail.status", 3);
        elseif ($type == 6) $results = $results->where("paymentdetail.status", 4);
        elseif ($type == 7) {
            $expDate = Carbon::now()->subDays(30);
            $results = $results->whereDate('Created_at', '>=', $expDate - 30);
        }

        return response()->json($results->count());
    }

    public function GetOrderDetails (Request $request) {
        $user = $request->userData;

        $results = OrderDetail::with(["orderitems", "orderitems.product", "orderitems.product.productcategory", "orderitems.product.productinventory", "orderitems.product.productimages"])
                    ->join("paymentdetail", "paymentdetail.id", "=", "orderdetail.payment_id")
                    ->orderBy("orderdetail.id", "DESC")
                    ->skip($request->page * $request->size)
                    ->take($request->size)
                    ->where(["User_id" => $user->id])
                    ->get();
                    
        return response()->json($results);
    }

    public function GetAllOrderCount (Request $request) {
        $user = $request->userData;

        $results = OrderDetail::with(["orderitems", "orderitems.product", "orderitems.product.productcategory", "orderitems.product.productinventory", "orderitems.product.productimages"])
                    ->join("paymentdetail", "paymentdetail.id", "=", "orderdetail.payment_id")
                    ->orderBy("orderdetail.id", "DESC")
                    ->skip($request->page * $request->size)
                    ->take($request->size)
                    ->where(["User_id" => $user->id])
                    ->count();
                    
        return response()->json($results);
    }

    public function GetUnpaidOrder (Request $request) {
        $user = $request->userData;

        $results = OrderDetail::with(["orderitems", "orderitems.product", "orderitems.product.productcategory", "orderitems.product.productinventory", "orderitems.product.productimages"])
                    ->join("paymentdetail", "paymentdetail.id", "=", "orderdetail.payment_id")
                    ->orderBy("orderdetail.id", "DESC")
                    ->skip($request->page * $request->size)
                    ->take($request->size)
                    ->where(["User_id" => $user->id, "paymentdetail.status" => 0])
                    ->get();
                    
        return response()->json($results);
    }

    public function GetPendingOrder (Request $request) {
        $user = $request->userData;

        $results = OrderDetail::with(["orderitems", "orderitems.product", "orderitems.product.productcategory", "orderitems.product.productinventory", "orderitems.product.productimages"])
                    ->join("paymentdetail", "paymentdetail.id", "=", "orderdetail.payment_id")
                    ->orderBy("orderdetail.id", "DESC")
                    ->skip($request->page * $request->size)
                    ->take($request->size)
                    ->where(["User_id" => $user->id, "paymentdetail.status" => 1])
                    ->get();
                    
        return response()->json($results);
    }

    public function GetUnshippedOrder (Request $request) {
        $user = $request->userData;

        $results = OrderDetail::with(["orderitems", "orderitems.product", "orderitems.product.productcategory", "orderitems.product.productinventory", "orderitems.product.productimages"])
                    ->join("paymentdetail", "paymentdetail.id", "=", "orderdetail.payment_id")
                    ->orderBy("orderdetail.id", "DESC")
                    ->skip($request->page * $request->size)
                    ->take($request->size)
                    ->where(["User_id" => $user->id, "paymentdetail.status" => 2])
                    ->get();
                    
        return response()->json($results);
    }

    public function GetShippingOrder (Request $request) {
        $user = $request->userData;

        $results = OrderDetail::with(["orderitems", "orderitems.product", "orderitems.product.productcategory", "orderitems.product.productinventory", "orderitems.product.productimages"])
                    ->join("paymentdetail", "paymentdetail.id", "=", "orderdetail.payment_id")
                    ->orderBy("orderdetail.id", "DESC")
                    ->skip($request->page * $request->size)
                    ->take($request->size)
                    ->where(["User_id" => $user->id, "paymentdetail.status" => 3])
                    ->get();
                    
        return response()->json($results);
    }

    public function GetShippedOrder (Request $request) {
        $user = $request->userData;

        $results = OrderDetail::with(["orderitems", "orderitems.product", "orderitems.product.productcategory", "orderitems.product.productinventory", "orderitems.product.productimages"])
                    ->join("paymentdetail", "paymentdetail.id", "=", "orderdetail.payment_id")
                    ->orderBy("orderdetail.id", "DESC")
                    ->skip($request->page * $request->size)
                    ->take($request->size)
                    ->where(["User_id" => $user->id, "paymentdetail.status" => 4])
                    ->get();
                    
        return response()->json($results);
    }

    public function GetExpiredOrder (Request $request) {
        $user = $request->userData;
        $expDate = Carbon::now()->subDays(30);

        $results = OrderDetail::with(["orderitems", "orderitems.product", "orderitems.product.productcategory", "orderitems.product.productinventory", "orderitems.product.productimages"])
                    ->join("paymentdetail", "paymentdetail.id", "=", "orderdetail.payment_id")
                    ->orderBy("orderdetail.id", "DESC")
                    ->skip($request->page * $request->size)
                    ->take($request->size)
                    ->where(["User_id" => $user->id])
                    ->whereDate('Created_at', '>=', $expDate - 30)
                    ->get();
                    
        return response()->json($results);
    }

    public function userPaymentPaypal (Request $request) {
        $user = $request->userData;

        $paymentProvider = PaymentProvider::where("Name", "LIKE", "%MaxMines%")->first();

        $orderDetails = OrderDetail::where([
            "Id" => $request->orderId,
            "User_id" => $user->id
        ])->first();

        if (!$orderDetails) return "NotFound";

        $paymentDetail = PaymentDetail::where("Id", $orderDetails->Payment_id)->first();

        if (!$paymentDetail) return "NotFound";

        $paymentDetail->PaypalID = $request->idPayment;
        $paymentDetail->Status = 1;
        $paymentDetail->Updated_at = \Carbon\Carbon::now();
        $paymentDetail->Provider = $paymentProvider->Id;

        $nineteenth = \Carbon\Carbon::now();
        $nineteenth->addDays(5);

        $coupon = [
            "CouponCode" => new MiscHelper().randomStr(8),
            "User_id" => user.Id,
            "Desc" => "Cảm ơn bạn đã tin tưởng Vĩ Miner Shop!!",
            "CouponPercent" => $this->calculateCouponPercenByBill($paymentDetail->Amount),
            "CouponType" => "sales",
            "MinPrice" => 1000,
            "Active" => true,
            "CouponLeft" => 1,
            "Expired_at" => $nineteenth,
            "Created_at" => \Carbon\Carbon::now(),
            "Updated_at" => \Carbon\Carbon::now()
        ];
        Coupon::insert($coupon);
        PaymentDetail::where("Id", $paymentDetail->Id)->update($paymentDetail);

        $this->afterPaymentSuccessful($user, $orderDetails, "thanh toán Paypal");

        return "";
    }

    private function afterPaymentSuccessful ($user, $order, $providerName) {
        // under development
    }

    private function calculateCouponPercenByBill ($billTotal) {
        if ($billTotal <= 500) return "10";
        else if ($billTotal > 500 && $billTotal <= 1000) return "25";
        else if ($billTotal > 1000 && $billTotal <= 2000) return "35";
        else if ($billTotal > 2000 && $billTotal <= 3000) return "40";
        else if ($billTotal > 3000 && $billTotal < 4000) return "45";
        else if ($billTotal > 4000 && $billTotal < 5000) return "50";
        else return "55";
    }

    public function OnUserPaymentMaxMines (Request $request) {
        $user = $request->userData;

        $paymentProvider = PaymentProvider::where("Name", "LIKE", "%MaxMines%")->first();

        $orderDetails = OrderDetail::where([
            "Id" => $request->orderId,
            "User_id" => $user->id
        ])->first();

        if (!$orderDetails) return "NotFound";

        $paymentDetail = PaymentDetail::where("Id", $orderDetails->Payment_id)->first();

        if (!$paymentDetail) return "NotFound";

        $paymentDetail->MaxMinesBillID = $request->maxMinesBillCode;
        $paymentDetail->Status = 1;
        $paymentDetail->Updated_at = \Carbon\Carbon::now();
        $paymentDetail->Provider = $paymentProvider->Id;

        $nineteenth = \Carbon\Carbon::now();
        $nineteenth->addDays(19);

        $coupon = [
            "CouponCode" => new MiscHelper().randomStr(8),
            "User_id" => user.Id,
            "Desc" => "Cảm ơn bạn đã tin tưởng Vĩ Miner Shop!!",
            "CouponPercent" => $this->calculateCouponPercenByBill($paymentDetail->Amount),
            "CouponType" => "sales",
            "MinPrice" => 1000,
            "Active" => true,
            "CouponLeft" => 1,
            "Expired_at" => $nineteenth,
            "Created_at" => \Carbon\Carbon::now(),
            "Updated_at" => \Carbon\Carbon::now()
        ];
        Coupon::insert($coupon);
        PaymentDetail::where("Id", $paymentDetail->Id)->update($paymentDetail);

        $this->afterPaymentSuccessful($user, $orderDetails, "thanh toán MaxMines 0Pay");

        return "";
    }

    public function PutOrderDetail (Request $request) {
        $user = $request->userData;
        
        $order = OrderDetail::where([
            "User_id" => $user->id,
            "Id" => $request->orderId
        ])->first();

        if ($order) {
            PaymentDetail::where("Id", $order->Payment_id)->update(["Provider" => $orderDetail->paymentId]);
        }

        $order = OrderDetail::with("paymentdetail")->where([
            "User_id" => $user->id,
            "Id" => $request->orderId
        ])->first();

        return response()->json($order);
    }

    public function GetCouponCount (Request $request, $type) {
        $user = $request->userData;
        
        $couponCount = Coupon::where("User_id", $user->Id);
        
        $od = OrderDetail::with("coupon")
            ->where([
                "User_id" => $user->id
            ])
            ->where("Coupon_id", "!=", null)
            ->get();

        if ($type == 0) {
            $couponCount = $couponCount
                ->where("CouponLeft", "!=", 0)
                ->where("Active", true)
                ->where("Expired_at", ">=", \Carbon\Carbon::now());
        }
        elseif ($type == 1) {
            return OrderDetails::where("User_id", $user->id)->where("Coupon_id", "!=", null)->count();
        }
        elseif ($type == 2) {
            $couponCount = $couponCount
                    ->where("Expired_at", "<=", \Carbon\Carbon::now());
        }
        else return "NotFound";

        return response()->json($couponCount->count());
    }

    public function GetAvailableCoupon (Request $request) {
        $user = $request->userData;

        $coupon = Coupon::where("User_id", $user->id)
                    ->where("CouponLeft", "!=", 0)
                    ->where("Active", true)
                    ->where("Expired_at", ">=", \Carbon\Carbon::now())
                    ->orderBy("Id", "DESC");

        if (isset($request->size) && $request->size != null)
        {
            $coupon = $coupon
                        ->skip($request->size * $request->page)
                        ->take($request->size);
        }

        return response()->json($coupon->get());
    }

    public function GetUsedCoupon (Request $request) {
        $user = $request->userData;

        $coupon = OrderDetail::select("coupon")->with("coupon")
                ->where("User_id", $user->id)
                ->where("Coupon_id", "!=", null);

        if (isset($request->size) && $request->size != null)
        {
            $coupon = $coupon
                        ->skip($request->size * $request->page)
                        ->take($request->size);
        }

        return response()->json($coupon->get());
    }

    public function GetExpiredCoupon (Request $request) {
        $user = $request->userData;

        $coupon = Coupon::where("User_id", $user->id)
                    ->where("Expired_at", "<=", \Carbon\Carbon::now())
                    ->orderBy("Id", "DESC");

        if (isset($request->size) && $request->size != null)
        {
            $coupon = $coupon
                        ->skip($request->size * $request->page)
                        ->take($request->size);
        }

        return response()->json($coupon->get());
    }
}