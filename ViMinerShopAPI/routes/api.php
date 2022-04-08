<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ApiController;
use App\Http\Controllers\UserAddressController;
use App\Http\Controllers\ShippingMethodsController;
use App\Http\Controllers\ProductsController;
use App\Http\Controllers\HPNoticesController;
use App\Http\Controllers\SlideImagesController;
use App\Http\Controllers\ProductCategoriesController;
use App\Http\Controllers\AlgorithmsController;
use App\Http\Controllers\CDonateController;
use App\Http\Controllers\CartController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('users/authenticate', [ApiController::class, 'authenticate']);
Route::post('users/register', [ApiController::class, 'register']);

Route::get("slideimages/all", [SlideImagesController::class, 'get_slide_images']);

Route::get("algorithms/all", [AlgorithmsController::class, 'GetAlgorithms']);

Route::get("hpnotices/all", [HPNoticesController::class, 'GetHPNotice']);

Route::get("productcategories/all", [ProductCategoriesController::class, 'GetProductCategories']);

Route::get("products/all", [ProductsController::class, 'getProducts']);
Route::get("products/search", [ProductsController::class, 'SearchProduct']);
Route::get("products/miner/{id}", [ProductsController::class, 'GetProduct']);
Route::get("products/related/{id}", [ProductsController::class, 'GetProductRelated']);
Route::get("products/count", [ProductsController::class, 'GetProductsCount']);
Route::get("products/newminer", [ProductsController::class, 'GetRecentProducts']);
Route::get("products/bestminer", [ProductsController::class, 'GetBestMiner']);

Route::group(['middleware' => ['jwt.verify']], function() {
    Route::get('users', [ApiController::class, 'get_user_info']);
    Route::post('users/{id}', [ApiController::class, 'get_user_by_id']);
    Route::put('users/update',  [ApiController::class, 'update_user']);
    Route::put('users/subscription',  [ApiController::class, 'update_subscription']);
    Route::get('users/records/all',  [ApiController::class, 'get_user_records']);
    Route::get('users/records/count',  [ApiController::class, 'get_user_records_count']);
    Route::post('users/register/validate',  [ApiController::class, 'validate_user']);
    Route::post("users/referrals/create", [ApiController::class, 'create_referral_code']);
    Route::get("users/referrals/all", [ApiController::class, 'list_all_referral']);
    Route::get("users/stats/point", [ApiController::class, 'get_user_stats_points']);
    Route::get("users/soldoutnotify", [ApiController::class, 'set_new_product_notify']);

    Route::get("useraddresses", [UserAddressController::class, 'get_user_address']);
    Route::get("useraddresses/{id}", [UserAddressController::class, 'get_user_address_by_id']);
    Route::put("useraddresses/update", [UserAddressController::class, 'update_user_address']);
    Route::get("useraddresses", [UserAddressController::class, 'get_user_address']);
    Route::post("useraddresses/setdefault", [UserAddressController::class, 'set_default']);

    Route::get("shippingmethods/all", [ShippingMethodsController::class, 'get_shipping_method_list']);
    Route::get("shippingmethods/flag/{flag}", [ShippingMethodsController::class, 'get_shipping_method_by_flag']);

    Route::get("cdonate/with/{flag}", [CDonateController::class, 'GetCouponDonateBy']);
    Route::get("cdonate/countWith/{flag}", [CDonateController::class, 'CountCouponDonateBy']);
    Route::post("cdonate/transaction", [CDonateController::class, 'PostCouponDonate']);

    Route::get("cart/session", [CartController::class, 'GetSession']);
    Route::get("cart/mc", [CartController::class, 'GetCartItems']);
    Route::post("cart/increment", [CartController::class, 'IncrementCartItem']);
    Route::post("cart/setcartnum", [CartController::class, 'setCartNum']);
    Route::post("cart/confirm", [CartController::class, 'ConfirmCartItem']);
    Route::get("cart/orders/{id}", [CartController::class, 'GetOrderById']);
    Route::post("cart/setshippingpos", [CartController::class, 'SetShippingPos']);
});
