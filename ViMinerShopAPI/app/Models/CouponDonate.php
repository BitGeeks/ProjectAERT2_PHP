<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CouponDonate extends Model
{
    use HasFactory;
    protected $table = "coupondonate";
    protected $primaryKey = "Id";
    protected $fillable = [
        'Id', 'TransactionId', 'User_id', 'ReceiverId', 'CouponId', 'CouponName', 'CouponPercent', 'Quantity', 'Created_at', 'Updated_at'
    ];

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