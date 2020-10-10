<?php


namespace App\Services;


use App\Modules\CommonProblem;

class CommonProblemServices
{
    /**
     * @param array $req
     * @return array
     */
    public static function getProblemList(array $req): array
    {
        $query = CommonProblem::query()
            ->ofStatus(CommonProblem::STATUS_CODE['ENABLE'])
            ->orderBy('order_by', 'desc');

        $count = $query->count();
        if ($req['page_index'] && $req['page_size']) {
            $query = $query->offset(($req['page_index'] - 1) * $req['page_size'])->limit($req['page_size']);
        }
        $res = $query->get();
        if ($res->isNotEmpty()) {
            $res = $res->toArray();
        } else {
            $res = [];
        }
        return [$res, $count];
    }
}
