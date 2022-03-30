<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Algorithm extends Model
{
    use HasFactory;
    protected $fillable = [
        'Id', 'Name', 'Desc', 'Slug', 'Created_at', 'Updated_at'
    ];

    protected $hidden = [
        'Id', 'Created_at', 'Updated_at'
    ];
}