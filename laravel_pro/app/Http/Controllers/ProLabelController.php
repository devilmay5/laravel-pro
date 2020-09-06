<?php

namespace App\Http\Controllers;

use App\Services\ProLabelServices;

class ProLabelController extends BaseController
{
    public function __construct()
    {
        parent::__construct();
    }

    public function GetProLabelSelect()
    {
        try {
            $label_group = ProLabelServices::getProLabelSelect();
            return response()->json($label_group);
        } catch (\Throwable $e) {
            $this->ErrorResponse($e);
        }
    }
}
