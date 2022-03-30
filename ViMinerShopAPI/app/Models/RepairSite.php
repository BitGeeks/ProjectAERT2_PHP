<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RepairSite extends Model
{
    use HasFactory;
    protected $fillable = [
        'Code', 'Name', 'ExtraInfo', 'Note', 'Location', 'isDisabled'
    ];

    protected $hidden = [];
}