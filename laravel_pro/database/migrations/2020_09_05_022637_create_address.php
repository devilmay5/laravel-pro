<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAddress extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('address', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->timestamps();

            $table->integer('customer_id')->default(0)->nullable(false)->comment('客户id');
            $table->integer('province')->comment('省');
            $table->integer('city')->comment('市');
            $table->integer('area')->comment('区');
            $table->string('address', 255)->comment('地址');
            $table->string('consignee_name', 255)->comment('收货人姓名');
            $table->char('consignee_mobile', 11)->comment('收货人手机号');
            $table->tinyInteger('is_default')->default(0)->comment('是否是默认地址 0不是 1是');

            $table->index('customer_id');

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
        Schema::dropIfExists('address');
    }
}
