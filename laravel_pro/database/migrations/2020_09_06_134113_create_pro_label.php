<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProLabel extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('pro_label', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->timestamps();

            $table->string('label_name', '255')->comment('标签名称');
            $table->integer('order_by')->default(10)->comment('排序值');
            $table->tinyInteger('status')->default(1)->comment('状态 0下架 1上架');

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
