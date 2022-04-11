<?php

namespace App\Http\Controllers;

use App\Models\ShippingMethod;
use Illuminate\Http\Request;

class ShippingMethodsController extends Controller
{
    public function GetShippingMethod (Request $request) {
        $results = ShippingMethod::get();

        return response()->json($results);
    }

    public function GetShippingMethodByFlag (Request $request, $flag) {
        $sm = ShippingMethod::where("Id", "!=", -1);

        if ($flag == "repair")
            $sm = $sm->where("repairFlag", "1");
        else if ($flag == "sale")
            $sm = $sm->where("salesFlag", "1");

        return response()->json($sm->get());
    }
}