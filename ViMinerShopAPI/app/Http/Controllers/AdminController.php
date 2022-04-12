<?php

namespace App\Http\Controllers;

use App\Models\RoleVar;
use App\Models\User;
use Illuminate\Http\Request;
use App\Models\SlideImage;
use App\Models\HPNotice;
use App\Models\ProductInventory;
use App\Models\Repair;
use App\Models\RepairOrder;
use App\Models\Algorithm;
use App\Models\ProductImage;
use App\Models\Product;
use App\Models\ProductCategory;
use App\Models\RepairSite;
use App\Models\ShippingMethod;
use App\Models\OrderDetail;

class AdminController extends Controller
{
    public function GetRoleVars (Request $request) {
        $results = RoleVar::get();

        return response()->json($results);
    }

    public function GetRoleVar (Request $request, $id) {
        $rolevar = RoleVar::where("Id", $id)->first();

        if (!$rolevar)
        {
            return "NotFound";
        }

        return response()->json($rolevar);
    }

    public function PutRoleVar (Request $request, $id) {
        // under development
    }

    public function PostRoleVar (Request $request) {
        // under development
    }

    public function GetUserList (Request $request) {
        $user = $request->userData;

        $userList = User::get();


        if ($request->page != null && $request->size != null) {
            $userList = User::skip($request->page * $request->size)
                            ->take($request->size)
                            ->get();

            return $userList;

        }

        return response()->json($userList);
    }

    public function GetUserListCount (Request $request) {
        $userList = User::get();

        return response()->json($userList);
    }

    public function GetRoleList (Request $request) {
        $rolelist = RoleVar::get();

        return response()->json($rolelist);
    }

    public function GetAllHomeSlide (Request $request) {
        $simage = SlideImage::get();

        return response()->json($simage);
    }

    public function AddHomeSlideImage (Request $request) {
        $slideImg = [
            Name => $request->name,
            FillColor => $request->fillColor,
            ImgUrl => $request->imgUrl,
            JumpTo => $request->jumpTo
        ];

        SlideImage::insert($slideImg);

        return "";
    }

    public function EditHomeSlideImage (Request $request, $id) {
        $slideImg = SlideImage::where("Id", $id)->first();

        $slideImg->Name = $request->name;
        $slideImg->FillColor = $request->fillColor;
        $slideImg->ImgUrl = $request->imgUrl;
        $slideImg->JumpTo = $request->jumpTo;

        SlideImage::where("Id", $slideImg->Id)->update($slideImg);

        return "";
    }

    public function RemoveHomeSlideImage (Request $request, $id) {
        SlideImage::where("Id", $id)->delete();

        return "";
    }

    public function EditHPNotice (Request $request) {
        $notices = HPNotice::get();

        HPNotice::where("Id", $notices[0]->Id)->update(["Content" => $request->notify1]);
        HPNotice::where("Id", $notices[1]->Id)->update(["Content" => $request->notify2]);
        HPNotice::where("Id", $notices[2]->Id)->update(["Content" => $request->notify3]);

        return "";
    }

    public function UpdateUserRole (Request $request, $id) {
        $userCheck = User::where("id", $id);

        if (!$userCheck) return "NotFound";

        $userCheck->RoleVar_Id = $request->role_id;
        User::where("id", $userCheck)->update($userCheck);

        return "";
    }

    public function GetListInventories (Request $request) {
        $BanViYeuBanDiuQuaDiThoy = ProductInventory::get();

        if ($request->page != null && $request->size != null)
            $BanViYeuBanDiuQuaDiThoy = ProductInventory::skip($request->page * $request->size)
                ->take($request->size)
                ->orderBy("Id", "DESC")->get();

        return response()->json($BanViYeuBanDiuQuaDiThoy);
    }

    public function GetRepairCount (Request $request) {
        $repairCount = Repair::count();

        return response()->json($repairCount);
    }

    public function GetListRepairs (Request $request) {
        $repairs = Repair::get();

        if ($request->page != null && $request->size != null)
            $repairs = Repair::skip($request->page * $request->size)
                    ->take($request->size)
                    ->orderBy("Id", "DESC")
                    ->get();

        return response()->json($repairs);
    }

    public function GetListRepairsByType (Request $request, $type) {
        $repair = Repair::with(["repairorder", "repairitem", "repairsite"])
                    ->where("Id", "!=", 0);

        if ($type != 0) $repair = $repair->where("Status", $type - 1);
        if ($paginate->page != null && $paginate->size != null)
            $repair = $repair
                    ->skip($paginate->page * $paginate->size)
                    ->take($paginate->size)
                    ->orderBy("Id", "DESC");

        return response()->json($repair);
    }

