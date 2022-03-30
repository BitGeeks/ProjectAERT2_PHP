<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Coupon extends Model
{
    use HasFactory;
    protected $fillable = [
        'Id', 'TransactionId', 'User_id', 'ReceiverId', 'CouponId', 'CouponName', 'CouponPercent', 'Quantity', 'Created_at', 'Updated_at'
    ];

    protected $hidden = [
        'Id'
    ];
}