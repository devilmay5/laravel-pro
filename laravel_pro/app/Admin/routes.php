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
    $router->resource('retail-order', RetailOrderController::class);
    $router->resource('customer-ask', AskController::class);
    $router->resource('advertisement', AdvertisementController::class);
    $router->resource('about', AboutController::class);
    $router->resource('feedback', FeedbackController::class);
    $router->resource('retail-refund', RetailRefundController::class);
    $router->resource('common-problem', CommonProblemController::class);
    $router->resource('system-push', SystemPushController::class);
    $router->resource('news-class', NewsClassController::class);
    $router->resource('news', NewsController::class);
    //废
    $router->resource('pro-specs-class', ProSpecsClassController::class);
    //废
    $router->resource('pro-specs-detail', ProSpecsDetailController::class);
});
