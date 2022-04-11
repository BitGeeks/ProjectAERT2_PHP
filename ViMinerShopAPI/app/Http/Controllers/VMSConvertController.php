<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Tymon\JWTAuth\Exceptions\JWTException;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Validator;
use App\Models\ProductInventory;
use App\Models\Algorithm;
use App\Models\HPNotice;
use App\Models\PaymentProvider;

class VMSConvertController extends Controller {
    function convertFunc (Request $request) {
        return response()->json(PaymentProvider::get());
    }
}