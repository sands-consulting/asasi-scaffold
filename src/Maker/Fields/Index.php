<?php

namespace Sands\Asasi\Scaffold\Maker\Fields;

class Index
{
    public function make($fields, $modelParams)
    {
        return implode("\n", array_map(function($params) use ($modelParams) {
            return "            [
                                    'data' => '{$params[0]}',\n 
                                    'name' => '{$params[0]}',\n
                                    'title' => trans('{$modelParams['model-names']}.{$params[0]}')
                                ],";
        }, $fields));
    }
}