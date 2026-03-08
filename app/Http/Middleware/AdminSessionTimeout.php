<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Auth;

class AdminSessionTimeout
{
    const TIMEOUT = 60;
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next)
    {
        if (Auth::check()) {
            $lastActivity = $request->session()->get('last_activity');
            if ($lastActivity && (time() - $lastActivity) > (self::TIMEOUT * 60)) {
                Auth::logout();
                session()->flush();
                session()->regenerate();

                return redirect()->route('login')
                    ->with('message', 'Sesi Anda telah berakhir. Silakan login kembali.');
            }
          // Update waktu aktivitas terakhir
            session(['last_activity_time' => time()]);
        }

        return $next($request);
    }
}