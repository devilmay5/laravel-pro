<?php

namespace App\Admin\Controllers;

use App\Modules\CustomerAsk;
use App\Services\CustomerServices;
use App\Services\ProInfoServices;
use App\Services\RetailOrderServices;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class AskController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '消息中心';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new CustomerAsk());

        $grid->column('id', 'Id');
        $grid->column('created_at', '咨询时间');
        $grid->column('retail_order_line_id', '关联订单号')->display(function ($retail_order_line_id) {
            if ($retail_order_line_id) {
                $retail = RetailOrderServices::getRetailOrderLineInfo(['retail_order_line_id' => $retail_order_line_id]);
                return $retail['retail_name'];
            } else {
                return '无关联订单';
            }

        });
        $grid->column('customer_id', '客户名称')->display(function ($customer_id) {
            $customer = CustomerServices::getCustomerById($customer_id);
            return $customer['nickname'];
        });;

        $grid->column('pro_id', '产品名称')->display(function ($pro_id) {
            $proInfo = ProInfoServices::getProInfo($pro_id);
            return $proInfo['pro_name'];
        });
        $grid->column('ask_id', '咨询编号');
        $grid->column('ask_content', '咨询内容');
        $grid->column('ask_img','上传图片')->image();
        $grid->column('reply_content', '回复内容');


        $grid->filter(function ($filter) {
            $filter->disableIdFilter();
            $filter->between('created_at', '咨询时间')->datetime();
            $filter->equal('ask_id', '咨询编号');
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
        $show = new Show(CustomerAsk::findOrFail($id));
        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new CustomerAsk());

        $form->display('retail_order_line_id', '关联订单号')->with(function ($retail_order_line_id) {
            if ($retail_order_line_id) {
                $retail = RetailOrderServices::getRetailOrderLineInfo(['retail_order_line_id' => $retail_order_line_id]);
                return $retail['retail_name'];
            } else {
                return '无关联订单';
            }
        });
        $form->display('customer_id', '客户名称')->with(function ($customer_id) {
            $customer = CustomerServices::getCustomerById($customer_id);
            return $customer['nickname'];
        });
        $form->display('pro_id', '产品名称')->with(function ($pro_id) {
            $proInfo = ProInfoServices::getProInfo($pro_id);
            return $proInfo['pro_name'];
        });

        $form->display('ask_id', '消息内容')->with(function ($ask_id) {
            $ask_list = CustomerAsk::where('ask_id', $ask_id)->orderBy('id', 'asc')->get();
            $res = "";

            foreach ($ask_list as $item) {
                $customer = CustomerServices::getCustomerById($item['customer_id']);
                if ($item['ask_content']) {
                    $res .= $item['created_at'] . "&nbsp;&nbsp;&nbsp;&nbsp;" . $customer['nickname'] . "<br/><br/>";
                    $res .= "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" . $item['ask_content'] . "<br/>";
                    $res .= "<hr>";
                } else {
                    $res .= $item['created_at'] . "&nbsp;&nbsp;&nbsp;&nbsp;" . $customer['nickname'] . "<br/><br/>";
                    $res .= "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" . '<img src="http://' . $_SERVER["HTTP_HOST"] . '/upload/' . $item['ask_img'] . '""><br/>';
                    $res .= "<hr>";
                }
                if ($item['reply_content']) {
                    $res .= $item['created_at'] . "&nbsp;&nbsp;&nbsp;&nbsp;" . "客服" . "<br/><br/>";
                    $res .= "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" . $item['reply_content'] . "<br/>";
                    $res .= "<hr>";
                }
            }
            return $res;
        });


        $form->textarea('reply_content', '回复消息');

        $form->saving(function (Form $form) {
            $reply_content = $form->reply_content;
            $form->reply_content = "";
            $ask = CustomerAsk::query()->where('ask_id', $form->model()->ask_id)->orderBy('id', 'desc')->first();
            $ask->reply_content = $reply_content;
            $ask->save();
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
