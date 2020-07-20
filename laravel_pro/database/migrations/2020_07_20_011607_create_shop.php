<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateShop extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('shop', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->timestamps();
            $table->string('name', 100)->nullable(false)->comment('店铺名称');
            $table->tinyInteger('business_status')->nullable(false)->default(0)->comment('营业状态：0休业 1营业');
            $table->string('business_timezone', 255)->comment('营业时间段');
            $table->integer('province')->comment('省');
            $table->integer('city')->comment('市');
            $table->integer('area')->comment('区');
            $table->string('address', 255)->comment('地址');
            $table->string('phone')->comment('联系电话');
            $table->integer('attention')->default(0)->comment('关注量');
            $table->integer('is_branch')->default(0)->nullable(true)->comment('是否是分店：0不是 1是');
            $table->integer('parent_branch')->default(0)->nullable(true)->comment('父级店铺id');
            $table->json('extention')->nullable(true)->comment('扩展字段');

            $table->index('name');

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
        Schema::dropIfExists('shop');
    }
}
