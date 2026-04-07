<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Reservation extends Model
{
    protected $fillable = [
        'customer_name',
        'phone_number',
        'booking_date',
        'booking_time',
        'duration_hours',
        'room_id',
        'package_id',
        'notes',
        'status',
    ];

    protected $casts = [
        'booking_date' => 'date',
    ];

    /**
     * Get the room associated with the reservation.
     */
    public function room(): BelongsTo
    {
        return $this->belongsTo(Room::class, 'room_id');
    }

    /**
     * Get the package associated with the reservation (nullable)
     */
    public function package(): BelongsTo
    {
        return $this->belongsTo(Package::class, 'package_id');
    }
}
