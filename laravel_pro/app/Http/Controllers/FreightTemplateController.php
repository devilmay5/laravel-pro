<?php


namespace App\Http\Controllers;


use App\Services\FreightTemplateServices;

class FreightTemplateController extends BaseController
{
    public function __construct()
    {
        parent::__construct();
    }

    public function GetTemplateSelect()
    {
        try {
            $return = [['id' => 0, 'text' => '暂无选择']];
            $freight_template_group = FreightTemplateServices::getTemplateSelect();
            $return = array_merge($return, $freight_template_group);
            return response()->json($return);
        } catch (\Throwable $e) {
            return $this->ErrorResponse($e);
        }
    }
}
