<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserRecovery extends Model
{
    use HasFactory;
    protected $table = "userrecovery";
    protected $primaryKey = "Id";
    protected $fillable = [
        'Id', 'User_id', 'recoveryCode', 'IsUsed', 'Created_at', 'Updated_at'
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