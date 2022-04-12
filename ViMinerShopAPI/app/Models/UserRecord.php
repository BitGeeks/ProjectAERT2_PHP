<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserRecord extends Model
{
    use HasFactory;
    protected $table = "userrecord";
    protected $primaryKey = "Id";
    protected $fillable = [
        'Id', 'User_id', 'ActivityName', 'UserAgent', 'loglevel', 'ip', 'Created_at'
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