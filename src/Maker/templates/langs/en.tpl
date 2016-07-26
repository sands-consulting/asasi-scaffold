<?php

return [
    'title' => 'Model Names',

    'attributes' => [
LANGENFIELDS
        'created_at' => 'Created At',
        'updated_at' => 'Last Updated At',
    ],

    'buttons' => [
        'create' => 'Create New Model Name',
        'edit' => 'Edit Model Name',
        'all' => 'All Model Names',
    ],

    'notices' => [
        'created' => 'Model Name :name created',
        'updated' => 'Model Name :name updated',
        'deleted' => 'Model Name :name deleted',
    ],
    
    'views' => [
        'index' => [
        ],
        'show' => [
        ],
        'create' => [
            'title' => 'New Model Name',
        ],
        'edit' => [
            'title' => 'Edit'
        ],
        'revisions' => [

        ]
    ],
];