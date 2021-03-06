<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Repair extends Model
{
    use HasFactory;
    protected $table = "repair";
    protected $primaryKey = "Id";
    protected $fillable = [
        'Id', 'User_id', 'Status', 'TicketReason', 'TrackingNo', 'ShippingLogisticsId', 'CustomerAddress', 'RepairSiteId', 'ReturnLogisticsId', 'Remark', 'Created_at', 'Updated_at'
    ];

    public function repairorder () {
        return $this->hasOne(RepairOrder::class, "Repair_id", "Id");
    }

    public function repairitem () {
        return $this->hasMany(RepairItem::class, "RepairId", "Id");
    }

    public function repairsite () {
        return $this->belongsTo(RepairSite::class, "RepairSiteId", "Code");
    }

    protected $hidden = [
        // 'Id'
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