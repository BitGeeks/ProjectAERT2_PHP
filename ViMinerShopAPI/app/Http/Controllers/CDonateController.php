<?php

namespace App\Http\Controllers;

use App\Models\CouponDonate;
use App\Models\User;
use App\Models\Coupon;
use Illuminate\Http\Request;
use App\Http\Helpers\MiscHelper;

class CDonateController extends Controller
{
    public function GetCouponDonateBy (Request $request, $flag) {
        $user = $request->userData;

        $couponDonate = CouponDonate::orderBy("Id", "DESC");

        if ($flag == "transfered")
            $couponDonate = $couponDonate->where("User_id", $user->id);
        else $couponDonate = $couponDonate->where("ReceiverId", $user->id);

        $results = $couponDonate->skip($request->page * $request->size)
                ->take($request->size)->get();
        return response()->json($results);
    }

    public function CountCouponDonateBy (Request $request, $flag) {
        $user = $request->userData;

        $couponDonate = CouponDonate::orderBy("Id", "DESC");

        if ($flag == "transfered")
            $couponDonate = CouponDonate::where("User_id", $user->id);
        else $couponDonate = CouponDonate::where("ReceiverId", $user->id);

        if (isset($request->size) && isset($request->page))
            $results = $couponDonate->orderBy("Id", "DESC")->skip($request->page * $request->size)
                ->take($request->size)->count();
        $results = $couponDonate->orderBy("Id", "DESC")->count();
        return response()->json($results);
    }

    public function PostCouponDonate (Request $request) {
        $user = $request->userData;

        $couponCheck = Coupon::where("Id", $request->couponid)
                    ->where("User_id", $user->id)
                    ->where("Expired_at", ">", \Carbon\Carbon::now())
                    ->first();

        $backCoupon = $couponCheck;

        $receiver = User::where("email", $request->receiverMail)
                    ->first();

        if ($receiver == null || $couponCheck == null || $couponCheck->CouponLeft < $request->couponNumber || $receiver->id == $user->id)
            return "NotFound";

        $couponRCheck = Coupon::where("User_id", $receiver->id)
                        ->where("CouponCode", $couponCheck->CouponCode)
                        ->first();
        
        if ($couponCheck->CouponLeft == $request->couponNumber) {
            if ($couponRCheck) {
                $couponRCheck->CouponLeft += $request->couponNumber;
                Coupon::where("Id", $request->couponid)
                    ->where("User_id", $user->id)
                    ->where("Expired_at", ">", \Carbon\Carbon::now())
                    ->delete();
            } else {
                $couponCheck->User_id = $receiver->id;
            }
        } else {
            $couponCheck->CouponLeft -= $request->couponNumber;
            if (!$couponRCheck) {
                $newCoupon = [
                    "CouponCode" => $couponCheck->CouponCode,
                    "User_id" => $receiver->id,
                    "Desc" => $couponCheck->Desc,
                    "CouponPercent" => $couponCheck->CouponPercent,
                    "CouponType" => $couponCheck->CouponType,
                    "MinPrice" => $couponCheck->MinPrice,
                    "Active" => $couponCheck->Active,
                    "CouponLeft" => $request->couponNumber,
                    "Expired_at" => $couponCheck->Expired_at,
                    "Created_at" => \Carbon\Carbon::now(),
                    "Updated_at" => \Carbon\Carbon::now()
                ];
                Coupon::insert($newCoupon);
            } else {
                $couponRCheck->CouponLeft += $request->couponNumber;
            }
        }

        $mischelper = new MiscHelper();

        $donate = [
            "TransactionId" => $mischelper->randomStr(20),
            "User_id" => $user->id,
            "ReceiverId" => $receiver->id,
            "CouponId" => $backCoupon->Id,
            "CouponName" => $backCoupon->CouponCode,
            "CouponPercent" => $backCoupon->CouponPercent,
            "Quantity" => $request->couponNumber,
            "Created_at" => \Carbon\Carbon::now(),
            "Updated_at" => \Carbon\Carbon::now()
        ];
        CouponDonate::insert($donate);
        $couponCheck->save();
        if ($couponRCheck)
            $couponRCheck->save();

        return response()->json("");
    }
}