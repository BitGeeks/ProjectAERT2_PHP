<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserAddress extends Model
{
    use HasFactory;
    protected $fillable = [
        'Id', 'User_id', 'EmailVerifyCode', 'ResendMailAt'
    ];

    protected $hidden = [
        'Id'
    ];
}