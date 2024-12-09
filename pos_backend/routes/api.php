<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\DashboardController;

/*
|----------------------------------------------------------------------
| API Routes
|----------------------------------------------------------------------
*/

Route::post('/login', [AuthController::class, 'login']);
Route::middleware('auth:sanctum')->get('/dashboard', [DashboardController::class, 'index']);  // Endpoint dashboard yang membutuhkan autentikasi