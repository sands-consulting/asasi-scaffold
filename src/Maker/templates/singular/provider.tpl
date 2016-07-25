<?php

namespace App\Providers\Modules;

use Illuminate\Support\ServiceProvider;

class ModelNamesProvider extends ServiceProvider
{
    protected $controller = 'App\Http\Controllers\ModelNamesController';

    /**
     * Bootstrap the application services.
     *
     * @return void
     */
    public function boot()
    {
        app('policy')->register($this->controller, 'App\Policies\ModelNamesPolicy');
    }

    /**
     * Register the application services.
     *
     * @return void
     */
    public function register()
    {
        // module routing
        app('router')->group(['namespace' => 'App\Http\Controllers'], function ($router) {
            // $router->bind('model_names', function($slug) {
            //     if(!$modelName = (ModelName::whereSlug($slug)->first() ?: ModelName::find($slug)))
            //         app()->abort(404);
            //     return $modelName;
            // });
            $router->model('model_name', 'App\ModelName');

            $router->get('model-names/{model_name}/logs', [
                'as'    => 'model-names.logs',
                'uses'  => 'ModelNamesController@logs'
            ]);
            $router->get('model-names/{model_name}/revisions', [
                'as'    => 'model-names.revisions',
                'uses'  => 'ModelNamesController@revisions'
            ]);
            $router->post('model-names/{model_name}/duplicate', [
                'as'    => 'model-names.duplicate',
                'uses'  => 'ModelNamesController@duplicate'
            ]);
            $router->resource('model-names', 'ModelNamesController');
        });
    }
}
