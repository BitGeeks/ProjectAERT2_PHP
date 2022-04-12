<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Coupon extends Model
{
    use HasFactory;
    protected $table = "coupon";
    protected $primaryKey = "Id";

    protected $fillable = [
        'Id', 'CouponCode', 'User_id', 'Desc', 'CouponPercent', 'CouponType', 'MinPrice', 'Active', 'CouponLeft', 'Expired_at', 'Created_at', 'Updated_at'
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