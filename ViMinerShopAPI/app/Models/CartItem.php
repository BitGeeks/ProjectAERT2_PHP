<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CartItem extends Model
{
    use HasFactory;
    protected $fillable = [
        'Id', 'Session_id', 'Product_id', 'Quantity', 'Created_at', 'Updated_at'
    ];

    protected $hidden = [
        'Id', 'Created_at', 'Updated_at'
    ];
}