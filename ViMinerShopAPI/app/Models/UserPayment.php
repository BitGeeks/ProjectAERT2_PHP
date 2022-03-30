<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserPayment extends Model
{
    use HasFactory;
    protected $fillable = [
        'Id', 'User_id', 'payment_type', 'provider'
    ];

    protected $hidden = [
        'Id'
    ];
}