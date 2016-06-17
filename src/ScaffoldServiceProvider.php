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
        //
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
            return new Fields\Form();
        });
        app()->bind('scaffold.show', function(){
            return new Fields\Show();
        });
        app()->bind('scaffold.lang', function(){
            return new Fields\Lang();
        });
        app()->bind('scaffold.index', function(){
            return new Fields\Index();
        });
        app()->bind('scaffold.migration', function(){
            return new Fields\Migration();
        });
        app()->bind('scaffold.fillable', function(){
            return new Fields\Fillable();
        });
        app()->bind('scaffold.migrationfkup', function(){
            return new Fields\MigrationFkUp();
        });
        app()->bind('scaffold.migrationfkdown', function(){
            return new Fields\MigrationFkDown();
        });
        app()->bind('scaffold.modelfkmethods', function(){
            return new Fields\ModelFkMethods();
        });
        app()->bind('scaffold.validation', function(){
            return new Fields\Validation();
        });
        app()->bind('scaffold.migrationmanytomanyup', function(){
            return new Fields\MigratonManyToManyUp();
        });
        app()->bind('scaffold.migrationmanytomanydown', function(){
            return new Fields\MigratonManyToManyDown();
        });
        app()->bind('scaffold.revisionablename', function(){
            return new Fields\RevisionableName();
        });
        app()->bind('scaffold.revisionablevalue', function(){
            return new Fields\RevisionableValue();
        });

        $this->registerCommand();
    }

    public function registerCommand()
    {
        app()->singleton('scaffoldcmd', function(){
            return new ScaffoldCommand;
        });

        $this->commands('scaffoldcmd');
    }

}