    public function UpdateRepairTicketStatus (Request $request, $id) {
        $repair = Repair::where("Id", $id)->first();

        if ($repair == null) return "NotFound";

        $repair->Status = $request->status;

        Repair::where("Id", $repair->Id)->update($repair);

        $customer = User::where("Id", $repair->User_id);

        if (!$customer) return "NotFound";

//         EmailModel template = new EmailModel()
//         {
//             EmailFrom = "vi@maxmines.com",
//             EmailTo = customer.Email,
//             CustomerUsername = customer.Username,
//             Subject = "[Vĩ Miner Shop - Collab] Phiếu sữa chữa mã số " + repair.Id + " có cập nhật!",
//             Body = @"
// <div>Xin chào " + user.Email + "," +
// "<br /><div>Phiếu sửa chữa mã số <strong>#" + repair.Id + "</strong> của bạn vừa được cập nhật trạng thái mới! Vui lòng truy cập trang chi tiết danh sách phiếu sữa chữa đã gửi và xem trạng thái sửa chữa <a href=\"http://miner.2cll.com/account/repair/tickets\">tại đây</a>.</div><br />"
//         };

        return response()->json($repair);
    }

    public function UpdateRepairOrder (Request $request, $id) {
        $repair = RepairOrder::where("Repair_id", $id)->first();

        if (!$repair)
        {
            $PaymentDetail = [
                "Amount" => $request->price,
                "Provider" => 0,
                "Status" => 2,
                "ReferralBy" => null,
                "Created_at" => \Carbon\Carbon::now(),
                "Updated_at" => \Carbon\Carbon::now()
            ];
            $PaymentDetail = PaymentDetail::insert($PaymentDetail);

            $repairOrder = [
                "Repair_id" => id,
                "Status" => $request->repairOrderStatus,
                "Provider" => 0,
                "Price" => $request->price,
                "Payment_id" => $PaymentDetail->Id,
                "Created_at" => \Carbon\Carbon::now(),
                "Updated_at" => \Carbon\Carbon::now()
            ];
            RepairOrder::insert($repairOrder);

            return response()->json($repairOrder);
        } else
        {
            $repair->Status = $request->repairOrderStatus;
            $repair->Price = $request->price;
            Repair::where("Id", $repair->Id)->update($repair);

            return response()->json(repair);
        }
    }

    public function EditInventory (Request $request, $id) {
        $inventory = ProductInventory::where("Id", $id);

        $inventory->Quantity = $request->quantity;
        $inventory->Flag = $request->flag;
        $inventory->Hps = $request->hps;
        $inventory->weight = $request->weight;
        $inventory->ShippingInfo = $request->shippingInfo;
        $inventory->Updated_at = \Carbon\Carbon::now();

        ProductInventory::where("Id", $id)->update($inventory);

        return response()->json($inventory);
    }

    public function GetListAlgorithmsCount (Request $request) {
        $counter = Algorithm::count();

        return response()->json($counter);
    }

    public function GetListAlgorithms (Request $request) {
        $algorithm = Algorithm::get();

        if ($request->page != null)
            $algorithm = Algorithm::skip($request->page * $request->size)
                ->take($request->size)->get();

        return response()->json($algorithm);
    }

    public function RemoveProductImage (Request $request) {
        $productImage = ProductImage::where("Product_Id", $request->ProductID)
                    ->where("ImageUrl", $request->ImageUrl)
                    ->first();

        if (!$productImage) return "NotFound";

        ProductImage::where("Id", $productImage->Id)->delete();

        return "";
    }

