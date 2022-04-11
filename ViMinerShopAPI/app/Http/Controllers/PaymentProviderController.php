<?php

namespace App\Http\Controllers;

use App\Models\PaymentProvider;
use Illuminate\Http\Request;

class PaymentProviderController extends Controller
{
    public function GetPaymentProvider (Request $request) {
        $results = PaymentProvider::get();

        return response()->json($results);
    }

    public function GetPaymentProviderID (Request $request, $id) {
        $paymentProvider = PaymentProvider::where("Id", $id)
            ->first();

        if ($paymentProvider == null)
            return "NotFound";

        return response()->json($paymentProvider);
    }
}