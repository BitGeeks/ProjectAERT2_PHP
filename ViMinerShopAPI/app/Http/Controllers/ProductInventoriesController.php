<?php

namespace App\Http\Controllers;

use App\Models\ProductInventory;
use Illuminate\Http\Request;

class ProductInventoriesController extends Controller
{
    public function GetProductInventories (Request $request) {
        $results = ProductInventory::get();

        return response()->json($results);
    }

    public function GetProductInventory (Request $request, $id) {
        $productInventory = ProductInventory::where("Id", $id)
            ->first();

        if ($productInventory == null)
            return "NotFound";

        return response()->json($productInventory);
    }
}