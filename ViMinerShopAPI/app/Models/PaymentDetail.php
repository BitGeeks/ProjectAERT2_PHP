<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PaymentDetail extends Model
{
    use HasFactory;
    protected $fillable = [
        'Id', 'Amount', 'Provider', 'Status', 'MaxMinesBillID', 'PaypalID', 'ReferralBy', 'Created_at', 'Updated_at'
    ];

    protected $hidden = [
        'Id'
    ];
}