<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Blog extends Model
{
    use HasFactory;
    protected $fillable=[
        'category_id',
        'title',
        'description',
        'likes',
        'comments',
        'button_text',
        'button_url',
        'button_target',
        'image',
        'status'
    ];
    public function category(){
        return $this->BelongsTo(Category::class);
    }
}
