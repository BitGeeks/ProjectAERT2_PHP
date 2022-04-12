<?php

namespace App\Http\Controllers;

use App\Models\ProductInventory;
use Illuminate\Http\Request;
use App\Models\Repair;
use App\Models\RepairSite;
use App\Models\RepairItem;

class RepairsController extends Controller
{
    public function GetRepairs (Request $request) {
        $user = $request->userData;

        $result = Repair::where(["repairitem", "repairitem.product", "repairitem.product.productcategory", "repairsite"])
        ->where("User_id", $user->id)
        ->orderBy("Id", "DESC")
        ->skip($request->page * $request->size)
        ->take($request->size)
        ->get();

        return response()->json($result);
    }

    public function GetRepair (Request $request, $queryString) {
        $user = $request->userData;

        $ri = Repair::with(["repairitem", "repairitem.product", "repairitem.product.productcategory", "repairsite"])
                ->where("User_id", $user->id)
                ->where(function($query) use($queryString) {
                    $query->where("TrackingNo", "=", $queryString)
                    ->orWhere("Id", "=", $queryString)
                    ->get();
                });

        if ($request->type != -1)
        {
            $ri = $ri->where("Status", $request->type);
        }
        

        $ri = $ri->orderBy("Id", "DESC")->skip($request->page * $request->size)->take($request->size)->get();

        return response()->json($ri);
    }

    public function GetRepairByType (Request $request) {
        $user = $request->userData;

        $ri = Repair::with(["repairitem", "repairitem.product", "repairitem.product.productcategory", "repairsite"])
                ->where("User_id", $user->id);

        if ($request->type != -1)
        {
            $ri = $ri->where("Status", $request->type);
        }
        

        $ri = $ri->orderBy("Id", "DESC")->skip($request->page * $request->size)->take($request->size)->get();

        return response()->json($ri);
    }

    public function GetAllRepairSites (Request $request) {
        $result = RepairSite::where("isDisabled", false)->get();

        return response()->json($result);
    }

    public function GetAllRepairTicket (Request $request, $id) {
        $user = $request->userData;

        $ticket = Repair::with(["repairitem", "repairitem.product", "repairitem.product.productcategory", "repairsite"])
            ->where("Id", $id)->where("User_id", $user->id)
            ->first();

        if (!$ticket) return "NotFound";

        return response()->json($ticket);
    }

    public function GetRepairCount (Request $request, $type) {
        $user = $request->userData;

        $repair = Repair::where("User_id", $user->id);
        
        if ($type != -1)
            $repair = $repair->where("Status", $type);
        return $repair->count();
    }

    public function updateTicket (Request $request, $id) {
        $user = $request->userData;
        // Gửi mail?
        $repair = Repair::where("Id", $id)
                    ->where("User_id", $user->id)
                    ->where("Status", 0)
                    ->first();

        if (!$repair) return "NotFound";

        $rapairList = [];

        foreach ($request->listItem as $item)
        {
            RepairItem::insert([
                "RepairId" => $repair->Id,
                "Product_id" => $item->productId,
                "Quantity" => $item->quantity,
                "Remark" => $item->remark
            ]);
        }

        $repair->TicketReason = $cobj->reasonFlag;
        $repair->TrackingNo = $cobj->trackingno;
        $repair->ShippingLogisticsId = $cobj->shippingId;
        $repair->CustomerAddress = $cobj->userAddress;
        $repair->RepairSiteId = $cobj->repairSiteCode;
        $repair->ReturnLogisticsId = $cobj->returnShippingId;
        $repair->Remark = $cobj->remark;
        $repair->Updated_at = \Carbon\Carbon::now();

        Repair::where("Id", $repair->Id)->update($repair);

//         EmailModel template = new EmailModel()
//         {
//             EmailFrom = "vi@maxmines.com",
//             EmailTo = user.Email,
//             CustomerUsername = user.Username,
//             Subject = "[Vĩ Miner Shop - Collab] Cập nhật phiếu sửa chữa " + repair.Id + " thành công!",
//             Body = @"
// <div>Xin chào " + user.Email + "," +
// "<br /><div>Bạn đã cập nhật thành công phiếu sửa chữa <strong>#" + repair.Id + "</strong>. Vui lòng xem danh sách phiếu sửa chữa hiện tại của bạn <a href=\"https://miner.2cll.com/account/repair/tickets\">tại đây</a>.</div><br />"
//         };

        return response()->json($repair);
    }

    public function submitTicket (Request $request) {
        $cobj = $request;
        $user = $request->userData;
        // Gửi email
        $repair = [
            "Status" => 0,
            "User_id" => $user->id,
            "TicketReason" => $cobj->reasonFlag,
            "TrackingNo" => $cobj->trackingno,
            "ShippingLogisticsId" => $cobj->shippingId,
            "CustomerAddress" => $cobj->userAddress,
            "RepairSiteId" => $cobj->repairSiteCode,
            "ReturnLogisticsId" => $cobj->returnShippingId,
            "Remark" => $cobj->remark,
            "Created_at" => \Carbon\Carbon::now(),
            "Updated_at" => \Carbon\Carbon::now()
        ];
        $repair["Id"] = Repair::insertGetId($repair);

        foreach ($cobj->listItem as $item) {
            RepairItem::insert([
                "RepairId" => $repair["Id"],
                "Product_id" => $item["productId"],
                "Quantity" => $item["quantity"],
                "Remark" => $item["remark"]
            ]);
        }

//         EmailModel template = new EmailModel()
//         {
//             EmailFrom = "vi@maxmines.com",
//             EmailTo = user.Email,
//             CustomerUsername = user.Username,
//             Subject = "[Vĩ Miner Shop - Collab] Tạo phiếu sửa chữa thành công!",
//             Body = @"
// <div>Xin chào " + user.Email + "," +
// "<br /><div>Bạn đã tạo mới phiếu sửa chữa <strong>#" + repair.Id + "</strong> thành công. Vui lòng xem danh sách phiếu sửa chữa hiện tại của bạn <a href=\"https://miner.2cll.com/account/repair/tickets\">tại đây</a>.</div><br />"
//         };

        return response()->json($repair);
    }

    public function DeleteRepair (Request $request, $id) {
        $user = $request->userData;

        $repair = Repair::where("Id", $id)
                    ->where("User_id", $user->id)
                    ->where("Status", 0)
                    ->first();

        if (!$repair)
            return "NotFound";

        $repair->Status = 5; //Cancel

        $repair->save();

        return response()->json($repair);
    }
}