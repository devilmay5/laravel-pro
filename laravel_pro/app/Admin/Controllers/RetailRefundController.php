<?php

namespace App\Admin\Controllers;

use App\Modules\RetailRefund;
use App\Services\CustomerServices;
use App\Services\RetailOrderServices;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class RetailRefundController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '退款管理';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new RetailRefund());

        $grid->column('id', 'Id');
        $grid->column('retail_order_line_id', '关联订单号')->display(function ($retail_order_line_id) {
            $retail_order_line = RetailOrderServices::getRetailOrderLineInfo(['retail_order_line_id' => $retail_order_line_id]);
            return $retail_order_line['retail_name'] ?? '';
        });
        $grid->column('status', '状态')->display(function ($status) {
            switch ($status) {
                case RetailRefund::STATUS_CODE['SUBMIT']:
                    $name = '已提交';
                    break;
                case RetailRefund::STATUS_CODE['ACCEPT']:
                    $name = '已受理';
                    break;
                case RetailRefund::STATUS_CODE['EXAM']:
                    $name = '已审核';
                    break;
                case RetailRefund::STATUS_CODE['REFUND']:
                    $name = '已退款';
                    break;
            }
            return $name;
        });
        $grid->column('submit_time', '提交时间');
        $grid->column('accept_time', '受理时间');
        $grid->column('exam_time', '审核时间');
        $grid->column('refund_time', '退款时间');
        $grid->column('customer_id', '用户名称')->display(function ($customer_id) {
            $customer = CustomerServices::getCustomerById($customer_id);
            return $customer->nickname ?? "";
        });

        $grid->filter(function ($filter) {
            $filter->disableIdFilter();
            $filter->between('submit_time', '提交时间')->datetime();
            $filter->between('accept_time', '受理时间')->datetime();
            $filter->between('exam_time', '审核时间')->datetime();
            $filter->between('refund_time', '退款时间')->datetime();
        });

        $grid->disableExport();
        $grid->disableCreateButton();
        $grid->actions(function ($actions) {
            // 去掉查看
            $actions->disableView();
        });
        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(RetailRefund::findOrFail($id));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new RetailRefund());

        $form->display('retail_order_line_id', '关联订单编号')->with(function ($retail_order_line_id) {
            $retail_order_line = RetailOrderServices::getRetailOrderLineInfo(['retail_order_line_id' => $retail_order_line_id]);
            return $retail_order_line['retail_name'] ?? '';
        });
        $form->textarea('refuse_content', '退款描述')->readonly();
        $form->image('refuse_image_url', '凭证图片')->readonly();

        $status_option = [
            1 => '待审核',
            2 => '已受理',
            3 => '已审核',
            4 => '已退款'
        ];
        $form->radio('status', '订单状态')->options($status_option);
        $form->datetime('submit_time', '提交时间');
        $form->datetime('accept_time', '受理时间');
        $form->datetime('exam_time', '审核时间');
        $form->datetime('refund_time', '退款时间');
        $form->display('customer_id', '用户名称')->with(function ($customer_id) {
            $customer = CustomerServices::getCustomerById($customer_id);
            return $customer->nickname ?? "";
        });
        $form->tools(function (Form\Tools $tools) {
            // 去掉`查看`按钮
            $tools->disableView();
        });
        $form->footer(function ($footer) {
            // 去掉`查看`checkbox
            $footer->disableViewCheck();
        });
        return $form;
    }
}
