<?php

namespace Sands\Asasi\Scaffold\Maker\Fields;

class Fillable
{
    public function make($fields, $modelParams)
    {
        return implode("\n", array_map(function($params) use ($modelParams) {
            return "        '{$params[0]}',";
        }, $fields));
    }
}