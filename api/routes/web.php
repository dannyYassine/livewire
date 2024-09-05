<?php

use Illuminate\Support\Facades\Route;
use App\Livewire\Counter;
use App\Livewire\Dashboard;
use App\Livewire\Home;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/counter', Counter::class);
Route::get('/home', Home::class);
Route::get('/dashboard', Dashboard::class);
