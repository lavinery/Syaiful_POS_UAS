<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\DB;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('users')->insert([
            [
                'name' => 'admin',
                'email' => 'admin@gmail.com',
                'password' => Hash::make('password123'), // Always hash passwords
                'email_verified_at' => now(),
            ],
            [
                'name' => 'syaiful',
                'email' => 'syaiful@gamil.com',
                'password' => Hash::make('password123'),
                'email_verified_at' => now(),
            ],
            // Add more users as needed
        ]);
    }
}
