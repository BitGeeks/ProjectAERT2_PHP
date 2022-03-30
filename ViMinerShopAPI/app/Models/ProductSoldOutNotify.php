<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductSoldOutNotify extends Model
{
    use HasFactory;
    protected $fillable = [
        'Id', 'User_id', 'Product_id', 'quantity', 'Created_at', 'Updated_at'
    ];

    protected $hidden = [
        'Id'
    ];
}