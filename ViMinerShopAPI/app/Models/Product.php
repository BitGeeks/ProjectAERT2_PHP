<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;
    protected $fillable = [
        'Id', 'Name', 'Desc', 'NoteDesc', 'DetailDesc', 'PaymentDesc', 'WarrantyDesc', 'SKU', 'Category_id', 'Inventory_id', 'Algorithm_id', 'Price', 'PricePromotion', 'isActive', 'Created_at', 'Updated_at'
    ];

    protected $hidden = [
        'Id'
    ];
}