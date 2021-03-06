<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserCredentialsVerify extends Model
{
    use HasFactory;
    protected $table = "usercredentialsverify";
    protected $primaryKey = "Id";
    public $timestamps = false;
    protected $fillable = [
        'Id', 'User_id', 'EmailVerifyCode', 'ResendMailAt'
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