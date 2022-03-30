<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserRecord extends Model
{
    use HasFactory;
    protected $fillable = [
        'Id', 'User_id', 'ActivityName', 'UserAgent', 'loglevel', 'ip', 'Created_at'
    ];

    protected $hidden = [
        'Id'
    ];
}