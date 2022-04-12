<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductCategory extends Model
{
    use HasFactory;
    protected $table = "productcategories";
    protected $primaryKey = "Id";

    protected $fillable = [
        'Id', 'Name', 'Desc', 'Image', 'Slug', 'Created_at', 'Updated_at'
    ];

    public function product(){
        return $this->hasMany(Product::class, "Id", "Category_id");
    }

    protected $hidden = [
        // 'Id'
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