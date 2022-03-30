<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class HPNotice extends Model
{
    use HasFactory;
    protected $fillable = [
        'Id', 'Title', 'Content'
    ];

    protected $hidden = [
        'Id'
    ];
}