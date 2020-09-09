<?php

namespace App\Admin\Controllers;

use App\Modules\ProInfo;
use App\Modules\ProLabel;
use App\Services\ProBrandServices;
use App\Services\ProClassServices;
use App\Services\ProLabelServices;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class ProInfoController extends AdminController
{
    const REMOTE_URL_PRO_LABEL = '/api/pro_label/get-pro_label-select';
    const REMOTE_URL_PRO_BRAND = '/api/pro_brand/get-brand-select';
    const REMOTE_URL_PRO_CLASS = '/api/pro_class/get-class-select';
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '产品详情';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new ProInfo());

        $grid->column('id', 'Id');
        $grid->column('created_at', '创建时间');
        $grid->column('label_id', '所属标签')->display(function ($label_id) {
            $labelInfo = ProLabelServices::getInfoById($label_id);
            return $labelInfo['label_name'];
        });
        $grid->column('brand_id', '品牌名称')->display(function ($brand_id) {
            $brandInfo = ProBrandServices::getBrandInfo($brand_id);
            return $brandInfo['brand_name'];
        });
        $grid->column('class_id', '分类名称')->display(function ($class_id) {
            $classInfo = ProClassServices::getProClassInfo($class_id);
            return $classInfo['class_name'];
        });
        $grid->column('pro_name', '产品名称');
        $grid->column('original_price', '原价');
        $grid->column('present_price', '现价');
        $states = [
            'on' => ['value' => ProInfo::STATUS_CODE['ENABLE'], 'text' => '上架', 'color' => 'primary'],
            'off' => ['value' => ProInfo::STATUS_CODE['DISABLE'], 'text' => '下架', 'color' => 'default'],
        ];
        $grid->column('status', '状态')->switch($states);

        $states = [
            'on' => ['value' => ProInfo::IS_RECOMMEND['ENABLE'], 'text' => '是', 'color' => 'primary'],
            'off' => ['value' => ProInfo::IS_RECOMMEND['DISABLE'], 'text' => '否', 'color' => 'default'],
        ];
        $grid->column('is_recommend', '相关推荐')->switch($states);

        $grid->column('order_by', '排序值')->editable()->sortable();

        $grid->filter(function ($filter) {
            $filter->disableIdFilter();
            $filter->equal('label_id', '所属标签')->select(self::REMOTE_URL_PRO_LABEL)->load('brand_id', self::REMOTE_URL_PRO_BRAND);
            $filter->equal('brand_id', '品牌名称')->select(self::REMOTE_URL_PRO_BRAND)->load('class_id', self::REMOTE_URL_PRO_CLASS);
            $filter->equal('class_id', '分类名称')->select(self::REMOTE_URL_PRO_CLASS);
            $filter->like('pro_name', '产品名称');
            $filter->between('original_price', '原价');
            $filter->between('present_price', '现价');
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
        $show = new Show(ProInfo::findOrFail($id));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new ProInfo());

        $form->select('label_id', '所属标签')->options(self::REMOTE_URL_PRO_LABEL)->load('brand_id', self::REMOTE_URL_PRO_BRAND)->required();

        $form->select('brand_id', '选择品牌')->options(self::REMOTE_URL_PRO_BRAND)->load('class_id', self::REMOTE_URL_PRO_CLASS)->required();

        $form->select('class_id', '产品分类')->required();
        $form->text('pro_name', '产品名称')->required();
        $form->currency('original_price', '原价')->symbol('￥')->required();
        $form->currency('present_price', '现价')->symbol('￥')->required();
        $form->image('cover_image_url', '封面图片')->uniqueName()->required();
        $form->multipleImage('detail_image_url', '详情图片')->uniqueName();
        $form->ckeditor('description', '产品描述')->required();
        $form->keyValue('detail_params', '详细参数')->required();

        $form->sku('sku_params', '商品SKU');

        $form->text('total_count', '库存总计')->required();
        $form->text('sale_count', '销售数量')->required();
        $form->switch('status', '状态')->default(1)->required();
        $form->switch('is_recommend', '是否相关推荐')->default(0)->required();
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
