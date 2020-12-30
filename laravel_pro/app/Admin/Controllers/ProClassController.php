<?php

namespace App\Admin\Controllers;

use App\Modules\ProBrand;
use App\Modules\ProClass;
use App\Services\ProBrandServices;
use App\Services\ProClassServices;
use App\Services\ProInfoServices;
use App\Services\ProLabelServices;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Encore\Admin\Tree;
use Encore\Admin\Layout\Content;
use Illuminate\Support\Facades\Log;

class ProClassController extends AdminController
{
    const REMOTE_URL_PRO_LABEL = '/api/pro_label/get-pro_label-select';
    const REMOTE_URL_PRO_BRAND = '/api/pro_brand/get-brand-select';
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '产品分类';

    public function index(Content $content)
    {
        $tree = new Tree(new ProClass());

        return $content
            ->header($this->title)
            ->body($tree);
    }


    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new ProClass());

        $grid->column('id', 'Id');
        $grid->column('created_at', '创建时间');
//        $grid->column('label_id', '所属标签')->display(function ($label_id) {
//            $labelInfo = ProLabelServices::getInfoById($label_id);
//            return $labelInfo['label_name'] ?? '';
//        });
        $grid->column('brand_id', '品牌名称')->display(function ($brand_id) {
            $brandInfo = ProBrandServices::getBrandInfo($brand_id);
            return $brandInfo['brand_name'] ?? '';
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
            $filter->equal('label_id', '所属标签')->select(self::REMOTE_URL_PRO_LABEL)->load('brand_id', self::REMOTE_URL_PRO_BRAND);
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
        $form->text('id', '分类Id')->readonly();

        $label_list = ProLabelServices::getEnableList();
        $options_label = [];
        foreach ($label_list as $item) {
            $options_label[$item['id']] = $item['label_name'];
        }

//        $form->select('label_id', '所属标签')->options($options_label)->load('brand_id', self::REMOTE_URL_PRO_BRAND)->required();

        [$brand_list, $count] = ProBrandServices::getBrandList(0, 0, 0);
        $options_brand = [];
        foreach ($brand_list as $key => $item) {
            $options_brand[$item['brand_id']] = $item['brand_name'];
        }
        $form->select('brand_id', '产品品牌')->options($options_brand)->required();
        $form->select('parent_id', '父级分类')->options(ProClass::selectOptions())->required();
        $form->text('class_name', '分类名称')->required();
        $form->image('class_img', '分类图片')->uniqueName()->required();
        $form->switch('status', '状态')->default(1);
        $form->number('order_by', '排序值')->default(10)->required();

        $form->saved(function (Form $form) {
            ProClassServices::setProInfoStatus($form->model()->id, $form->model()->status);
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
