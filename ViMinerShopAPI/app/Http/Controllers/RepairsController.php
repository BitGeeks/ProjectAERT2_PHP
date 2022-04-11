<?php

namespace App\Http\Controllers;

use App\Models\ProductInventory;
use Illuminate\Http\Request;

class RepairsController extends Controller
{
    public function GetRepairs (Request $request) {
        // under development
    }

    public function GetRepair (Request $request, $queryString) {
        // under development
    }

    public function GetRepairByType (Request $request, $type) {
        // under development
    }

    public function GetAllRepairSites (Request $request) {
        // under development
    }

    public function GetAllRepairTicket (Request $request, $id) {
        // under development
    }

    public function GetRepairCount (Request $request, $type) {
        // under development
    }

    public function updateTicket (Request $request, $id) {
        // under development
    }

    public function submitTicket (Request $request) {
        // under development
    }

    public function DeleteRepair (Request $request, $id) {
        // under development
    }
}