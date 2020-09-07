<?php

namespace App\Admin\Controllers;

use App\Modules\ProBrand;
use App\Modules\ProClass;
use App\Services\ProBrandServices;
use App\Services\ProLabelServices;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class ProClassController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '产品分类';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new ProClass());

        $grid->column('id', __('Id'));
        $grid->column('created_at', '创建时间');
        $grid->column('label_id', '所属标签')->display(function ($label_id) {
            $labelInfo = ProLabelServices::getInfoById($label_id);
            return $labelInfo['label_name'];
        });
        $grid->column('brand_id', '品牌名称')->display(function ($brand_id) {
            $brandInfo = ProBrandServices::getBrandInfo($brand_id);
            return $brandInfo['brand_name'];
        });
        $grid->column('class_name', '分类名称');
        $grid->column('order_by', '排序值')->editable()->sortable();

        $states = [
            'on' => ['value' => ProClass::STATUS_CODE['ENABLE'], 'text' => '上架', 'color' => 'primary'],
            'off' => ['value' => ProClass::STATUS_CODE['DISABLE'], 'text' => '下架', 'color' => 'default'],
        ];
        $grid->column('status', '状态')->switch($states);

        $grid->filter(function ($filter) {
            $filter->disableIdFilter();
            $filter->equal('label_id', '所属标签')->select('/api/pro_label/get-pro_label-select')->load('brand_id', '/api/pro_brand/get-brand-select');
            $filter->equal('brand_id', '品牌名称')->select();
            $filter->like('class_name', '分类名称');
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
        $show = new Show(ProClass::findOrFail($id));


        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new ProClass());

        $form->select('label_id', '所属标签')->options('/api/pro_label/get-pro_label-select')->load('brand_id', '/api/pro_brand/get-brand-select');
        $form->select('brand_id', '产品品牌');
        $form->text('class_name', '分类名称');
        $form->switch('status', '状态')->default(1);
        $form->number('order_by', '排序值')->default(10);

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
