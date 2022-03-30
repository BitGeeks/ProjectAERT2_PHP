<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductInventory extends Model
{
    use HasFactory;
    protected $fillable = [
        'Id', 'Quantity', 'Flag', 'Hps', 'weight', 'ShippingInfo', 'Created_at', 'Updated_at'
    ];

    protected $hidden = [
        'Id'
    ];
}