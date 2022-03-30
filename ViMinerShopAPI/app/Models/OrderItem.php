<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrderItem extends Model
{
    use HasFactory;
    protected $fillable = [
        'Id', 'Order_id', 'Product_id', 'Quantity', 'Created_at', 'Updated_at'
    ];

    protected $hidden = [
        'Id'
    ];
}