<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;

class BaseController extends Controller
{
    //
    const ERROR_CODE = 500;
    const SUCCESS_CODE = 200;

    protected $request = null;
    protected $req_start_time = null;

    public function __construct()
    {
        $this->request = Request::capture();
        $this->req_start_time = $this->msectime();
    }

    /**
     * @param array $data
     * @param int $code
     * @param string $msg
     * @param int $count
     */
    public function RemoteApiResponse(array $data, int $code = 200, string $msg = "", int $count = 0)
    {
        $now = $this->msectime();
        $req_log_data = [
            'platform' => $this->request->header("platform") ?? 'admin',
            'url' => $this->request->path(),
            'method' => $this->request->getRealMethod(),
            'excute_time' => ($now - $this->req_start_time) . "ms",
            'content' => json_encode($this->request->all()),
            'auth' => json_encode(['auth' => $this->request->header("Authorization")]),
        ];

        $req_log_string = implode("@", $req_log_data);
        Log::channel("execute_log")->debug($req_log_string);

        $res = [
            'code' => $code ?? self::SUCCESS_CODE,
            'msg' => $msg ?? "",
            'count' => $count ?? 0,
            'result' => $data ?? [],
        ];

        return response()->json($res);
    }

    /**
     * @param \Throwable $e
     */
    public function ErrorResponse(\Throwable $e)
    {
        header('Content-Type: application/json;charset=utf-8');
        $err = [
            'code' => self::ERROR_CODE,
            'msg' => [
                "file_name" => $e->getFile(),
                "line" => $e->getLine(),
                "exception_msg" => $e->getMessage(),
            ],
            'result' => [],
        ];

        return response()->json($err);
    }

    /**
     * @param array $req_data
     * @param array $req_rules
     * @param array $err_msg ex:[ 'required' => ':attribute是必填的',]-可以把这个数组作为全局
     */
    public function validateParams(array $req_data, array $req_rules, $err_msg = [])
    {
        $validate = Validator::make($req_data, $req_rules, $err_msg);
        if ($validate->fails()) {
            $fail_group = $validate->errors()->all();
            $return_msg = implode(":", $fail_group);
            $this->ErrorResponse(new \Exception($return_msg))->send();
            exit;
        }
    }

    public function msectime()
    {
        list($msec, $sec) = explode(' ', microtime());
        $msectime = (float)sprintf('%.0f', (floatval($msec) + floatval($sec)) * 1000);
        return $msectime;
    }
}
