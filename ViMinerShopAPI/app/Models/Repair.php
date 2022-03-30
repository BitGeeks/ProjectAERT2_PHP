<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Repair extends Model
{
    use HasFactory;
    protected $fillable = [
        'Id', 'User_id', 'Status', 'TicketReason', 'TrackingNo', 'ShippingLogisticsId', 'CustomerAddress', 'RepairSiteId', 'ReturnLogisticsId', 'Remark', 'Created_at', 'Updated_at'
    ];

    protected $hidden = [
        'Id'
    ];
}