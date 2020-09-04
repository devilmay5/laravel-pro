<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCustomer extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('customer', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->timestamps();

            $table->string('nickname', 255)->default('')->comment('用户名');
            $table->char('mobile',11)->default(0)->comment('手机号');
            $table->string('wechat_openid', 255)->default('')->comment('微信uid');
            $table->mediumText('head_img_url')->comment('头像');
            $table->tinyInteger('status')->default(1)->comment('会员状态 0停用 1启用');

            $table->index('mobile');

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
        Schema::dropIfExists('customer');
    }
}
