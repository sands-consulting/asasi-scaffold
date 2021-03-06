<?php

namespace Sands\Asasi\Scaffold\Maker\Fields;

class RevisionableValue
{
    public function make($fields, $modelParams)
    {
        return implode("\n", array_map(function($params) use ($modelParams) {
            return "            '{$params[1]}'  => 'string:%s',";
        }, $fields));
    }
}