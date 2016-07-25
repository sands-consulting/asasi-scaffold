<?php

namespace App\DataTables;

use App\ModelName;

class ModelNamesDataTable extends DataTable
{
    public function ajax()
    {
        return $this->datatables
            ->eloquent($this->query())
            ->addColumn('action', function($user) {
                return view('model-names._index_actions', compact('model_name'));
            })
            ->editColumn('name', function($user) {
                return link_to_route('model-names.show', $modelName->name, $modelName->id);
            })
            ->editColumn('status', function($user) {
                return view('model-names._index_status', compact('model_name'));
            })
            ->make(true);
    }

    public function query()
    {
        $query = ModelName::all();

        if($this->datatables->request->input('q', null))
        {
            $query->search($this->datatables->request->input('q', []));
        }

        return $this->applyScopes($query);
    }

    public function html()
    {
        return $this->builder()
                    ->columns($this->getColumns())
                    ->ajax('')
                    ->addAction(['width' => '80', 'class' => 'text-center'])
                    ->parameters($this->getBuilderParameters());
    }

    protected function getColumns()
    {
        return [
INDEXCOLUMNS
        ];
    }

    protected function filename()
    {
        return 'model_names_dt_' . time();
    }
}
