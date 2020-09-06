<?php

namespace App\Admin\Controllers;

use App\Modules\ProBrand;
use App\Modules\ProLabel;
use App\Services\ProLabelServices;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class ProBrandController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'ProBrand';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new ProBrand());

        $grid->column('id', 'Id');
        $grid->column('created_at', '创建时间');
        $grid->column('label_id', '所属标签')->display(function ($label_id) {
            $labelInfo = ProLabelServices::getInfoById($label_id);
            return $labelInfo->label_name;
        });
        $grid->column('brand_name', '品牌名称');

        $states = [
            'on' => ['value' => ProBrand::STATUS_CODE['ENABLE'], 'text' => '上架', 'color' => 'primary'],
            'off' => ['value' => ProBrand::STATUS_CODE['DISABLE'], 'text' => '下架', 'color' => 'default'],
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
        $show = new Show(ProBrand::findOrFail($id));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new ProBrand());

        $form->select('label_id', '所属标签')->options('/api/pro_label/get-pro_label-select');
        $form->text('brand_name', '品牌名称');
        $form->textarea('description', '描述');
        $form->image('brand_image', 'LOGO')->uniqueName();
        $states = [
            'on' => ['value' => ProBrand::STATUS_CODE['ENABLE'], 'text' => '上架', 'color' => 'primary'],
            'off' => ['value' => ProBrand::STATUS_CODE['DISABLE'], 'text' => '下架', 'color' => 'default'],
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
