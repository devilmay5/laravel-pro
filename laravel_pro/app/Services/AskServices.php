<?php


namespace App\Services;


use App\Modules\CustomerAsk;
use Illuminate\Support\Facades\DB;

class AskServices
{
    /**
     * @param array $req
     * @return mixed
     */
    public static function addAsk(array $req)
    {
        $ask = DB::transaction(function () use ($req) {
            $data['retail_order_line_id'] = $req['retail_order_line_id'] ?? 0;
            $data['customer_id'] = $req['customer_id'] ?? 0;
            $data['pro_id'] = $req['pro_id'] ?? 0;
            $data['ask_id'] = $req['ask_id'] ?? 0;
            $data['ask_content'] = $req['ask_content'] ?? '';
            if (isset($req['ask_img'])) {
                $path = $req['ask_img']->store('images', 'admin');
                $data['ask_img'] = $path;
            }
            $ask = CustomerAsk::create($data);
            if ($ask->ask_id == 0) {
                $id = $ask['id'];
                $ask->ask_id = $id;
                $ask->save();
            }

            return $ask;
        });
        return $ask;
    }

    /**
     * @param array $req
     * @return array
     */
    public static function getAskList(array $req): array
    {
        $select = [
            '*'
        ];
        $query = CustomerAsk::query()->select($select)
            ->ofCustomerId($req['customer_id'])
            ->orderBy('ask_id', 'desc')
            ->groupBy('ask_id');

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

    /**
     * @param array $req
     * @return mixed
     */
    public static function getAskItem(array $req)
    {
        return CustomerAsk::query()
            ->ofAskId($req['ask_id'])
            ->orderBy('id', 'desc')
            ->get();
    }

    /**
     * @param array $req
     * @return array
     */
    public static function getAskByProId(array $req): array
    {
        $query = CustomerAsk::query()
            ->ofProId($req['pro_id'])
            ->ofCustomerId($req['customer_id'])
            ->orderBy('id', 'desc');

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
