<?php

namespace App\Admin\Controllers;

use App\Modules\Customer;
use App\Modules\Feedback;
use App\Services\CustomerServices;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class FeedbackController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '问题反馈';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Feedback());

        $grid->column('id', 'Id');
        $grid->column('content','反馈问题');
        $grid->column('mobile','联系手机号');
        $grid->column('created_at', '创建时间');
        $grid->column('customer_id','提交人')->display(function ($customer_id){
            $customer = CustomerServices::getCustomerById($customer_id);
            return $customer->nickname??"";
        });

        $grid->filter(function ($filter) {
            $filter->disableIdFilter();
            $filter->like('mobile', '手机号');
        });
        $grid->disableExport();
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
        $show = new Show(Feedback::findOrFail($id));
        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Feedback());

        $form->display('content','反馈问题');
        $form->mobile('mobile','手机号')->readonly();
        $form->display('customer_id', '反馈客户')->with(function ($customer_id){
            $customer = CustomerServices::getCustomerById($customer_id);
            return $customer->nickname??"";
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
