<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ApiController;

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

Route::group(['middleware' => ['jwt.verify']], function() {
    Route::post('users/{id}', [ApiController::class, 'get_user_by_id']);
    Route::put('users/update',  [ApiController::class, 'update_user']);
    Route::put('users/subscription',  [ApiController::class, 'update_subscription']);
    Route::get('users/records/all',  [ApiController::class, 'get_user_records']);
    Route::get('users/records/count',  [ApiController::class, 'get_user_records_count']);
    Route::post('users/register/validate',  [ApiController::class, 'validate_user']);
    Route::post("/users/referrals/create", [ApiController::class, 'create_referral_code']);
    Route::get("/users/referrals/all", [ApiController::class, 'list_all_referral']);
    Route::get("/users/stats/point", [ApiController::class, 'get_user_stats_points']);
    Route::get("/users/soldoutnotify", [ApiController::class, 'set_new_product_notify']);

    Route::get("useraddresses", [UserAddressController::class, 'get_user_address']);
    Route::get("useraddresses/{id}", [UserAddressController::class, 'get_user_address_by_id']);
    Route::put("useraddresses/update", [UserAddressController::class, 'update_user_address']);
    Route::get("useraddresses", [UserAddressController::class, 'get_user_address']);
    Route::post("setdefault", [UserAddressController::class, 'set_default']);
});
