<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProBrand extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('pro_brand', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->timestamps();

            $table->integer('label_id')->nullable(false)->comment('标签Id');
            $table->string('brand_name', '255')->nullable(false)->comment('品牌名称');
            $table->mediumText('description')->comment('描述');
            $table->mediumText('brand_image')->comment('logo');
            $table->tinyInteger('status')->default(1)->comment('状态 0下架 1上架');

            $table->index('label_id');
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
        Schema::dropIfExists('pro_brand');
    }
}
