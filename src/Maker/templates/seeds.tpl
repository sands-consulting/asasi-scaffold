<?php

use App\Repositories\PermissionGroupsRepository;
use App\Repositories\PermissionsRepository;
use App\Repositories\ModelNamesRepository;
use Illuminate\Database\Seeder;
use App\PermissionGroup;
use App\Permission;
use App\ModelName;

class ModelNameSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('model_names')->truncate();

        $modelNames = [];

        foreach ($modelNames as $modelNameData) {
            ModelNamesRepository::create(new ModelName, $modelNameData);
        }

        $permissionGroup = PermissionGroupsRepository::create(new PermissionGroup, ['name' => 'Model Names']);

        $permissionGroup->permissions()->saveMany(array_map(function($permissionData){
            return new Permission($permissionData);
        }, [
            ['name' => 'model-name:index', 'display_name' => 'List all model name'],
            ['name' => 'model-name:show', 'display_name' => 'View model name details'],
            ['name' => 'model-name:create', 'display_name' => 'Create new model name'],
            ['name' => 'model-name:update', 'display_name' => 'Update existing model name'],
            ['name' => 'model-name:duplicate', 'display_name' => 'Duplicate existing model name'],
            ['name' => 'model-name:revisions', 'display_name' => 'View revisions for model name'],
            ['name' => 'model-name:delete', 'display_name' => 'Delete existing model name'],
        ]));
    }
}
