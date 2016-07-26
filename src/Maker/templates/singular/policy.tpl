<?php

namespace App\Policies;

use App\ModelName;

class ModelNamesPolicy extends BasePolicy
{
    public function index()
    {
        return $this->user->hasPermission('model-name:list');
    }

    public function show(ModelName $modelName)
    {
        return $this->user->hasPermission('model-name:show');
    }

    public function create()
    {
        return $this->user->hasPermission('model-name:create');
    }

    public function store()
    {
        return $this->create();
    }

    public function edit(ModelName $modelName)
    {
        return $this->user->hasPermission('model-name:update');
    }

    public function update(ModelName $modelName)
    {
        return $this->edit($modelName);
    }

    public function duplicate(ModelName $modelName)
    {
        return $this->user->hasPermission('model-name:duplicate');
    }

    public function revisions(ModelName $modelName)
    {
        return $this->user->hasPermission('model-name:revisions');
    }

    public function destroy(ModelName $modelName)
    {
        return $this->user->hasPermission('model-name:delete');
    }
}