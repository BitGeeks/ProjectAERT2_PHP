<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ShoppingSession extends Model
{
    use HasFactory;
    protected $fillable = [
        'Id', 'User_id', 'Total', 'Coupon_id', 'Discount_id', 'Created_at', 'Updated_at'
    ];

    public function cartitems () {
        return $this->hasMany(CartItem::class, "Session_id", "Id");
    }

    public function coupon () {
        return $this->hasOne(Coupon::class, "Coupon_id", "Id");
    }

    public function discount () {
        return $this->hasOne(Discount::class, "Discount_id", "Id");
    }

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