<?php

namespace App\Admin\Controllers;

use App\Modules\CustomerAsk;
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

        $grid->column('id', __('Id'));
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));
        $grid->column('retail_order_line_id', __('Retail order line id'));
        $grid->column('customer_id', __('Customer id'));
        $grid->column('pro_id', __('Pro id'));
        $grid->column('ask_id', __('Ask id'));
        $grid->column('ask_content', __('Ask content'));
        $grid->column('ask_img', __('Ask img'));
        $grid->column('reply_content', __('Reply content'));

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

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('retail_order_line_id', __('Retail order line id'));
        $show->field('customer_id', __('Customer id'));
        $show->field('pro_id', __('Pro id'));
        $show->field('ask_id', __('Ask id'));
        $show->field('ask_content', __('Ask content'));
        $show->field('ask_img', __('Ask img'));
        $show->field('reply_content', __('Reply content'));

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

        $form->number('retail_order_line_id', __('Retail order line id'));
        $form->number('customer_id', __('Customer id'));
        $form->number('pro_id', __('Pro id'));

        $form->display('ask_id', '消息内容')->with(function ($ask_id) {
            $ask_list = CustomerAsk::where('ask_id', $ask_id)->orderBy('id', 'asc')->get();
            $res = "";

            foreach ($ask_list as $item) {
                if ($item['ask_content']) {
                    $res .= $item['created_at'] . '  ：   ' . $item['ask_content'] . "<br/>";

                } else {
                    $res .= $item['created_at'] . '  ：   <img src="http://' . $_SERVER["HTTP_HOST"] . '/upload/' . $item['ask_img'] . '""><br/>';
                }
                $res .= "<hr>";
            }

            return $res;
        });



        $form->textarea('reply_content', __('Reply content'));

        return $form;
    }
}
