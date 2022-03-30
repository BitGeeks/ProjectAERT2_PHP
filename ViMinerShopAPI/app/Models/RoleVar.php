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
        'Id'
    ];
}