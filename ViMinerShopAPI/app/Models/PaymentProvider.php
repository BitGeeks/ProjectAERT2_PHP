<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PaymentProvider extends Model
{
    use HasFactory;
    protected $fillable = [
        'Id', 'Name', 'Desc', 'Created_at', 'Updated_at'
    ];

    protected $hidden = [
        'Id'
    ];
}