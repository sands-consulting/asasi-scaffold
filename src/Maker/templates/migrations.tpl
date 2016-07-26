<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class ModelNamesMigration extends Migration
{
    /**
     * Run the migrations.
     *
     * @return  void
     */
    public function up()
    {
        // Create table for storing model_names
        Schema::create('model_names', function (Blueprint $table) {
            $table->increments('id');
            $table->string('slug');
MIGRATIONFIELDS
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return  void
     */
    public function down()
    {
        Schema::dropIfExists('model_names');
    }
}
