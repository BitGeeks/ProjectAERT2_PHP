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

    protected $hidden = [
        'Id'
    ];
}