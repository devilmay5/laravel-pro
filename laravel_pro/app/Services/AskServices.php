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
            $data['ask_id'] = $req['ask_id'] ?? 0;
            $data['ask_content'] = $req['ask_content'] ?? '';
            if (isset($req['ask_img'])) {
                $path = $req['ask_img']->store('images','admin');
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
}