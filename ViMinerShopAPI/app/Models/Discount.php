<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Discount extends Model
{
    use HasFactory;
    protected $fillable = [
        'Id', 'Name', 'Desc', 'Discount_percent', 'Discount_type', 'Active', 'Created_at', 'Updated_at'
    ];

    protected $hidden = [
        'Id'
    ];
}