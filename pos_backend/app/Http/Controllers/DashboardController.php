<?php

namespace App\Http\Controllers;

use App\Models\Transaction; // Import model Transaction
use Illuminate\Http\Request;
use Carbon\Carbon; // Untuk memanipulasi tanggal

class DashboardController extends Controller
{
    public function index()
    {
        // Ambil data penjualan hari ini
        $today = Carbon::today(); // Tanggal hari ini

        // Total penjualan hari ini
        $totalSalesToday = Transaction::whereDate('created_at', $today)->sum('total_amount');

        // Jumlah transaksi hari ini
        $transactionCountToday = Transaction::whereDate('created_at', $today)->count();

        // Ambil data penjualan bulan ini
        $salesThisMonth = Transaction::whereMonth('created_at', $today->month)
            ->whereYear('created_at', $today->year)
            ->sum('total_amount');

        // Ambil data jumlah transaksi bulan ini
        $transactionCountThisMonth = Transaction::whereMonth('created_at', $today->month)
            ->whereYear('created_at', $today->year)
            ->count();

        // Kembalikan data penjualan dalam format JSON
        $salesSummary = [
            'total_sales_today' => $totalSalesToday,
            'transaction_count_today' => $transactionCountToday,
            'total_sales_this_month' => $salesThisMonth,
            'transaction_count_this_month' => $transactionCountThisMonth,
        ];

        return response()->json($salesSummary);
    }
}