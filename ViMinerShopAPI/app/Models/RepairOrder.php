<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RepairOrder extends Model
{
    use HasFactory;
    protected $table = "repairorder";
    protected $primaryKey = "Id";
    protected $fillable = [
        'Id', 'Repair_id', 'Payment_id', 'Status', 'Provider', 'Price', 'Created_at', 'Updated_at'
    ];

    public function repair () {
        return $this->belongsTo(Repair::class, "Repair_id", "Id");
    }

    public function payment () {
        return $this->belongsTo(PaymentDetail::class, "Payment_id", "Id");
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