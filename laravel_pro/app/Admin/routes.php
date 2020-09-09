<?php

use Illuminate\Routing\Router;

Admin::routes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
    'as'            => config('admin.route.prefix') . '.',
], function (Router $router) {

    $router->get('/', 'HomeController@index')->name('home');
    $router->resource('users', UserController::class);
    $router->resource('shops', ShopController::class);
    $router->resource('customer', CustomerController::class);
    $router->resource('address', AddressController::class);
    $router->resource('pro-label', ProLabelController::class);
    $router->resource('pro-brand', ProBrandController::class);
    $router->resource('pro-class', ProClassController::class);
    $router->resource('pro-info', ProInfoController::class);
    $router->resource('freight-template', FreightTemplateController::class);



    //废
    $router->resource('pro-specs-class', ProSpecsClassController::class);
    //废
    $router->resource('pro-specs-detail', ProSpecsDetailController::class);
});
