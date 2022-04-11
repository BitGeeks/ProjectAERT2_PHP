<?php

namespace App\Http\Controllers;

use App\Models\Repair;
use Illuminate\Http\Request;
use App\Models\RepairOrder;
use App\Models\PaymentProvider;

class RepairOrderController extends Controller
{
    public function GetRepairOrders (Request $request) {
        $user = $request->userData;

        $orderList = Repair::with(["repairorder", "repairorder.repair", "repairorder.repair.repairitem"])
            ->select("repairorder")
            ->where("User_id", $user->id)
            ->where("repairorder", "!=", null);

        if ($request->type != -1)
            $orderList = $orderList
                ->where("Status", "=", $request->type);

        $orderList = $orderList
            ->orderBy("Id", "DESC")
            ->skip($request->page * $request->size)
            ->take($request->size)->get();

        return response()->json($orderList);
    }

    public function OnPaymentPaypal (Request $request) {
        $user = $request->userData;

        $repair = RepairOrder::where("Repair_id", $request->repairOrderId)->first();

        $provider = PaymentProvider::where("Name", "LIKE", "%paypal%")->first();

        if ($repair)
        {
            $repair->Status = 2;
            $repair->Provider = $provider->Id;

            $payment = PaymentDetail::where("Id", $repair->Payment_id)->first();

            $payment->PaypalID = $request->idPayment;
            $payment->Status = 1;
            $payment->Updated_at = \Carbon\Carbon::now();
            $payment->Provider = $provider->Id;

            PaymentDetail::where("Id", $payment->Id)->update($payment);

            $this->afterPaymentSuccessful($user, $repair, "thanh toán qua Paypal");

            return "";
        }
        return "Thanh toán thất bại! Vui lòng liên hệ hỗ trợ viên!";
    }

    private function afterPaymentSuccessful ($user, $repair, $providerName) {
        // under development
    }

    public function GetRepairOrderCount (Request $request, $type) {
        $user = $request->userData;

        $orderList = Repair::with("repairorder")
            ->select("repairorder")
            ->where("User_id", $user->Id)
            ->where("repairorder", "!=", null);

        if ($type != -1)
            $orderList = $orderList
                ->where("Status", $type);

        return response()->json($orderList->count());
    }

    public function GetRepairOrder (Request $request, $id) {
        $repairOrder = RepairOrder::where("Id", $id);

        if (!$repairOrder)
        {
            return "NotFound";
        }

        return response()->json(repairOrder);
    }
}