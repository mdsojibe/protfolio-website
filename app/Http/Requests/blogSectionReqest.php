<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class blogSectionReqest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        $rules= [
            'title'       => 'required|unique:blogs,title',
            'description' => 'required',
            'image'       => 'required|mimes:png,jpg,jpeg|file',
            'status'      => 'required'
        ];
        if(request()->image !=null){
            $rules['image']='required';
        }
        return $rules;
    }
}
