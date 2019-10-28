<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTriggerCalculateRepuesto extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::connection()
            ->getPdo()
            ->exec("
                CREATE TRIGGER check_update_event AFTER INSERT ON `asignaciones`
                    FOR EACH ROW BEGIN
                        UPDATE repuestos SET cantidad = (cantidad - NEW.cantidad) WHERE id=NEW.id_repuesto;
                    END
               ");
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
      //  Schema::dropIfExists('trigger_calculate_repuesto');
    }
}
