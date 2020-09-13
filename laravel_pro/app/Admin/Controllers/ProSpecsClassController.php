<?php

namespace App\Admin\Controllers;

use App\Modules\ProInfo;
use App\Modules\ProLabel;
use App\Modules\ProSpecsClass;
use App\Services\ProBrandServices;
use App\Services\ProClassServices;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class ProSpecsClassController extends AdminController
{
    const REMOTE_URL_PRO_BRAND = '/api/pro_brand/get-brand-select';
    const REMOTE_URL_PRO_CLASS = '/api/pro_class/get-class-select';
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '规格分类';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new ProSpecsClass());

        $grid->column('id', 'Id');
        $grid->column('created_at', '创建时间');
        $grid->column('brand_id', '品牌名称')->display(function ($brand_id) {
            $brandInfo = ProBrandServices::getBrandInfo($brand_id);
            return $brandInfo['brand_name'];
        });
        $grid->column('class_id', '所属分类')->display(function ($class_id) {
            $classInfo = ProClassServices::getProClassInfo($class_id);
            return $classInfo['class_name'];
        });
        $grid->column('specs_name', '规格分类名称');
        $states = [
            'on' => ['value' => ProSpecsClass::STATUS_CODE['ENABLE'], 'text' => '上架', 'color' => 'primary'],
            'off' => ['value' => ProSpecsClass::STATUS_CODE['DISABLE'], 'text' => '下架', 'color' => 'default'],
        ];
        $grid->column('status', '状态')->switch($states);
        $grid->column('order_by', '排序值')->editable()->sortable();

        $grid->filter(function ($filter) {
            $filter->disableIdFilter();
            $filter->equal('brand_id', '品牌名称')->select(self::REMOTE_URL_PRO_BRAND)->load('class_id', self::REMOTE_URL_PRO_CLASS);
            $filter->equal('class_id', '所属分类')->select(self::REMOTE_URL_PRO_CLASS);
            $filter->like('specs_name', '规格分类名称');
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
        $show = new Show(ProSpecsClass::findOrFail($id));


        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new ProSpecsClass());

        $form->select('brand_id', '品牌名称')->options(self::REMOTE_URL_PRO_BRAND)->load('class_id', self::REMOTE_URL_PRO_CLASS)->required();

        $form->select('class_id', '所属产品分类')->options(self::REMOTE_URL_PRO_CLASS)->required();

        $form->text('specs_name', '规格分类名称')->required();

        $form->number('order_by', '排序值')->default(10)->required();
        $states = [
            'on' => ['value' => ProSpecsClass::STATUS_CODE['ENABLE'], 'text' => '上架', 'color' => 'primary'],
            'off' => ['value' => ProSpecsClass::STATUS_CODE['DISABLE'], 'text' => '下架', 'color' => 'default'],
        ];
        $form->switch('status', '状态')->states($states);

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
