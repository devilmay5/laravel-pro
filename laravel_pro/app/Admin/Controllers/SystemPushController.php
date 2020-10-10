<?php

namespace App\Admin\Controllers;

use App\Modules\SystemPush;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class SystemPushController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '系统推送';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new SystemPush());

        $grid->column('id', __('Id'));
        $grid->column('created_at', '创建时间');
        $grid->column('title', '标题');

        $grid->column('order_by', '排序值')->editable()->sortable();
        $states = [
            'on' => ['value' => SystemPush::STATUS_CODE['ENABLE'], 'text' => '启用', 'color' => 'primary'],
            'off' => ['value' => SystemPush::STATUS_CODE['DISABLE'], 'text' => '禁用', 'color' => 'default'],
        ];
        $grid->column('status', '状态')->switch($states);

        $grid->filter(function ($filter) {
            $filter->disableIdFilter();

            $filter->like('title', '标题');

            $status_group = [
                SystemPush::STATUS_CODE['DISABLE'] => '禁用',
                SystemPush::STATUS_CODE['ENABLE'] => '启用',
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
        $show = new Show(SystemPush::findOrFail($id));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new SystemPush());

        $form->text('title', '标题')->required();
        $form->ckeditor('content', '文本')->required();
        $form->number('order_by', '排序值')->default(10);
        $form->switch('status', '状态')->default(1);

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
