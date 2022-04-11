<?php

namespace App\Http\Controllers;

use App\Models\ProductInventory;
use Illuminate\Http\Request;

class RepairOrderController extends Controller
{
    public function GetRepairOrders (Request $request) {
        // under development
    }

    public function OnPaymentPaypal (Request $request) {
        // under development
    }

    private function afterPaymentSuccessful ($user, $repair, $providerName) {
        // under development
    }

    public function GetRepairOrderCount (Request $request, $type) {
        // under development
    }

    public function GetRepairOrder (Request $request, $id) {
        // under development
    }
}