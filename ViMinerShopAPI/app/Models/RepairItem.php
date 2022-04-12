<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RepairItem extends Model
{
    use HasFactory;
    protected $table = "repairitem";
    protected $primaryKey = "Id";
    protected $fillable = [
        'Id', 'RepairId', 'Product_id', 'Quantity', 'Remark'
    ];

    public function repair () {
        return $this->belongsTo(Repair::class);
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