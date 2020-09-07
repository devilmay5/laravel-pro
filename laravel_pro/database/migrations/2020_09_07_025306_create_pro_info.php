<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProInfo extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('pro_info', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->timestamps();

            $table->integer('label_id')->nullable(false)->comment('标签id');
            $table->integer('brand_id')->nullable(false)->comment('品牌id');
            $table->integer('class_id')->nullable(false)->comment('分类id');

            $table->string('pro_name', '255')->nullable(false)->comment('产品名称');
            $table->decimal('original_price',8,2)->default(0)->nullable(false)->comment('原价');
            $table->decimal('present_price',8,2)->default(0)->nullable(false)->comment('现价');
            $table->mediumText('cover_image_url')->comment('封面图');
            $table->json('detail_image_url')->comment('详情图');
            $table->mediumText('description')->comment('描述');
            $table->json('detail_params')->comment('参数详情');
            $table->integer('total_count')->default(0)->comment('库存总计');
            $table->integer('sale_count')->default(0)->comment('销量总计');

            $table->tinyInteger('status')->default(1)->comment('状态 0下架 1上架');
            $table->integer('order_by')->default(10)->comment('排序值');

            $table->index('order_by');
            $table->index('label_id');
            $table->index(['brand_id', 'order_by']);
            $table->index(['class_id', 'order_by']);

            $table->engine = 'InnoDB';
            $table->charset = 'utf8mb4';
            $table->collation = 'utf8mb4_unicode_ci';
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('pro_info');
    }
}
