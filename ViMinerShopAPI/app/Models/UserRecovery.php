<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserRecovery extends Model
{
    use HasFactory;
    protected $fillable = [
        'Id', 'User_id', 'recoveryCode', 'IsUsed', 'Created_at', 'Updated_at'
    ];

    protected $hidden = [
        'Id'
    ];
}