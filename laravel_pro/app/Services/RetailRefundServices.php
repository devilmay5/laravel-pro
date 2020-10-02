<?php


namespace App\Services;


use App\Modules\RetailRefund;

class RetailRefundServices
{
    /**
     * @param array $req
     * @return mixed
     */
    public static function addRetailRefund(array $req)
    {
        $data = $req;
        $data['status'] = RetailRefund::STATUS_CODE['SUBMIT'];
        $data['submit_time'] = now();
        if (isset($req['refuse_image_url'])) {
            $path = $req['refuse_image_url']->store('images', 'admin');
            $data['refuse_image_url'] = $path;
        }

        return RetailRefund::create($data);
    }

    /**
     * @param array $req
     * @return array
     */
    public static function getRetailRefundList(array $req): array
    {
        $select = [
            'retail_refund.id as retail_refund_id',
            'retail_order_line_id',
            'refuse_content',
            'refuse_image_url',
            'status',
            'submit_time',
            'accept_time',
            'exam_time',
            'refund_time',
            'retail_refund.customer_id',
            'retail_order_line.retail_name as retail_name',
            'retail_order_line.created_at as retail_created_at',
            'retail_order_line.pro_name as pro_name',
            'retail_order_line.pro_sku as pro_sku',
            'retail_order_line.unit_price as unit_price',
            'retail_order_line.unit_count as unit_count'
        ];

        $query = RetailRefund::query()->select($select)
            ->join('retail_order_line', 'retail_refund.retail_order_line_id', '=', 'retail_order_line.id')
            ->ofCustomerId($req['customer_id'])
            ->orderBy('retail_refund_id', 'desc');

        $count = $query->count();

        if ($req['page_index'] && $req['page_size']) {
            $query = $query->offset(($req['page_index'] - 1) * $req['page_size'])->limit($req['page_size']);
        }

        $refund_group = $query->get();
        if ($refund_group->isNotEmpty()) {
            $refund_group = $refund_group->toArray();
        } else {
            $refund_group = [];
        }
        return [$refund_group, $count];
    }

    /**
     * @param int $refund_id
     * @return mixed
     */
    public static function getRetailRefundInfo(int $refund_id)
    {
        $refund = RetailRefund::find($refund_id);
        $retail_order_line = RetailOrderServices::getRetailOrderLineInfo(['retail_order_line_id' => $refund['retail_order_line_id']]);
        $refund['retail_order_line'] = $retail_order_line;
        return $refund;
    }
}