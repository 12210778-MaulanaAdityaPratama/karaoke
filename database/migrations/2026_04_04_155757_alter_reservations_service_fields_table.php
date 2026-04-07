<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('reservations', function (Blueprint $table) {
            $table->dropColumn('service_type');
            $table->dropColumn('service_id');
            
            $table->unsignedBigInteger('room_id')->nullable()->after('duration_hours');
            $table->unsignedBigInteger('package_id')->nullable()->after('room_id');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('reservations', function (Blueprint $table) {
            $table->string('service_type')->default('room');
            $table->unsignedBigInteger('service_id')->default(1);
            $table->dropColumn('room_id');
            $table->dropColumn('package_id');
        });
    }
};
