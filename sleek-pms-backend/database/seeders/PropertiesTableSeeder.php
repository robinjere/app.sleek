<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class PropertiesTableSeeder extends Seeder
{
    public function run(): void
    {
        $properties = [
            [
                'title' => 'Luxurious Downtown Apartment',
                'description' => 'Modern 2-bedroom apartment with stunning city views',
                'address' => 'Plot 256, Chupa Ya Hand Street, Masaki, Dar es Salaam, Tanzania',
                'property_type' => 'residential',
                'bedrooms' => 2,
                'bathrooms' => 2,
                'square_footage' => 120.50,
                'price' => 150000000.00,
                'is_available' => true,
                'year_built' => 2020,
                'amenities' => json_encode(['gym', 'swimming_pool', 'security', 'parking']),
                'latitude' => -6.7924,
                'longitude' => 39.2766,
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'title' => 'Office Space in City Center',
                'description' => 'Modern commercial space in the heart of Dar es Salaam business district',
                'address' => 'ABC Tower, Ohio Street, Kisutu, Dar es Salaam, Tanzania',
                'property_type' => 'commercial',
                'bedrooms' => 0,
                'bathrooms' => 4,
                'square_footage' => 350.75,
                'price' => 500000000.00,
                'is_available' => true,
                'year_built' => 2018,
                'amenities' => json_encode(['high_speed_internet', 'conference_rooms', 'elevator', '24x7_security']),
                'latitude' => -6.8160,
                'longitude' => 39.2884,
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'title' => 'Cozy Apartment Near Mount Meru',
                'description' => 'Comfortable apartment in the scenic city of Arusha',
                'address' => 'Plot 45, Sokoine Road, Arusha, Tanzania',
                'property_type' => 'apartment',
                'bedrooms' => 1,
                'bathrooms' => 1,
                'square_footage' => 65.25,
                'price' => 75000000.00,
                'is_available' => true,
                'year_built' => 2022,
                'amenities' => json_encode(['wifi', 'security', 'balcony', 'parking']),
                'latitude' => -3.3667,
                'longitude' => 36.6833,
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'title' => 'Beachfront Villa in Stone Town',
                'description' => 'Luxurious villa with historical charm and ocean views',
                'address' => 'Shangani Street, Stone Town, Zanzibar, Tanzania',
                'property_type' => 'villa',
                'bedrooms' => 3,
                'bathrooms' => 3,
                'square_footage' => 250.00,
                'price' => 750000000.00,
                'is_available' => true,
                'year_built' => 2015,
                'amenities' => json_encode(['ocean_view', 'private_pool', 'historical_architecture', 'beach_access']),
                'latitude' => -6.1667,
                'longitude' => 39.1833,
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
        ];

        // Clear existing data before inserting
        DB::table('properties')->truncate();

        // Insert the properties
        DB::table('properties')->insert($properties);
    }
}
