<?php


namespace App\Http\Controllers;


use App\Services\CommonProblemServices;

class CommonProblemController extends BaseController
{
    public function __construct()
    {
        parent::__construct();
    }

    public function GetProblemList()
    {
        try {
            $rules = [
                'page_index' => 'required|int',
                'page_size' => 'required|int',
            ];
            $req = $this->request->only(array_keys($rules));
            $this->validateParams($req, $rules);

            [$problem_list, $count] = CommonProblemServices::getProblemList($req);
            return $this->RemoteApiResponse($problem_list, self::SUCCESS_CODE, '查询成功', $count);
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }
}
