<?php

namespace App\Http\Controllers;

use App\Models\Reservation;
use App\Models\Room;
use App\Models\Package;
use Illuminate\Http\Request;

class ReservationController extends Controller
{
    /**
     * Submit booking form
     */
    public function submit(Request $request)
    {
        $request->validate([
            'customer_name'  => 'required|string|max:100',
            'phone_number'   => 'required|string|max:20',
            'booking_date'   => 'required|date|after_or_equal:today',
            'booking_time'   => 'required',
            'duration_hours' => 'required|integer|min:1|max:12',
            'room_id'        => 'required|exists:rooms,id',
            'package_id'     => 'nullable|exists:packages,id',
            'notes'          => 'nullable|string|max:500',
        ]);

        // 1. Simpan ke Database
        Reservation::create([
            'customer_name'  => $request->customer_name,
            'phone_number'   => $request->phone_number,
            'booking_date'   => $request->booking_date,
            'booking_time'   => $request->booking_time,
            'duration_hours' => $request->duration_hours,
            'room_id'        => $request->room_id,
            'package_id'     => $request->package_id,
            'notes'          => $request->notes,
            'status'         => 'pending'
        ]);

        // 2. Generate Teks WhatsApp
        $room = Room::find($request->room_id);
        $package = $request->package_id ? Package::find($request->package_id) : null;
        
        $roomStr = $room ? 'Room ' . $room->name : 'N/A';
        $packageStr = $package ? 'Paket ' . $package->name : 'Reguler';

        $adminPhone = '6287770851998'; // Nomor WA Admin Masterpiece
        
        $text = "*Halo Masterpiece, saya ingin reservasi:*\n\n";
        $text .= "Nama: *" . $request->customer_name . "*\n";
        $text .= "No. HP: *" . $request->phone_number . "*\n";
        $text .= "Tanggal: *" . \Carbon\Carbon::parse($request->booking_date)->format('d M Y') . "*\n";
        $text .= "Jam: *" . $request->booking_time . " WIB*\n";
        $text .= "Durasi: *" . $request->duration_hours . " Jam*\n";
        $text .= "Pilihan Room: *" . $roomStr . "*\n";
        $text .= "Pilihan Paket: *" . $packageStr . "*\n";
        
        if ($request->notes) {
            $text .= "Catatan Tambahan: " . $request->notes . "\n";
        }
        
        $text .= "\n*Mohon info ketersediaannya. Terima kasih.*\n\n";
        $text .= "_Di mohon untuk kedatangan nya di tepat waktu 15 sebelum waktu reservasi :) apabila tidak ada konfirmasi/nomor tidak dapat di hubungi setelah lewat dari jam reservasi kami akan cancel otomatis._\n*Terimakasih*";

        $waUrl = "https://wa.me/{$adminPhone}?text=" . urlencode($text);

        // 3. Redirect ke WhatsApp
        return redirect()->away($waUrl);
    }
}
