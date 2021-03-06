<?php

namespace App\Http\Controllers;

use App\Models\Repair;
use Illuminate\Http\Request;
use App\Models\RepairOrder;
use App\Models\PaymentProvider;
use App\Models\PaymentDetail;

class RepairOrderController extends Controller
{
    public function GetRepairOrders (Request $request) {
        $user = $request->userData;

        $orderList = Repair::with(["repairorder", "repairorder.repair", "repairorder.repair.repairitem"])
            // ->join("repairorder", "repairorder.repair_id", "=", "repair.id")
            // ->select([
            //     'repair.Id', 'repairorder.Repair_id', 'repairorder.Payment_id', 'repairorder.Status', 'repairorder.Provider', 'repairorder.Price', 'repairorder.Created_at', 'repairorder.Updated_at'
            // ])
            ->where("User_id", $user->id);;

        if ($request->type != -1)
            $orderList = $orderList
                ->where("Status", "=", $request->type);

        $orderList = $orderList
            ->orderBy("repair.Id", "DESC")
            ->skip($request->page * $request->size)
            ->take($request->size)->get();

        $dataBack = [];

        foreach ($orderList as $repairfix) {
            array_push($dataBack, $repairfix->repairorder);
        }

        return response()->json($dataBack);
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
            
            $repair->save();
            $payment->save();

            $this->afterPaymentSuccessful($user, $repair, "thanh to??n qua Paypal");

            return "";
        }
        return "Thanh to??n th???t b???i! Vui l??ng li??n h??? h??? tr??? vi??n!";
    }

    private function afterPaymentSuccessful ($user, $repair, $providerName) {
        // under development
    }

    public function GetRepairOrderCount (Request $request, $type) {
        $user = $request->userData;

        $orderList = Repair::with("repairorder")
            ->join("repairorder", "repairorder.repair_id", "=", "repair.id")
            ->select("repairorder.*")
            ->where("User_id", $user->id);;

        if ($type != -1)
            $orderList = $orderList
                ->where("repairorder.status", $type);

        return response()->json($orderList->count());
    }

    public function GetRepairOrder (Request $request, $id) {
        $repairOrder = RepairOrder::where("repairOrderId", $id)->first();

        if (!$repairOrder)
        {
            return "NotFound";
        }

        return response()->json($repairOrder);
    }
}