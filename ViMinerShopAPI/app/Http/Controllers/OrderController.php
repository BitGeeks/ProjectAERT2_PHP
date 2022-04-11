<?php

namespace App\Http\Controllers;

use App\Models\OrderDetail;
use App\Models\ProductCategory;
use App\Models\Algorithm;
use Illuminate\Http\Request;

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
        // under development
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
        // under development
    }

    public function PutOrderDetail (Request $request) {
        // under development
    }

    public function GetCouponCount (Request $request, $type) {
        // under development
    }

    public function GetAvailableCoupon (Request $request) {
        // under development
    }

    public function GetUsedCoupon (Request $request) {
        // under development
    }

    public function GetExpiredCoupon (Request $request) {
        // under development
    }
}