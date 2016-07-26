<?php

use App\Banner;
use App\News;
use App\NewsCategory;
use App\Repositories\BannerRepository;
use App\Repositories\NewsRepository;
use App\Repositories\NewsCategoryRepository;
use Illuminate\Database\Seeder;

class NewsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('model-names')->truncate();

        $permissions = [
            ['model-names:index',                  'List all model names'],
            ['model-names:show',                   'View a model names'],
            ['model-names:create',                 'Create new model names'],
            ['model-names:update',                 'Update existing model names'],
            ['model-names:delete',                 'Delete exisiting model names'],
        ];

        foreach ($permissions as $permissionData) {
            PermissionsRepository::create(new Permission(), [
                'name'          => $permissionData[0],
                'description'   => $permissionData[1],
            ]);
        }

        ModelNamesRepository::create([
            // Your master data
        ]);
    }
}