    public function EditProduct (Request $request, $id) {
        $product = Product::with("productinventory")
                ->where("Id", $id)
                ->first();

        if (!$product) return "NotFound";

        $inventory = ProductInventory::where("Id", $product->productinventory->Id);

        foreach ($request->productImage as $imageObj)
        {
            $productImage = ProductImage::
                where("Product_Id", $product->Id)
                ->where("ImageUrl", $imageObj->ImageUrl)
                ->first();

            if (!$productImage)
            {
                $image = [
                    "Product_Id" => $product->Id,
                    "Alt_Name" => $imageObj->alt_Name,
                    "ImageUrl" => $imageObj->imageUrl,
                    "Created_at" => \Carbon\Carbon::now(),
                    "Updated_at" => \Carbon\Carbon::now()
                ];
                ProductImages::insert($image);
            }
        }

        $product->Name = $request->name;
        $product->Desc = $request->desc;
        $product->DetailDesc = $request->detailDesc;
        $product->NoteDesc = $request->noteDesc;
        $product->PaymentDesc = $request->paymentDesc;
        $product->WarrantyDesc = $request->warrantyDesc;
        $product->SKU = $request->sku;
        $product->Category_id = $request->category_id;
        $product->Algorithm_id = $request->algorithm_id;
        $product->Price = $request->price;
        $product->PricePromotion = $request->pricePromotion;
        //$product->isActive = $request->isActive;
        $product->Updated_at = \Carbon\Carbon::now();

        $inventory->Quantity = $request->quantity;
        $inventory->Flag = $request->flag;
        $inventory->Hps = $request->hps;
        $inventory->weight = $request->weight;
        $inventory->ShippingInfo = $request->shippingInfo;
        $inventory->Updated_at = \Carbon\Carbon::now();

        Product::where("Id", $product->Id)->update($product);
        ProductInventory::where("Id", $inventory->Id)->update($inventory);

        return response()->json($product);
    }

    public function ToggleActiveProduct (Request $request, $id) {
        $product = Product::with("productinventory")
                ->where("Id", $id)
                ->first();

        if (!$product) return "NotFound";

        $product->isActive = !$product->isActive;

        Product::where("Id", $id)->update($product);

        return response()->json($product);
    }

    public function GetProductCount (Request $request) {
        $product = Product::with(["productinventory", "productcategory", "productimages"])
            ->count();

        return response()->json($product);
    }

    public function GetProductList (Request $request) {
        $product = Product::with(["productinventory", "productcategory", "productimages"])
            ->skip($request->size * $request->page)
            ->take($request->size)
            ->orderBy("Id", "DESC")
            ->get();

        return response()->json($product);
    }

    public function AddProduct (Request $request) {
        $ProductInventory = [
            "Quantity" => $request->quantity,
            "Flag" => $request->flag,
            "Hps" => $request->hps,
            "weight" => $request->weight,
            "ShippingInfo" => $request->shippingInfo,
            "Created_at" => \Carbon\Carbon::now(),
            "Updated_at" => \Carbon\Carbon::now()
        ];
        $ProductInventoryId = ProductInventory::insertGetId($ProductInventory);

        $product = [
            "Name" => $request->name,
            "Desc" => $request->desc,
            "DetailDesc" => $request->detailDesc,
            "NoteDesc" => $request->noteDesc,
            "PaymentDesc" => $request->paymentDesc,
            "WarrantyDesc" => $request->warrantyDesc,
            "SKU" => $request->sku,
            "Category_id" => $request->category_id,
            "Inventory_id" => $ProductInventoryId,
            "Algorithm_id" => $request->algorithm_id,
            "Price" => $request->price,
            "PricePromotion" => $request->pricePromotion,
            "isActive" => true,
            "Created_at" => \Carbon\Carbon::now(),
            "Updated_at" => \Carbon\Carbon::now()
        ];

        $productId = Product::insertGetId($product);

        foreach ($request->productImage as $imageObj)
        {
            $productImage = ProductImage::where([
                "Product_Id" => $productId,
                "ImageUrl" => $imageObj->imageUrl
            ])->first();

            if (!$productImage)
            {
                $image = [
                    "Product_Id" => $productId,
                    "Alt_Name" => $imageObj->alt_Name,
                    "ImageUrl" => $imageObj->imageUrl,
                    "Created_at" => \Carbon\Carbon::now(),
                    "Updated_at" => \Carbon\Carbon::now()
                ];
                ProductImage::insert($image);
            }
        }

        return response()->json($product);
    }

    public function GetProduct (Request $request) {
        // under development
    }

    public function AddInventory (Request $request) {
        $inventory = [
            "Quantity" => $request->quantity,
            "Flag" => $request->flag,
            "Hps" => $request->hps,
            "weight" => $request->weight,
            "ShippingInfo" => $request->shippingInfo,
            "Created_at" => \Carbon\Carbon::now(),
            "Updated_at" => \Carbon\Carbon::now()
        ];
        ProductInventory::insert($inventory);

        return response()->json($inventory);
    }

    public function GetInventory (Request $request) {
        // under development
    }

    public function AddCategory (Request $request) {
        $category = [
            "Name" => $request->name,
            "Desc" => $request->desc,
            "Image" => $request->image,
            "Slug" => $request->slug,
            "Created_at" => \Carbon\Carbon::now(),
            "Updated_at" => \Carbon\Carbon::now()
        ];
        ProductCategory::insert($category);

        return response()->json($category);
    }

