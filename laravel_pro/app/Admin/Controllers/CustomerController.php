<?php

namespace App\Admin\Controllers;

use App\Modules\Customer;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class CustomerController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '客户管理-基本信息';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Customer());

        $grid->column('id', 'ID')->sortable();
        $grid->column('nickname', '用户名');
        $grid->column('mobile', '手机号');
        $grid->column('status', '状态')->display(function ($status) {
            return $status ? '启用' : '禁用';
        });
        $grid->column('created_at', '创建时间');

        $grid->filter(function ($filter) {
            $filter->disableIdFilter();

            $filter->like('nickname', '用户名');
            $filter->like('mobile', '手机号');

            $status_group = [
                Customer::STATUS_CODE['DISABLE'] => '禁用',
                Customer::STATUS_CODE['ENABLE'] => '启用',
            ];
            $filter->equal('status', '状态')->select($status_group);
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
        $show = new Show(Customer::findOrFail($id));
        $show->field('id', 'ID');
        $show->field('nickname', '用户名');
        $show->field('mobile', '手机号');
        $show->field('status', '状态')->as(function ($status) {
            return $status ? '启用' : '禁用';
        });
        $show->field('mobile', '手机号');
        $show->head_img_url('头像')->image();
        $show->field('created_at', '创建时间');

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Customer());

        $form->display('id', 'ID');
        $form->text('nickname', '用户名');
        $form->mobile('mobile', '手机号');

        $status = [
            'on' => ['value' => 1, 'text' => '启用', 'color' => 'success'],
            'off' => ['value' => 0, 'text' => '禁用', 'color' => 'danger'],
        ];
        $form->image('head_img_url', '头像')->uniqueName();
        $form->switch('status', '状态')->states($status);
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
