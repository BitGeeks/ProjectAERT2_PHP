<?php

namespace App\Http\Controllers;

use App\Models\Algorithm;
use Illuminate\Http\Request;

class AlgorithmsController extends Controller
{
    public function GetAlgorithms (Request $request) {
        $results = Algorithm::get();

        return response()->json($results);
    }
}