    public function EditCategory (Request $request, $id) {
        $category = ProductCategory::where("Id", $id);

        $category->Name = $request->name;
        $category->Desc = $request->desc;
        $category->Image = $request->image;
        $category->Slug = $request->slug;
        $category->Updated_at = \Carbon\Carbon::now();

        $category->save();

        return response()->json($category);
    }

    public function GetCategory (Request $request) {
        // under development
    }

    public function AddAlgorithm (Request $request) {
        $algorithm = [
            "Name" => $request->name,
            "Desc" => $request->desc,
            "Slug" => $request->slug,
            "Created_at" => \Carbon\Carbon::now(),
            "Updated_at" => \Carbon\Carbon::now()
        ];
        Algorithm::insert($algorithm);

        return response()->json($algorithm);
    }

    public function EditAlgorithm (Request $request, $id) {
        $algorithm = Algorithm::where("Id", $id)
            ->first();

        if (!$algorithm) return "NotFound";

        $algorithm->Name = $request->name;
        $algorithm->Desc = $request->desc;
        $algorithm->Slug = $request->slug;
        $algorithm->Updated_at = DateTime.Now;

        Algorithm::where("Id", $algorithm->Id)->update($algorithm);

        return response()->json($algorithm);
    }

    public function GetAlgorithm (Request $request) {
        // under development
    }

    public function AddRepairSite (Request $request) {
        $site = [
            "Code" => $request->code,
            "Name" => $request->name,
            "ExtraInfo" => $request->extraInfo,
            "Note" => $request->note,
            "Location" => $request->location,
            "isDisabled" => false
        ];
        RepairSite::insert($site);

        return response()->json($site);
    }

    public function GetAllRepairSiteCount (Request $request) {
        $siteCount = RepairSite::count();

        return response()->json($siteCount);
    }

    public function GetRepairSite (Request $request) {
        $site = RepairSite::skip($request->page * $request->size)
                ->take($request->size)
                ->get();
        return response()->json($site);
    }

    public function ToggleRepairSiteActive (Request $request, $code) {
        $site = RepairSite::where("Code", $code)->first();

        if (!$site) return "NotFound";

        $site->isDisabled = !$site->isDisabled;

        RepairSite::where("Code", $code)->update($site);

        return response()->json($site);
    }

    public function EditRepairSite (Request $request, $code) {
        $site = RepairSite::where("Code", $code)->first();

        if (!$site) return "NotFound";

        $site->Code = $request->code;
        $site->Name = $request->name;
        $site->ExtraInfo = $request->extraInfo;
        $site->Note = $request->note;
        $site->Location = $request->location;

        RepairSite::where("Code", $code)->update($site);

        return response()->json($site);
    }

    public function AddShipping (Request $request) {
        $method = [
            "Name" => $request->name,
            "ShortName" => $request->shortName,
            "repairFlag" => $request->repairFlag,
            "salesFlag" => $request->salesFlag,
            "supportFreeShip" => $request->supportFreeShip,
            "erpCode" => $request->erpCode,
            "logoUrl" => $request->logoUrl,
            "avgfeeperkm" => $request->avgfeeperkm
        ];
        ShippingMethod::insert($method);

        return response()->json($method);
    }

    public function EditShipping (Request $request, $id) { // shipping/edit/{id}
        $method = ShippingMethod::where("Id", $id)->first();

        $method->Name = $request->name;
        $method->ShortName = $request->shortName;
        $method->repairFlag = $request->repairFlag;
        $method->salesFlag = $request->salesFlag;
        $method->supportFreeShip = $request->supportFreeShip;
        $method->erpCode = $request->erpCode;
        $method->logoUrl = $request->logoUrl;
        $method->avgfeeperkm = $request->avgfeeperkm;

        ShippingMethod::where("Id", $method->Id)->update($method);

        return response()->json($method);
    }

    public function GetShippingMethod (Request $request) {
        // under development
    }

    public function GetOrdersByType (Request $request, $type) {
        $orders = OrderDetail::with("paymentdetail");

        $thirty = \Carbon\Carbon::now();
        $thirty->subDays(30);
        
        if ($type == 1) $orders = $orders->where("paymentdetail.Status", 0);
        elseif ($type == 2) $orders = $orders->where("paymentdetail.Status", 1);
        elseif ($type == 3) $orders = $orders->where("paymentdetail.Status", 2);
        elseif ($type == 4) $orders = $orders->where("paymentdetail.Status", 3);
        elseif ($type == 5) $orders = $orders->where("paymentdetail.Status", 5);
        elseif ($type == 6) $orders = $orders->where("Created_at", "<", $thirty);

        $orders = $orders->skip($request->page * $request->size)
                    ->take($request->size)
                    ->orderBy("Id", "DESC")
                    ->get();

        return response()->json($orders);
    }

