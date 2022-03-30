<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RepairOrder extends Model
{
    use HasFactory;
    protected $fillable = [
        'Id', 'Repair_id', 'Payment_id', 'Status', 'Provider', 'Price', 'Created_at', 'Updated_at'
    ];

    protected $hidden = [
        'Id'
    ];
}