include <../../globals/ObtGlobalConst.scad>

// Pin dimensions
OBT_PIN_DIAMETER_OUTER = OBT_GLOBAL_HOLE_CHAMFER_DIAMETER - 0.5;
OBT_PIN_DIAMETER_INNER = OBT_GLOBAL_HOLE_DIAMETER - 0.2;
OBT_PIN_DIAMETER_LATCH = OBT_GLOBAL_HOLE_DIAMETER + 0.2;
OBT_PIN_DIAMETER_HOLE = 3.4;
OBT_PIN_LENGTH = OBT_GLOBAL_LFT_HEIGHT + 0.001;

module obtPinShowConst(){
	echo("OBT_PIN_DIAMETER_OUTER ", OBT_PIN_DIAMETER_OUTER);
	echo("OBT_PIN_DIAMETER_INNER ", OBT_PIN_DIAMETER_INNER);
	echo("OBT_PIN_DIAMETER_LATCH ", OBT_PIN_DIAMETER_LATCH);
	echo("OBT_PIN_LENGTH ", OBT_PIN_LENGTH, "");
}

// Pin options
OBT_PIN_SLIT_SINGLE = false;
OBT_PIN_SLIT_DOUBLE = true;
OBT_PIN_SLIT_ROTATE = true;
OBT_PIN_SLIT_MECH_STOP = true;


//obtPinShowConst();
