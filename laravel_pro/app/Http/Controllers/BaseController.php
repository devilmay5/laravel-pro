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
     * @param $data
     * @param bool $to_json
     */
    public function RemoteApiResponse($data, $to_json = true)
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

        if ($to_json) {
            header('Content-Type: application/json;charset=utf-8');
        }

        echo json_encode($data);
        exit;
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

        echo json_encode($err);
        exit;
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
            $this->ErrorResponse(new \Exception($return_msg));
        }
    }

    public function msectime()
    {
        list($msec, $sec) = explode(' ', microtime());
        $msectime = (float)sprintf('%.0f', (floatval($msec) + floatval($sec)) * 1000);
        return $msectime;
    }
}
