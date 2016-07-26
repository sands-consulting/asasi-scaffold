<?php

namespace App\Http\Requests;

use Sands\Asasi\Foundation\Http\FormRequest;

class ModelNamesRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function storeRules()
    {
        return [
REQUESTS
        ];
    }

    public function updateRules()
    {
        return [
REQUESTS
        ];
    }
}