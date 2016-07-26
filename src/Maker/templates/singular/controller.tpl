<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\ModelName;
use App\DataTables\ModelNamesDataTable;
use App\DataTables\RevisionsDataTable;
use App\Http\Controllers\Controller;
use App\Http\Requests\ModelNameRequest;
use App\Repositories\ModelNamesRepository;
use Illuminate\Http\Request;

class ModelNamesController extends Controller
{
    public function __construct()
    {
        $this->middleware('policy');
    }

    public function index(ModelNamesDataTable $table)
    {
        return $table->render('model-names.index');
    }

    public function create(Request $request)
    {
        return view('model-names.create', ['modelName' => new ModelName]);
    }

    public function store(ModelNameRequest $request)
    {
        $inputs             = $request->all();
        $modelName          = ModelNamesRepository::create(new ModelName, $inputs);

        return redirect()
            ->route('model-names.show', $modelName->id)
            ->with('notice', trans('model-names.notices.created', ['name' => $modelName->name]));
    }

    public function show(ModelName $modelName)
    {
        return view('model-names.show', compact('modelName'));
    }

    public function edit(ModelName $modelName)
    {
        return view('model-names.edit', compact('modelName'));
    }

    public function update(ModelNameRequest $request, ModelName $modelName)
    {
        $inputs = $request->all();

        $modelName = ModelNamesRepository::update($modelName, $inputs);

        if ($roles = $request->get('roles', [])) {
            $modelName->roles()->sync($roles);
        }

        return redirect()
            ->route('model-names.edit', $modelName->id)
            ->with('notice', trans('model-names.notices.updated', ['name' => $modelName->name]));
    }

    public function duplicate(ModelName $modelName)
    {
        $modelName->name = $modelName->name . '-' . str_random(4);
        $modelName = ModelNamesRepository::duplicate($modelName);
        return redirect()
            ->action('ModelNamesController@edit', $modelName->getSlug())
            ->with('success', trans('model-names.created', ['name' => $modelName->name]));
    }

    public function destroy(ModelName $modelName)
    {
        ModelNamesRepository::delete($modelName);
        return redirect()
            ->route('model-names.index')
            ->with('notice', trans('model-names.notices.deleted', ['name' => $modelName->name]));
    }

    public function logs(ModelName $modelName, ModelNameLogsDataTable $table)
    {
        $table->setActionable($modelName);
        return $table->render('model-names.logs', compact('modelName'));
    }
}
