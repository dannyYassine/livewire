<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class PrintRequestsToConsoleMiddleware
{
    public function handle(Request $request, Closure $next)
    {
        $method = $request->getMethod();
        $url = $request->fullUrl();
        $ip = $request->ip();

        // Print the request to the console
        echo "[{$method}] {$url} - IP: {$ip}" . PHP_EOL;

        return $next($request);
    }
}
