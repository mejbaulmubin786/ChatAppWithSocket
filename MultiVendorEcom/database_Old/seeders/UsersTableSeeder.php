<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\DB;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('users')->insert([
            // Admin
            [
                'name' => 'admin',
                'username' => 'admin',
                'email' => 'admin@admin.com',
                'password' => Hash::make('111'),
                'role' => 'admin',
                'status' => 'active',
            ],
            // Vendor
            [
                'name' => 'vendor',
                'username' => 'vendor',
                'email' => 'vendor@vendor.com',
                'password' => Hash::make('111'),
                'role' => 'vendor',
                'status' => 'active',
            ],
            // user or customer
            [
                'name' => 'user',
                'username' => 'user',
                'email' => 'user@user.com',
                'password' => Hash::make('111'),
                'role' => 'user',
                'status' => 'active',
            ],
        ]);
    }
}
