<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();  // ID kolom auto-increment
            $table->string('name');  // Nama produk
            $table->text('description')->nullable();  // Deskripsi produk
            $table->decimal('price', 10, 2);  // Harga produk dengan 2 desimal
            $table->integer('stock')->default(0);  // Jumlah stok produk
            $table->timestamps();  // Kolom created_at dan updated_at
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('products');
    }
}