    public function GetOrderCount (Request $request) {
        $orders = OrderDetail::with("paymentdetail");

        $thirty = \Carbon\Carbon::now();
        $thirty->subDays(30);
        
        if ($type == 1) $orders = $orders->where("paymentdetail.Status", 0);
        elseif ($type == 2) $orders = $orders->where("paymentdetail.Status", 1);
        elseif ($type == 3) $orders = $orders->where("paymentdetail.Status", 2);
        elseif ($type == 4) $orders = $orders->where("paymentdetail.Status", 3);
        elseif ($type == 5) $orders = $orders->where("paymentdetail.Status", 5);
        elseif ($type == 6) $orders = $orders->where("Created_at", "<", $thirty);

        $orders = $orders->skip($request->page * $request->size)
                    ->take($request->size)
                    ->orderBy("Id", "DESC")
                    ->count();

        return response()->json($orders);
    }

    public function EditOrderStatus (Request $request, $id) {
        $orderDetails = OrderDetail::where("Id", $id)->first();

        if (!$orderDetails) return "NotFound";

        $paymentDetail = PaymentDetail::where("Id", $orderDetails->Payment_id)->first();

        if (!$paymentDetail) return "NotFound";

        $paymentDetail->Status = $request->status;
        $paymentDetail->Updated_at = \Carbon\Carbon::now();

        PaymentDetail::where("Id", $paymentDetail->Id)->update($paymentDetail);

//         EmailModel template = new EmailModel()
//         {
//             EmailFrom = "vi@maxmines.com",
//             EmailTo = customer.Email,
//             CustomerUsername = customer.Username,
//             Subject = "[Vĩ Miner Shop - Collab] Đơn hàng mã số " + orderDetails.Id + " có cập nhật!",
//             Body = @"
// <div>Xin chào " + user.Email + "," +
// "<br /><div>Đơn đặt hàng mã số <strong>#" + orderDetails.Id + "</strong> của bạn vừa được cập nhật trạng thái mới! Vui lòng truy cập trang chi tiết danh sách đơn hàng để xem trạng thái được cập nhật <a href=\"http://miner.2cll.com/account/orders\">tại đây</a>.</div><br />"
//         };

        return "";
    }

    public function GetAllChartData (Request $request) {
        $orderDetails = OrderDetail::with(["orderitems", "paymentdetail"])->get();
        
        $miner = Product::with("productinventory")
                ->join("productinventories", "productinventories.id", "=", "products.id")
                ->select([
                    'productinventories.Id', 'productinventories.Quantity', 'productinventories.Flag', 'productinventories.Hps', 'productinventories.weight', 'productinventories.ShippingInfo', 'productinventories.Created_at', 'productinventories.Updated_at'
                ])
                ->get();

        if (count($orderDetails) == 0) return "NotFound";

        $totalincome = 0;
        $totalminer = 0;

        foreach ($orderDetails as $orderCalculate) {
            $totalincome += $orderCalculate->paymentdetail->Amount;
        }

        foreach ($miner as $minerCalc) {
            $totalminer += $minerCalc->Quantity;
        }

        $DashboardModelData = [
            "orderHistory" => $orderDetails,
            "totalIncome" => $totalincome,
            "totalOrder" => count($orderDetails),
            "totalMiner" => $totalminer
        ];

        return response()->json($DashboardModelData);
    }

    public function GetAllTransaction (Request $request) {
        $result = OrderDetail::with("paymentdetail")
                ->select("paymentdetail")
                ->where("Status", "!=", 0)
                ->skip($request->page * $request->size)
                ->take($request->size)
                ->orderBy("Id", "DESC")
                ->get();

        return response()->json($result);
    }

    public function GetAllTransactionCount (Request $request) {
        $result = OrderDetail::with("paymentdetail")
                ->select("paymentdetail")
                ->where("Status", "!=", 0)
                ->skip($request->page * $request->size)
                ->take($request->size)
                ->orderBy("Id", "DESC")
                ->count();

        return response()->json($result);
    }

    public function GetShippingMethodCount (Request $request) {
        $resultCounter = ShippingMethod::get();

        return response()->json($resultCounter);
    }

    public function GetShippingMethodList (Request $request) {
        $result = ShippingMethod::
            skip($request->size * $request->page)
            ->take($request->size)
            ->orderBy("Id", "DESC")
            ->get();

        return response()->json($result);
    }
}