include <ObtConConst.scad>

use <../pins/ObtPins.scad>
	use <../pins/ObtPinBase.scad>

use <ObtConInner.scad>
use <ObtConEndDblPin.scad>


module obtCon4PinStd(color = "lightgrey"){
	color(color)
		union(){
			translate([ 0, -1 * OBT_GLOBAL_HOLE_DISTANCE, 0]) rotate([0,  0,   0]) obtConEndDblPin();
			translate([ 0,  0 * OBT_GLOBAL_HOLE_DISTANCE, 0]) rotate([0, 90,   0]) obtConInner();
			translate([ 0,  1 * OBT_GLOBAL_HOLE_DISTANCE, 0]) rotate([0,  0, 180]) obtConEndDblPin();
			translate([ 1 * OBT_GLOBAL_BAR_HEIGHT,  1 * OBT_GLOBAL_HOLE_DISTANCE, 0]) rotate([0,  90, 0]) obtPinBase(rotateSlit = true);
			translate([ 1 * OBT_GLOBAL_BAR_HEIGHT, -1 * OBT_GLOBAL_HOLE_DISTANCE, 0]) rotate([0,  90, 0]) obtPinBase(rotateSlit = true);
			translate([-1 * OBT_GLOBAL_BAR_HEIGHT,  1 * OBT_GLOBAL_HOLE_DISTANCE, 0]) rotate([0, -90, 0]) obtPinBase(rotateSlit = true);
			translate([-1 * OBT_GLOBAL_BAR_HEIGHT, -1 * OBT_GLOBAL_HOLE_DISTANCE, 0]) rotate([0, -90, 0]) obtPinBase(rotateSlit = true);
		}
}


// Test
obtCon4PinStd(0);

color("green") translate([0, -1 * OBT_GLOBAL_HOLE_DISTANCE - 5, -15]) rotate([0,  0,   0]) obtConEndDblPin();
color("green") translate([0,  0 * OBT_GLOBAL_HOLE_DISTANCE + 0, -15]) rotate([0, 90,   0]) obtConInner();
color("green") translate([0,  1 * OBT_GLOBAL_HOLE_DISTANCE + 5, -15]) rotate([0,  0, 180]) obtConEndDblPin();
color("green") translate([ 1 * OBT_GLOBAL_BAR_HEIGHT + 5,  1 * OBT_GLOBAL_HOLE_DISTANCE + 5, -15]) rotate([0 ,  90, 0]) obtPinBase(rotateSlit = true);
color("green") translate([ 1 * OBT_GLOBAL_BAR_HEIGHT + 5, -1 * OBT_GLOBAL_HOLE_DISTANCE - 5, -15]) rotate([0 ,  90, 0]) obtPinBase(rotateSlit = true);
color("green") translate([-1 * OBT_GLOBAL_BAR_HEIGHT - 5,  1 * OBT_GLOBAL_HOLE_DISTANCE + 5, -15]) rotate([0 , -90, 0]) obtPinBase(rotateSlit = true);
color("green") translate([-1 * OBT_GLOBAL_BAR_HEIGHT - 5, -1 * OBT_GLOBAL_HOLE_DISTANCE - 5, -15]) rotate([0 , -90, 0]) obtPinBase(rotateSlit = true);

