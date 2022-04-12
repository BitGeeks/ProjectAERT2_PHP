<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserAddress extends Model
{
    use HasFactory;
    protected $table = "useraddresss";

    public $timestamps = false;

    protected $fillable = [
        'Id', 'isDefault', 'User_id', 'Address', 'Street_name', 'City', 'Postal_code', 'Country', 'Telephone', 'Mobile'
    ];

    public function user () {
        return $this->belongsTo(User::class, "User_id", "id");
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