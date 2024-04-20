<?php

use App\Constants\Status;
use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('blogs', function (Blueprint $table) {
            $table->id();
            $table->string('category_id');
            $table->string('title')->unique();
            $table->text('description');
            $table->integer('likes')->nullable();
            $table->integer('comments')->nullable();
            $table->string('button_text')->nullable();
            $table->string('button_url')->nullable();
            $table->string('button_target')->nullable();
            $table->string('image')->nullable();
            $table->enum('status',[1,2,3])->default(Status::PUBLISHED);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('blogs');
    }
};
