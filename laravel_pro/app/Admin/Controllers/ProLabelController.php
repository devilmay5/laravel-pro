<?php

namespace App\Admin\Controllers;

use App\Modules\Customer;
use App\Modules\ProLabel;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class ProLabelController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '产品标签';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new ProLabel());

        $grid->column('id', 'Id');
        $grid->column('created_at', '创建时间');
        $grid->column('label_name', '标签名称');
        $grid->column('order_by', '排序值')->editable()->sortable();

        $states = [
            'on' => ['value' => ProLabel::STATUS_CODE['ENABLE'], 'text' => '上架', 'color' => 'primary'],
            'off' => ['value' => ProLabel::STATUS_CODE['DISABLE'], 'text' => '下架', 'color' => 'default'],
        ];

        $grid->column('status', '状态')->switch($states);

        $grid->filter(function ($filter) {
            $filter->disableIdFilter();
            $filter->like('label_name', '标签名称');
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
        $show = new Show(ProLabel::findOrFail($id));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new ProLabel());

        $form->text('label_name', '标签名称')->required();
        $form->number('order_by', '排序值')->default(10)->required();
        $states = [
            'on' => ['value' => ProLabel::STATUS_CODE['ENABLE'], 'text' => '上架', 'color' => 'primary'],
            'off' => ['value' => ProLabel::STATUS_CODE['DISABLE'], 'text' => '下架', 'color' => 'default'],
        ];
        $form->switch('status', '状态')->states($states)->required();

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
