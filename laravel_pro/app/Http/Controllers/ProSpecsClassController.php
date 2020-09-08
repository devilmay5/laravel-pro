<?php


namespace App\Http\Controllers;


use App\Services\ProSpecsClassServices;

class ProSpecsClassController extends BaseController
{
    public function __construct()
    {
        parent::__construct();
    }

    public function GetSpecsClassSelect()
    {
        try {
            $rules = [
                'q' => ''
            ];
            $req = $this->request->only(array_keys($rules));
            $this->validateParams($req, $rules);

            $pro_class_specs_group = ProSpecsClassServices::getProSpecsClassSelect($req['q'] ?? 0);
            return response()->json($pro_class_specs_group);
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }
}
