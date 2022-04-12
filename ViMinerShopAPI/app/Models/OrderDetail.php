<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrderDetail extends Model
{
    use HasFactory;
    protected $table = "orderdetails";

    protected $fillable = [
        'Id', 'User_id', 'SubTotal', 'CouponAmount', 'DiscountAmount', 'ShippingAmount', 'Total', 'Payment_id', 'ShippingMethod_id', 'ShippingAddress', 'Discount_id', 'Coupon_id', 'LocationName', 'Latitute', 'Longitute', 'Created_at', 'Updated_at'
    ];

    protected $hidden = [
        // 'Id'
    ];

    public function user () {
        return $this->belongsTo(User::class, "User_id", "id");
    }

    public function orderitems () {
        return $this->hasMany(OrderItem::class, "Order_id", "Id");
    }

    public function paymentdetail () {
        return $this->belongsTo(PaymentDetail::class, "Payment_id", "Id");
    }

    public function shippingmethod () {
        return $this->belongsTo(ShippingMethod::class, "ShippingMethod_id", "Id");
    }

    public function coupon() {
        return $this->belongsTo(Coupon::class, "Coupon_id", "Id");
    }

    public function discount() {
        return $this->belongsTo(Coupon::class, "Discount_id", "Id");
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