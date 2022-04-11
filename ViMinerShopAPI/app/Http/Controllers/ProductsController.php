<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\ProductCategory;
use App\Models\Algorithm;
use Illuminate\Http\Request;

class ProductsController extends Controller
{
    // thêm images
    public function getProducts(Request $request)
    {
        $product = Product::with(["productcategory", "productinventory", "algorithm", "productimages"])
        ->join("productcategories", "products.Category_id", "=", "productcategories.id")
        ->join("productinventories", "products.Inventory_id", "=", "productinventories.id")
        // ->join("algorithms", "products.Algorithm_id", "=", "algorithms.id")
        ->where("isActive", true);


        if (isset($request->page) && isset($request->size) && ($request->page != 0 || $request->size != 0)) {
            if (isset($request->category)) {
                $category = ProductCategory::where("Name", $request->category)->first();
                $product = $product->where("Category_id", $category->Id);
            }
            if (isset($request->algorithm)) {
                $algorithm = Algorithm::where("Name", "=", $request->algorithm)->first();
                $product = $product->where("Algorithm_id", $algorithm->Id);
            }
            if (isset($request->minPrice) && floatval($request->minPrice) != 0) {
                $product = $product->where(function ($query) {
                    $query->where([
                        ["PricePromotion", 0],
                        ["Price", ">=", floatval($request->minPrice)]
                    ])->orWhere([
                        ["PricePromotion", "!=", 0],
                        ["PricePromotion", ">=", floatval($request->minPrice)]
                    ]);
                });
            }
            if (isset($request->maxPrice) && floatval($request->maxPrice) != 0) {
                $product = $product->where(function ($query) {
                    $query->where([
                        ["PricePromotion", 0],
                        ["Price", "<=", floatval($request->maxPrice)]
                    ])->orWhere([
                        ["PricePromotion", "!=", 0],
                        ["PricePromotion", "<=", floatval($request->maxPrice)]
                    ]);
                });
            }
            if (isset($request->minHashrate) && floatval($request->minHashrate) != 0) {
                $product = $product->where("productinventories.hps", ">=", floatval($request->minHashrate));
            }
            if (isset($request->maxHashrate) && floatval($request->maxHashrate) != 0) {
                $product = $product->where("productinventories.hps", "<=", floatval($request->maxHashrate));
            }
            // under development
            if (isset($request->searchString) && $request->searchString != "") {
                $searchString = strtolower($request->searchString);
                $product = $product->where("Name", "LIKE", "%".$searchString."%");
            }
            if (isset($request->sort) && $request->sort != "any") {
                if ($request->sort == "lowest") {
                    $product = $product->orderBy("Price", "DESC");
                } elseif ($request->sort == "highest") {
                    $product = $product->orderBy("Price", "ASC");
                } elseif ($request->sort == "hlowest") {
                    $product = $product->orderBy("productinventories.hps", "DESC");
                } elseif ($request->sort == "hhighest") {
                    $product = $product->orderBy("productinventories.hps", "ASC");
                } elseif ($request->sort == "wlowest") {
                    $product = $product->orderBy("productinventories.weight", "DESC");
                } elseif ($request->sort == "hlowest") {
                    $product = $product->orderBy("productinventories.weight", "ASC");
                }
            } else {
                $product = $product->orderBy("products.id", "DESC");
            }
            $result = $product->skip($request->page * $request->size)
            ->take($request->size)->get();
            return response()->json($result);
        }
        $result = $product->get();
        return response()->json($result);
    }

    public function SearchProduct (Request $request) {
        if ($request->page != 0 || $request->size != 0) {
            $result = Product::with(["productcategory", "productinventory", "algorithm", "productimages"])
            // ->join("productcategories", "products.Category_id", "=", "productcategories.id")
            // ->join("productinventories", "products.Inventory_id", "=", "productinventories.id")
            // ->join("algorithms", "products.Algorithm_id", "=", "algorithms.id")
            ->where([
                ["isActive", true],
                ["Name", "%".strtolower($request->keyword)."%"]
            ])
            ->orderBy("Id", "DESC")
            ->skip($request->page * $request->size)
            ->take($request->size)
            ->get();
            return response()->json($result);
        }
        $result = Product::with(["productcategory", "productinventory", "algorithm", "productimages"])
            // ->join("productcategories", "products.Category_id", "=", "productcategories.id")
            // ->join("productinventories", "products.Inventory_id", "=", "productinventories.id")
            // ->join("algorithms", "products.Algorithm_id", "=", "algorithms.id")
            ->where("Name", "%".strtolower($request->keyword)."%")
            ->get();
            return response()->json($result);
    }

    public function GetProduct (Request $request, $id) {
        $product = Product::with(["productcategory", "productinventory", "algorithm", "productimages"])
        // ->join("productcategories", "products.Category_id", "=", "productcategories.id")
        // ->join("productinventories", "products.Inventory_id", "=", "productinventories.id")
        // ->join("algorithms", "products.Algorithm_id", "=", "algorithms.id")
        ->where([
            ["isActive", true],
            ["products.Id", $id]
        ])->first();

        if ($product == null)
            return "NotFound";

        return response()->json($product);
    }

