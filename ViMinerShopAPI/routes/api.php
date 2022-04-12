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
use App\Http\Controllers\VMSConvertController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\PaymentProviderController;
use App\Http\Controllers\ProductInventoriesController;
use App\Http\Controllers\RecoverController;
use App\Http\Controllers\RepairOrderController;
use App\Http\Controllers\RepairsController;
use App\Http\Controllers\AdminController;

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
    
Route::post("recovery/request", [RecoverController::class, 'GetUserRecoveryCode']);
Route::post("recovery/verify", [RecoverController::class, 'PostUserRecovery']);
Route::post("recovery/change", [RecoverController::class, 'PostUserRecovery2']);

Route::group(['middleware' => ['jwt.verify']], function() {
    Route::get('users', [ApiController::class, 'get_user_info']);
    Route::put('users/update',  [ApiController::class, 'update_user']);
    Route::put('users/subscription',  [ApiController::class, 'update_subscription']);
    Route::get('users/records/all',  [ApiController::class, 'get_user_records']);
    Route::get('users/records/count',  [ApiController::class, 'get_user_records_count']);
    Route::post('users/register/validate',  [ApiController::class, 'validate_user']);
    Route::post("users/referrals/create", [ApiController::class, 'create_referral_code']);
    Route::get("users/referrals/all", [ApiController::class, 'list_all_referral']);
    Route::get("users/stats/point", [ApiController::class, 'get_user_stats_points']);
    Route::post("users/soldoutnotify", [ApiController::class, 'set_new_product_notify']);

    Route::get("useraddresses", [UserAddressController::class, 'get_user_address']);
    Route::get("useraddresses/{id}", [UserAddressController::class, 'get_user_address_by_id']);
    Route::put("useraddresses/update", [UserAddressController::class, 'update_user_address']);
    Route::get("useraddresses", [UserAddressController::class, 'get_user_address']);
    Route::post("useraddresses/setdefault", [UserAddressController::class, 'set_default']);
    Route::post("useraddresses/add", [UserAddressController::class, 'user_address_add']);

    Route::get("shippingmethods/all", [ShippingMethodsController::class, 'GetShippingMethod']);
    Route::get("shippingmethods/flag/{flag}", [ShippingMethodsController::class, 'GetShippingMethodByFlag']);

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
    Route::get("cart/orders", [CartController::class, 'GetOrders']);
    Route::post("cart/decrement", [CartController::class, 'DecrementCartItem']);
    Route::post("cart/get/{id}", [CartController::class, 'GetCartItem']);
    Route::post("cart/create", [CartController::class, 'PostCartItem']);
    Route::delete("cart/remove/{id}", [CartController::class, 'DeleteCartItem']);
    Route::post("cart/coupon", [CartController::class, 'ToggleCoupon']);

    Route::get("order/all/{type}", [OrderController::class, 'GetAllOrderByType']);
    Route::get("order", [OrderController::class, 'GetOrderDetails']);
    Route::get("order/unpaid", [OrderController::class, 'GetUnpaidOrder']);
    Route::get("order/pending", [OrderController::class, 'GetPendingOrder']);
    Route::get("order/unshipped", [OrderController::class, 'GetUnshippedOrder']);
    Route::get("order/shipping", [OrderController::class, 'GetShippingOrder']);
    Route::get("order/shipped", [OrderController::class, 'GetShippedOrder']);
    Route::get("order/expired", [OrderController::class, 'GetExpiredOrder']);
    Route::get("order/count", [OrderController::class, 'GetAllOrderCount']);
    Route::get("order/countType/{type}", [OrderController::class, 'GetAllOrderCountByType']);
    Route::post("order/userPaymentPaypal", [OrderController::class, 'OnUserPaymentPaypal']);
    Route::post("order/userPaymentMaxMines", [OrderController::class, 'OnUserPaymentMaxMines']);
    Route::put("order/paymentsetup", [OrderController::class, 'PutOrderDetail']);
    Route::get("order/couponCount/{type}", [OrderController::class, 'GetCouponCount']);
    Route::get("order/availableCoupon", [OrderController::class, 'GetAvailableCoupon']);
    Route::get("order/usedCoupon", [OrderController::class, 'GetUsedCoupon']);
    Route::get("order/expiredCoupon", [OrderController::class, 'GetExpiredCoupon']);
    
    Route::get("paymentproviders/providers", [PaymentProviderController::class, 'GetPaymentProvider']);
    Route::get("paymentproviders/{id}", [PaymentProviderController::class, 'GetPaymentProviderID']);
    
    Route::get("productinventories/all", [ProductInventoriesController::class, 'GetProductInventories']);
    Route::get("productinventories/info/{id}", [ProductInventoriesController::class, 'GetProductInventory']);

    Route::get("repairorder/all", [RepairOrderController::class, 'GetRepairOrders']);
    Route::post("repairorder/onPaymentPaypal", [RepairOrderController::class, 'OnPaymentPaypal']);
    Route::get("repairorder/count/{type}", [RepairOrderController::class, 'GetRepairOrderCount']);
    Route::post("repairorder/{id}", [RepairOrderController::class, 'GetRepairOrder']);

    Route::get("repairs/all", [RepairsController::class, 'GetRepairs']);
    Route::get("repairs/search/{queryString}", [RepairsController::class, 'GetRepair']);
    Route::get("repairs/count/{type}", [RepairsController::class, 'GetRepairCount']);
    Route::get("repairs/type", [RepairsController::class, 'GetRepairByType']);
    Route::get("repairs/site/all", [RepairsController::class, 'GetAllRepairSites']);
    Route::get("repairs/ticket/{id}", [RepairsController::class, 'GetAllRepairTicket']);
    Route::post("repairs/updateTicket/{id}", [RepairsController::class, 'updateTicket']);
    Route::post("repairs/submitTicket", [RepairsController::class, 'submitTicket']);
    Route::delete("repairs/remove/{type}", [RepairsController::class, 'DeleteRepair']);
    
    Route::get("admin", [AdminController::class, 'GetRoleVars']);
    // Route::get("admin", [AdminController::class, 'GetRoleVar']);
    Route::put("admin/{id}", [AdminController::class, 'PutRoleVar']);
    Route::post("admin", [AdminController::class, 'PostRoleVar']);
    Route::get("admin/users/list", [AdminController::class, 'GetUserList']);
    Route::get("admin/users/count", [AdminController::class, 'GetUserListCount']);
    Route::get("admin/roles/list", [AdminController::class, 'GetRoleList']);
    Route::get("admin/homeslide/all", [AdminController::class, 'GetAllHomeSlide']);
    Route::post("admin/homeslide/add", [AdminController::class, 'AddHomeSlideImage']);
    Route::post("admin/homeslide/edit/{id}", [AdminController::class, 'EditHomeSlideImage']);
    Route::post("admin/homeslide/remove/{id}", [AdminController::class, 'RemoveHomeSlideImage']);
    Route::post("admin/3notify/edit", [AdminController::class, 'EditHPNotice']);
    Route::post("admin/users/editPermission/{id}", [AdminController::class, 'UpdateUserRole']);
    Route::get("admin/inventories/list", [AdminController::class, 'GetListInventories']);
    Route::get("admin/repairs/count", [AdminController::class, 'GetRepairCount']);
    Route::get("admin/repairs/list", [AdminController::class, 'GetListRepairs']);
    Route::get("admin/repairs/type/{type}", [AdminController::class, 'GetListRepairsByType']);
    Route::post("admin/repairs/edit/{id}", [AdminController::class, 'UpdateRepairTicketStatus']);
    Route::post("admin/repairorder/update/{id}", [AdminController::class, 'UpdateRepairOrder']);
    Route::get("admin/inventories/edit/{id}", [AdminController::class, 'EditInventory']);
    Route::get("admin/algorithms/count", [AdminController::class, 'GetListAlgorithmsCount']);
    Route::get("admin/algorithms/list", [AdminController::class, 'GetListAlgorithms']);
    Route::post("admin/productimage/remove", [AdminController::class, 'RemoveProductImage']);
    Route::post("admin/products/edit/{id}", [AdminController::class, 'EditProduct']);
    Route::post("admin/products/toggleActive/{id}", [AdminController::class, 'ToggleActiveProduct']);
    Route::get("admin/products/count", [AdminController::class, 'GetProductCount']);
    Route::get("admin/products/all", [AdminController::class, 'GetProductList']);
    Route::post("admin/products/add", [AdminController::class, 'AddProduct']);
    Route::post("admin/inventories/add", [AdminController::class, 'AddInventory']);
    Route::post("admin/categories/add", [AdminController::class, 'AddCategory']);
    Route::post("admin/categories/edit/{id}", [AdminController::class, 'EditCategory']);
    Route::post("admin/algorithms/add", [AdminController::class, 'AddAlgorithm']);
    Route::post("admin/algorithms/edit/{id}", [AdminController::class, 'EditAlgorithm']);
    Route::post("admin/repairsites/add", [AdminController::class, 'AddRepairSite']);
    Route::get("admin/repairsites/count", [AdminController::class, 'GetAllRepairSiteCount']);
    Route::get("admin/repairsites/list", [AdminController::class, 'GetRepairSite']);
    Route::post("admin/repairsites/toggleActive/{code}", [AdminController::class, 'ToggleRepairSiteActive']);
    Route::post("admin/repairsites/edit/{code}", [AdminController::class, 'EditRepairSite']);
    Route::post("admin/shipping/add", [AdminController::class, 'AddShipping']);
    Route::post("admin/shipping/edit/{id}", [AdminController::class, 'EditShipping']);
    Route::post("admin/orders/edit/{id}", [AdminController::class, 'EditOrderStatus']);
    Route::get("admin/orders/chart", [AdminController::class, 'GetAllChartData']);
    Route::get("admin/transaction/list", [AdminController::class, 'GetAllTransaction']);
    Route::get("admin/transaction/count", [AdminController::class, 'GetAllTransactionCount']);
    Route::get("admin/shippingmethods/count", [AdminController::class, 'GetShippingMethodCount']);
    Route::get("admin/shippingmethods/list", [AdminController::class, 'GetShippingMethodList']);
    Route::get("admin/orders/{type}", [AdminController::class, 'GetOrdersByType']);
    Route::get("admin/orders/count/{type}", [AdminController::class, 'GetOrderCount']);

    Route::post('users/{id}', [ApiController::class, 'get_user_by_id']);
});

Route::get("vms/convert", [VMSConvertController::class, 'convertFunc']);