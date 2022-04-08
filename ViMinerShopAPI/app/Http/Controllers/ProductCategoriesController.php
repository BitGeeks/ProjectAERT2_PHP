<?php

namespace App\Http\Controllers;

use App\Models\ProductCategory;
use Illuminate\Http\Request;

class ProductCategoriesController extends Controller
{
    public function GetProductCategories (Request $request) {
        $results = ProductCategory::get();

        return response()->json($results);
    }
}