<?php

namespace App\Http\Controllers;

use App\Models\HPNotice;
use App\Models\ProductCategory;
use App\Models\Algorithm;
use Illuminate\Http\Request;

class HPNoticesController extends Controller
{
    public function GetHPNotice (Request $request) {
        $results = HPNotice::get();

        return response()->json($results);
    }
}