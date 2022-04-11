<?php

namespace App\Http\Controllers;

use App\Models\RoleVar;
use Illuminate\Http\Request;

class AdminController extends Controller
{
    public function GetRoleVars (Request $request) {
        $results = RoleVar::get();

        return response()->json($results);
    }

    public function GetRoleVar (Request $request, $id) {
        // under development
    }

    public function PutRoleVar (Request $request, $id) {
        // under development
    }

    public function PutRoleVar (Request $request, $id) {
        // under development
    }

    public function PostRoleVar (Request $request) {
        // under development
    }

    public function GetUserList (Request $request) {
        // under development
    }

    public function GetUserListCount (Request $request) {
        // under development
    }

    public function GetRoleList (Request $request) {
        // under development
    }

    public function GetAllHomeSlide (Request $request) {
        // under development
    }

    public function AddHomeSlideImage (Request $request) {
        // under development
    }

    public function EditHomeSlideImage (Request $request) {
        // under development
    }

    public function RemoveHomeSlideImage (Request $request) {
        // under development
    }

    public function EditHPNotice (Request $request) {
        // under development
    }

    public function UpdateUserRole (Request $request) {
        // under development
    }

    public function GetListInventories (Request $request) {
        // under development
    }

    public function GetRepairCount (Request $request) {
        // under development
    }

    public function GetListRepairs (Request $request) {
        // under development
    }

    public function GetListRepairsByType (Request $request) {
        // under development
    }

    public function UpdateRepairTicketStatus (Request $request) {
        // under development
    }

    public function UpdateRepairOrder (Request $request) {
        // under development
    }

    public function EditInventory (Request $request) {
        // under development
    }

    public function GetListAlgorithmsCount (Request $request) {
        // under development
    }

    public function GetListAlgorithms (Request $request) {
        // under development
    }

    public function RemoveProductImage (Request $request) {
        // under development
    }

    public function EditProduct (Request $request) {
        // under development
    }

    public function ToggleActiveProduct (Request $request, $id) {
        // under development
    }

    public function GetProductCount (Request $request) {
        // under development
    }

    public function GetProductList (Request $request) {
        // under development
    }

    public function AddProduct (Request $request) {
        // under development
    }

    public function GetProduct (Request $request) {
        // under development
    }

    public function AddInventory (Request $request) {
        // under development
    }

    public function GetInventory (Request $request) {
        // under development
    }

    public function AddCategory (Request $request) {
        // under development
    }

    public function EditCategory (Request $request) {
        // under development
    }

    public function GetCategory (Request $request) {
        // under development
    }

    public function AddAlgorithm (Request $request) {
        // under development
    }

    public function EditAlgorithm (Request $request) {
        // under development
    }

    public function GetAlgorithm (Request $request) {
        // under development
    }

    public function AddRepairSite (Request $request) {
        // under development
    }

    public function GetAllRepairSiteCount (Request $request) {
        // under development
    }

    public function GetRepairSite (Request $request) {
        // under development
    }

    public function ToggleRepairSiteActive (Request $request) {
        // under development
    }

    public function EditRepairSite (Request $request) {
        // under development
    }

    public function GetRepairSite (Request $request) {
        // under development
    }

    public function AddShipping (Request $request) {
        // under development
    }

    public function EditShipping (Request $request) { // shipping/edit/{id}
        // under development
    }

    public function GetShippingMethod (Request $request) {
        // under development
    }

    public function GetOrdersByType (Request $request) {
        // under development
    }

    public function GetOrderCount (Request $request) {
        // under development
    }

    public function EditOrderStatus (Request $request) {
        // under development
    }

    public function GetAllChartData (Request $request) {
        // under development
    }

    public function GetAllTransaction (Request $request) {
        // under development
    }

    public function GetAllTransactionCount (Request $request) {
        // under development
    }

    public function GetShippingMethodCount (Request $request) {
        // under development
    }

    public function GetShippingMethodCount (Request $request) {
        // under development
    }
}