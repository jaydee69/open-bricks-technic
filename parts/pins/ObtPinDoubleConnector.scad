include <ObtPinConst.scad>

use <ObtPinBase.scad>

module obtPinDoubleConnector(color = "blue"){
	color(color)
		union(){
			zOffset = OBT_PIN_LENGTH;
			translate([0, 0,  zOffset]) rotate([  0, 0, 0]) obtPinBase(OBT_PIN_SLIT_DOUBLE,   OBT_PIN_SLIT_ROTATE, ! OBT_PIN_SLIT_MECH_STOP);
			translate([0, 0,        0]) rotate([  0, 0, 0]) obtPinBase(OBT_PIN_SLIT_DOUBLE, ! OBT_PIN_SLIT_ROTATE,   OBT_PIN_SLIT_MECH_STOP);
			translate([0, 0, -zOffset]) rotate([180, 0, 0]) obtPinBase(OBT_PIN_SLIT_DOUBLE,   OBT_PIN_SLIT_ROTATE,   OBT_PIN_SLIT_MECH_STOP);
		}
}


// Test
translate([0, 10,  OBT_PIN_LENGTH]) rotate([  0, 0, 0]) color("green") obtPinBase(OBT_PIN_SLIT_DOUBLE,   OBT_PIN_SLIT_ROTATE, ! OBT_PIN_SLIT_MECH_STOP);
translate([0, 20,               0]) rotate([  0, 0, 0]) color("green") obtPinBase(OBT_PIN_SLIT_DOUBLE, ! OBT_PIN_SLIT_ROTATE,   OBT_PIN_SLIT_MECH_STOP);
translate([0, 30, -OBT_PIN_LENGTH]) rotate([180, 0, 0]) color("green") obtPinBase(OBT_PIN_SLIT_DOUBLE,   OBT_PIN_SLIT_ROTATE,   OBT_PIN_SLIT_MECH_STOP);
obtPinDoubleConnector();
translate([0, -10, 0]) obtPinDoubleConnector(0);
