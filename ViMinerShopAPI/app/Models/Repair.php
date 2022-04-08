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

    public function toArray() {
        $array = parent::toArray();
        $newArray = array();
        foreach($array as $name => $value){
            $newArray[strtolower($name)] = $value;
        }
        return $newArray;
    }
}