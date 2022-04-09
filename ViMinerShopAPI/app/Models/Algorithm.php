<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Algorithm extends Model
{
    use HasFactory;
    protected $fillable = [
        'Id', 'Name', 'Desc', 'Slug', 'Created_at', 'Updated_at'
    ];

    public function product(){
        return $this->belongsTo(Product::class, "Id", "Algorithm_id");
    }

    protected $hidden = [
        'Id', 'Created_at', 'Updated_at'
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