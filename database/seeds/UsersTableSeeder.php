<?php

use App\User;
use Illuminate\Database\Seeder;

class UsersTableSeeder extends Seeder
{
    public function run()
    {
        $users = [[
            'id'             => 1,
            'name'           => 'Admin',
            'email'          => 'admin@admin.com',
            'password'       => '$2y$10$iGIs9vT1KvnMf1aph4uFHuO0ebEnXr/tu6AemWTZanW13a7Gjb0Ua',
            'remember_token' => null,
            'created_at'     => '2019-10-11 08:40:35',
            'updated_at'     => '2019-10-11 08:40:35',
            'deleted_at'     => null,
        ],
            [
                'id'             => 2,
                'name'           => 'Maria Jose',
                'email'          => 'mariajose@gmail.com',
                'password'       => '$2y$10$iGIs9vT1KvnMf1aph4uFHuO0ebEnXr/tu6AemWTZanW13a7Gjb0Ua',
                'remember_token' => null,
                'created_at'     => '2019-10-11 08:40:35',
                'updated_at'     => '2019-10-11 08:40:35',
                'deleted_at'     => null,
            ]];

        User::insert($users);
    }
}
