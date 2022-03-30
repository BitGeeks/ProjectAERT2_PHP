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
        'Id'
    ];
}