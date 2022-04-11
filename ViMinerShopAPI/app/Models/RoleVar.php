<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

// 1 = USER, 0, 0
// 2 = ADMIN, 1, 0
class RoleVar extends Model
{
    use HasFactory;
    protected $fillable = [
        'Id', 'RoleName', 'IsAdmin', 'IsSeller'
    ];

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