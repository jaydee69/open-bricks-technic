include <ObtPinConst.scad>

use <ObtPinBase.scad>

module obtPinConnector(color = "#303030"){
	color(color)
		union(){
			zOffset = OBT_PIN_LENGTH / 2;
			translate([0, 0,  zOffset]) rotate([  0, 0 ,0]) obtPinBase(true);
			translate([0, 0, -zOffset]) rotate([180, 0 ,0]) obtPinBase(true);
		}
}


// Test
translate([0, 10,  OBT_PIN_LENGTH / 2]) rotate([  0, 0 ,0]) color("green") obtPinBase(true);
translate([0, 20,  -OBT_PIN_LENGTH / 2]) rotate([180, 0 ,0]) color("green") obtPinBase(true);
obtPinConnector();
translate([0, -10, 0]) obtPinConnector(0);
