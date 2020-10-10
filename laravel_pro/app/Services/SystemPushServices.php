<?php


namespace App\Services;


use App\Modules\SystemPush;

class SystemPushServices
{
    /**
     * @param array $req
     * @return array
     */
    public static function getSystemPushList(array $req): array
    {
        $query = SystemPush::query()
            ->ofStatus(SystemPush::STATUS_CODE['ENABLE'])
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