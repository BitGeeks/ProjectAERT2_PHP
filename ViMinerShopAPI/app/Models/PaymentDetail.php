<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PaymentDetail extends Model
{
    use HasFactory;
    protected $table = "paymentdetails";
    protected $fillable = [
        'Id', 'Amount', 'Provider', 'Status', 'MaxMinesBillID', 'PaypalID', 'ReferralBy', 'Created_at', 'Updated_at'
    ];

    public function orderdetail () {
        return $this->belongsTo(OrderDetail::class);
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