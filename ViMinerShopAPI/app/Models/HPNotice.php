<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Hpnotice extends Model
{
    use HasFactory;
    protected $table = 'Hpnotice';

    protected $fillable = [
        'Id', 'Title', 'Content'
    ];

    protected $hidden = [
        'Id'
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