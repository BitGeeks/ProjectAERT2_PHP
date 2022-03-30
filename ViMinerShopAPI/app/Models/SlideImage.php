<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SlideImage extends Model
{
    use HasFactory;
    protected $fillable = [
        'Id', 'Name', 'FillColor', 'ImgUrl', 'JumpTo'
    ];

    protected $hidden = [
        'Id'
    ];
}