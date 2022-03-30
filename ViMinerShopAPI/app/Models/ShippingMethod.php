<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ShippingMethod extends Model
{
    use HasFactory;
    protected $fillable = [
        'Id', 'Name', 'ShortName', 'repairFlag', 'salesFlag', 'supportFreeShip', 'erpCode', 'logoUrl', 'avgfeeperkm'
    ];

    protected $hidden = [
        'Id'
    ];
}