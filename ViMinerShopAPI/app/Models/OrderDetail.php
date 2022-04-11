<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrderDetail extends Model
{
    use HasFactory;
    protected $fillable = [
        'Id', 'User_id', 'SubTotal', 'CouponAmount', 'DiscountAmount', 'ShippingAmount', 'Total', 'Payment_id', 'ShippingMethod_id', 'ShippingAddress', 'Discount_id', 'Coupon_id', 'LocationName', 'Latitute', 'Longitute', 'Created_at', 'Updated_at'
    ];

    protected $hidden = [
        // 'Id'
    ];

    public function user () {
        return $this->belongsTo(User::class);
    }

    public function orderitems () {
        return $this->hasMany(OrderItem::class);
    }

    public function paymentdetail () {
        return $this->hasOne(PaymentDetail::class);
    }

    public function shippingmethod () {
        return $this->belongsTo(ShippingMethod::class);
    }

    public function toArray() {
        $array = parent::toArray();
        $newArray = array();
        foreach($array as $name => $value){
            $newArray[strtolower($name)] = $value;
        }
        return $newArray;
    }
}