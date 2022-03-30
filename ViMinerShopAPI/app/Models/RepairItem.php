<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RepairItem extends Model
{
    use HasFactory;
    protected $fillable = [
        'Id', 'RepairId', 'Product_id', 'Quantity', 'Remark'
    ];

    protected $hidden = [
        'Id'
    ];
}