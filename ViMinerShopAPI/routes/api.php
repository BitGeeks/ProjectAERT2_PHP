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
    // Route::get('logout', [ApiController::class, 'logout']);
    // Route::get('get_user', [ApiController::class, 'get_user']);
    // Route::get('products', [ProductController::class, 'index']);
    // Route::get('products/{id}', [ProductController::class, 'show']);
    // Route::post('create', [ProductController::class, 'store']);
    // Route::put('update/{product}',  [ProductController::class, 'update']);
    // Route::delete('delete/{product}',  [ProductController::class, 'destroy']);
});
