<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductInventory extends Model
{
    use HasFactory;
    protected $table = "productinventories";
    protected $fillable = [
        'Id', 'Quantity', 'Flag', 'Hps', 'weight', 'ShippingInfo', 'Created_at', 'Updated_at'
    ];

    public function product(){
        return $this->belongsTo(Product::class, "Id", "Inventory_id");
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