    public function GetProductRelated (Request $request, $id) {
        $productTarget = Product::with(["productcategory", "productinventory", "algorithm", "productimages"])
        // ->join("productcategories", "products.Category_id", "=", "productcategories.id")
        // ->join("productinventories", "products.Inventory_id", "=", "productinventories.id")
        // ->join("algorithms", "products.Algorithm_id", "=", "algorithms.id")
        ->where([
            ["isActive", true],
            ["products.Id", $id]
        ])->first();

        $results = Product::with(["productcategory", "productinventory", "algorithm", "productimages"])
        // ->join("productcategories", "products.Category_id", "=", "productcategories.id")
        // ->join("productinventories", "products.Inventory_id", "=", "productinventories.id")
        // ->join("algorithms", "products.Algorithm_id", "=", "algorithms.id")
        ->where([
            ["isActive", true],
            ["products.Id", "!=", $id]
        ])->where(function($query) use($productTarget) {
            $query->where("Category_id", "=", $productTarget->Category_id)
            ->orWhere("Algorithm_id", "=", $productTarget->Algorithm_id)
            ->get();
        })
        ->get();

        return response()->json($results);
    }

    public function GetProductsCount (Request $request) {
        $product = Product::join("productcategories", "products.Category_id", "=", "productcategories.id")
        ->join("productinventories", "products.Inventory_id", "=", "productinventories.id")
        // ->join("algorithms", "products.Algorithm_id", "=", "algorithms.id")
        ->where("isActive", true);

        if ($request->page != 0 || $request->size != 0) {
            if ($request->category != null) {
                $category = ProductCategory::where("Name", "=", $request->category)->first();
                $product = $product->where("Category_id", $category->id);
            }
            if ($request->algorithm != null) {
                $algorithm = Algorithm::where("Name", "=", $request->algorithm)->first();
                $product = $product->where("Algorithm_id", $algorithm->id);
            }
            if (isset($request->minPrice) && floatval($request->minPrice) != 0) {
                $product = $product->where(function ($query) {
                    $query->where([
                        ["PricePromotion", 0],
                        ["Price", ">=", floatval($request->minPrice)]
                    ])->orWhere([
                        ["PricePromotion", "!=", 0],
                        ["PricePromotion", ">=", floatval($request->minPrice)]
                    ]);
                });
            }
            if (isset($request->maxPrice) && floatval($request->maxPrice) != 0) {
                $product = $product->where(function ($query) {
                    $query->where([
                        ["PricePromotion", 0],
                        ["Price", "<=", floatval($request->maxPrice)]
                    ])->orWhere([
                        ["PricePromotion", "!=", 0],
                        ["PricePromotion", "<=", floatval($request->maxPrice)]
                    ]);
                });
            }
            if (isset($request->minHashrate) && floatval($request->minHashrate) != 0) {
                $product = $product->where("productinventories.hps", ">=", floatval($request->minHashrate));
            }
            if (isset($request->maxHashrate) && floatval($request->maxHashrate) != 0) {
                $product = $product->where("productinventories.hps", "<=", floatval($request->maxHashrate));
            }
            // under development
            if (isset($request->searchString) && $request->searchString != "") {
                $searchString = strtolower($request->searchString);
                $product = $product->where("Name", "LIKE", "%".$searchString."%");
            }
            if (isset($request->sort) && $request->sort != "any") {
                if ($request->sort == "lowest") {
                    $product = $product->orderBy("Price", "DESC");
                } elseif ($request->sort == "highest") {
                    $product = $product->orderBy("Price", "ASC");
                } elseif ($request->sort == "hlowest") {
                    $product = $product->orderBy("productinventories.hps", "DESC");
                } elseif ($request->sort == "hhighest") {
                    $product = $product->orderBy("productinventories.hps", "ASC");
                } elseif ($request->sort == "wlowest") {
                    $product = $product->orderBy("productinventories.weight", "DESC");
                } elseif ($request->sort == "hlowest") {
                    $product = $product->orderBy("productinventories.weight", "ASC");
                }
            } else {
                $product = $product->orderBy("id", "DESC");
            }
            $result = $product->skip($request->page * $request->size)
            ->take($request->size)->count();
            return response()->json($result);
        }
        $result = $product->count();
        return response()->json($result);
    }

    public function GetRecentProducts (Request $request) {
        $results = Product::with(["productcategory", "productinventory", "algorithm", "productimages"])
        // ->join("algorithms", "products.Algorithm_id", "=", "algorithms.id")
        ->where("isActive", true)
        ->orderBy("Id", "DESC")
        ->get();

        return response()->json($results);
    }

    public function GetBestMiner (Request $request) {
        $results = Product::with(["productcategory", "productinventory", "algorithm", "productimages"])
        ->join("productinventories", "productinventories.id", "=", "products.Inventory_id")
        // ->join("algorithms", "products.Algorithm_id", "=", "algorithms.id")
        ->where("isActive", true)
        ->orderBy("productinventories.hps", "DESC")
        ->get();

        return response()->json($results);
    }
}
