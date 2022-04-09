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

    public function productcategory () {
        return $this->belongsTo(ProductCategory::class, "Category_id", "Id");
    }

    public function productinventory () {
        return $this->hasOne(ProductInventory::class, "Id", "Inventory_id");
    }

    public function algorithm () {
        return $this->hasOne(Algorithm::class, "Id", "Algorithm_id");
    }

    public function productimages () {
        return $this->hasMany(ProductImage::class, "Product_id", "Id");
    }

    public function scopeWithWhereHas($query, $relation, $constraint) {
        return $query->whereHas($relation, $constraint)
        ->with([$relation => $constraint]);
    }

    protected $hidden = [];

    public function toArray() {
        $array = parent::toArray();
        $newArray = array();
        foreach($array as $name => $value){
            $newArray[strtolower($name)] = $value;
        }
        return $newArray;
    }
}