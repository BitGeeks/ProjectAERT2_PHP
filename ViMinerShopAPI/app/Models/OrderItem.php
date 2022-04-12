<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrderItem extends Model
{
    use HasFactory;
    protected $table = "orderitems";
    protected $primaryKey = "Id";

    protected $fillable = [
        'Id', 'Order_id', 'Product_id', 'Quantity', 'Created_at', 'Updated_at'
    ];

    public function orderdetail () {
        return $this->belongsTo(OrderDetail::class);
    }

    public function product () {
        return $this->belongsTo(Product::class, "Product_id", "Id");
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