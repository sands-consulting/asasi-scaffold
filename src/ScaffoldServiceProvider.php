<?php

namespace Sands\Scaffold;

use Illuminate\Support\ServiceProvider;
use Sands\Scaffold\Fields\Form;

class ScaffoldServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap the application services.
     *
     * @return void
     */
    public function boot()
    {
        $this->publishes([
            __DIR__.'Scaffold/templates/' => config_path('sands/scaffold/templates')
        ], 'templates');
    }

    /**
     * Register the application services.
     *
     * @return void
     */
    public function register()
    {
        app()->singleton('scaffold', function(){
            return new Scaffold;
        });
        app()->bind('scaffold.form', function(){
            return new Maker\Fields\Form();
        });
        app()->bind('scaffold.show', function(){
            return new Maker\Fields\Show();
        });
        app()->bind('scaffold.lang', function(){
            return new Maker\Fields\Lang();
        });
        app()->bind('scaffold.index', function(){
            return new Maker\Fields\Index();
        });
        app()->bind('scaffold.migration', function(){
            return new Maker\Fields\Migration();
        });
        app()->bind('scaffold.fillable', function(){
            return new Maker\Fields\Fillable();
        });
        app()->bind('scaffold.migrationfkup', function(){
            return new Maker\Fields\MigrationFkUp();
        });
        app()->bind('scaffold.migrationfkdown', function(){
            return new Maker\Fields\MigrationFkDown();
        });
        app()->bind('scaffold.modelfkmethods', function(){
            return new Maker\Fields\ModelFkMethods();
        });
        app()->bind('scaffold.validation', function(){
            return new Maker\Fields\Validation();
        });
        app()->bind('scaffold.migrationmanytomanyup', function(){
            return new Maker\Fields\MigratonManyToManyUp();
        });
        app()->bind('scaffold.migrationmanytomanydown', function(){
            return new Maker\Fields\MigratonManyToManyDown();
        });
        app()->bind('scaffold.revisionablename', function(){
            return new Maker\Fields\RevisionableName();
        });
        app()->bind('scaffold.revisionablevalue', function(){
            return new Maker\Fields\RevisionableValue();
        });
        app()->bind('fkmigrator', function(){
            return new FKMigrator\FKMigrator();
        });
        $this->registerCommand();
    }

    public function registerCommand()
    {
        app()->singleton('scaffoldcmd', function(){
            return new Maker\MakerCommand;
        });
        $this->commands('scaffoldcmd');

        app()->singleton('scaffoldremovercmd', function(){
            return new Remover\RemoverCommand;
        });
        $this->commands('scaffoldremovercmd');
    }
}
