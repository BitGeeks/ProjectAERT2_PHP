<?php

namespace App\Http\Middleware;

use Closure;
use JWTAuth;
use Exception;
use Tymon\JWTAuth\Http\Middleware\BaseMiddleware;

class JwtMiddleware extends BaseMiddleware
{

    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        try {
            // JWTAuth::setIdentifier('Id');
            // $user = JWTAuth::parseToken()->authenticate();
            $user = JWTAuth::toUser(JWTAuth::getToken());
            $request->merge(['userData' => $user]);
        } catch (Exception $e) {
            if ($e instanceof \Tymon\JWTAuth\Exceptions\TokenInvalidException){
                return response()->json(['status' => 'Token không hợp lệ']);
            }else if ($e instanceof \Tymon\JWTAuth\Exceptions\TokenExpiredException){
                return response()->json(['status' => 'Token đã hết hạn']);
            }else{
                return response()->json(['status' => 'Token ủy quyền không tồn tại']);
            }
        }
        
        return $next($request);
    }
}