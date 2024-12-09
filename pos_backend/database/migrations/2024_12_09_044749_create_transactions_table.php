<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
    {
        Schema::create('transactions', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id'); // Relasi ke user yang melakukan transaksi
            $table->unsignedBigInteger('product_id'); // Relasi ke produk yang dibeli
            $table->integer('quantity'); // Jumlah produk yang dibeli
            $table->decimal('total_price', 10, 2); // Total harga transaksi
            $table->timestamp('transaction_date')->useCurrent(); // Tanggal transaksi
            $table->timestamps();

            // Menambahkan foreign key constraint
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
            $table->foreign('product_id')->references('id')->on('products')->onDelete('cascade');
        });
    }

    public function down()
    {
        Schema::dropIfExists('transactions');
    }
};