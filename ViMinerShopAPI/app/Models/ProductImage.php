<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductImage extends Model
{
    use HasFactory;
    protected $fillable = [
        'Id', 'Product_Id', 'Alt_Name', 'ImageUrl', 'Created_at', 'Updated_at'
    ];

    protected $hidden = [
        'Id'
    ];
}