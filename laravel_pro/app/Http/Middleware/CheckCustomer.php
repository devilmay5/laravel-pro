<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Session;

class CheckCustomer
{
    /**
     * Handle an incoming request.
     *
     * @param \Illuminate\Http\Request $request
     * @param \Closure $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        $customer_id = $request->input('customer_id');

        if (!$customer_id) {
            return response()->json([
                'code' => '401',
                'msg' => '用户未登录',
                'result' => ''
            ]);
        }

        if (!Session::exists('customer_' . $customer_id)) {
            return response()->json([
                'code' => '401',
                'msg' => '登录状态已过期，请重新登录',
                'result' => ''
            ]);
        }


        return $next($request);
    }
}
