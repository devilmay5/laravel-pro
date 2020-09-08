<?php

namespace App\Admin\Controllers;

use App\Modules\ProSpecsDetail;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class ProSpecsDetailController extends AdminController
{
    const REMOTE_URL_PRO_BRAND = '/api/pro_brand/get-brand-select';
    const REMOTE_URL_PRO_CLASS = '/api/pro_class/get-class-select';
    const REMOTE_URL_PRO_SPECS_CLASS = '/api/pro_specs_class/get-specs-class-select';


    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '规格详情';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new ProSpecsDetail());

        $grid->column('id', __('Id'));
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));
        $grid->column('brand_id', __('Brand id'));
        $grid->column('class_id', __('Class id'));
        $grid->column('specs_class_id', __('Specs class id'));
        $grid->column('detail_name', __('Detail name'));
        $grid->column('status', __('Status'));
        $grid->column('order_by', __('Order by'));

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
        $show = new Show(ProSpecsDetail::findOrFail($id));


        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new ProSpecsDetail());

        $form->select('brand_id', '品牌名称')->options(self::REMOTE_URL_PRO_BRAND)->load('class_id', self::REMOTE_URL_PRO_CLASS)->required();

        $form->select('class_id', '所属产品分类')->options(self::REMOTE_URL_PRO_CLASS)->load('specs_class_id', self::REMOTE_URL_PRO_SPECS_CLASS)->required();
        $form->select('specs_class_id', '规格分类')->required();
        $form->text('detail_name', '规格详情名称')->required();
        $form->switch('status', '状态')->default(1)->required();
        $form->number('order_by', '排序值')->default(10)->required();


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
