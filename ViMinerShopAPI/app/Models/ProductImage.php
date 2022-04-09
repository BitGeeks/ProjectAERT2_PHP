<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductImage extends Model
{
    use HasFactory;
    protected $table = "productimages";

    protected $fillable = [
        'Id', 'Product_Id', 'Alt_Name', 'ImageUrl', 'Created_at', 'Updated_at'
    ];

    public function product () {
        return $this->belongsTo(Product::class, "Product_Id", "Id");
    }

    protected $hidden = [
        'Id'
    ];

    public function toArray() {
        $array = parent::toArray();
        $newArray = array();
        foreach($array as $name => $value){
            $newArray[strtolower($name)] = $value;
        }
        return $newArray;
    }
}