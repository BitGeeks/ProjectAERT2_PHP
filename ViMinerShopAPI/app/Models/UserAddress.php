<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserAddress extends Model
{
    use HasFactory;
    protected $fillable = [
        'Id', 'isDefault', 'User_id', 'Address', 'Street_name', 'City', 'Postal_code', 'Country', 'Telephone', 'Mobile'
    ];

    protected $hidden = [
        'Id'
    ];
}