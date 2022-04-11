<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CartItem extends Model
{
    use HasFactory;
    protected $table = "cartitems";

    protected $fillable = [
        'Id', 'Session_id', 'Product_id', 'Quantity', 'Created_at', 'Updated_at'
    ];

    public function shoppingsession () {
        return $this->belongsTo(ShoppingSession::class, "Session_id", "Id");
    }

    public function product () {
        return $this->belongsTo(Product::class, "Product_id", "Id");
    }

    protected $hidden = [
        'Created_at', 'Updated_at'
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