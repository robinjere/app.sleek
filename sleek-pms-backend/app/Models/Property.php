<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Property extends Model
{
    use SoftDeletes;

    protected $fillable = [
        'title',
        'description',
        'address',
        'property_type',
        'bedrooms',
        'bathrooms',
        'square_footage',
        'price',
        'is_available',
        'year_built',
        'amenities',
        'latitude',
        'longitude'
    ];

    protected $casts = [
        'is_available' => 'boolean',
        'amenities' => 'array',
        'price' => 'float',
        'year_built' => 'integer'
    ];

    // Validation rules for property creation/update
    public static function rules($id = null)
    {
        return [
            'title' => 'required|string|max:255',
            'description' => 'nullable|string',
            'address' => 'required|string|max:500',
            'property_type' => 'required|in:residential,commercial,apartment,villa',
            'bedrooms' => 'integer|min:0|max:50',
            'bathrooms' => 'integer|min:0|max:20',
            'square_footage' => 'numeric|min:0',
            'price' => 'numeric|min:0',
            'is_available' => 'boolean',
            'year_built' => 'integer|min:1800|max:' . date('Y'),
            'amenities' => 'nullable|array',
            'latitude' => 'nullable|numeric|between:-90,90',
            'longitude' => 'nullable|numeric|between:-180,180'
        ];
    }
}
