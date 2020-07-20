<?php

namespace App\Http\Controllers;

use App\Modules\Shop;
use Illuminate\Http\Request;

class ShopController extends BaseController
{
    //
    public function __construct()
    {
        parent::__construct();
    }

    public function getParentBranch()
    {
        try {
            $shop_list = Shop::getParentBranch();
            $this->RemoteApiResponse($shop_list);
        } catch (\Throwable $e) {
            $this->ErrorResponse($e);
        }
    }
}
