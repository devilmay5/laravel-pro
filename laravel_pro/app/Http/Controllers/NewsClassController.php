<?php


namespace App\Http\Controllers;


use App\Services\NewClassServices;

class NewsClassController extends BaseController
{
    public function __construct()
    {
        parent::__construct();
    }

    public function GetNewsClassSelect()
    {
        $res = NewClassServices::getEnableList();
        return response()->json($res);
    }
}
