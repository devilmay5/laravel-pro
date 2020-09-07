<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProSpecsClass extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('pro_specs_class', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->timestamps();

            $table->integer('brand_id')->nullable(false)->comment('品牌id');
            $table->integer('class_id')->nullable(false)->comment('分类id');
            $table->string('specs_name', 255)->nullable(false)->comment('规格分类名称');

            $table->tinyInteger('status')->default(1)->comment('状态 0下架 1上架');
            $table->integer('order_by')->default(10)->comment('排序值');

            $table->index('class_id');
            $table->index('brand_id');

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
        Schema::dropIfExists('pro_specs');
    }
}
