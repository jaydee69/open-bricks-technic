include <ObtConConst.scad>

use <../pins/ObtPins.scad>
	use <../pins/ObtPinBase.scad>

use <ObtConInner.scad>
use <ObtConCornerDblPin.scad>
use <ObtConEndSglPin.scad>


module obtCon4PinAngled(color = "lightgrey"){
	color(color)
		union(){
			translate([                            0, -2 * OBT_GLOBAL_HOLE_DISTANCE, 0])
				rotate([  0,   0,   0])
					obtConEndSglPin();
			translate([                            0, -1 * OBT_GLOBAL_HOLE_DISTANCE, 0])
				rotate([  0,  90,   0])
					obtConInner();
			translate([                            0,  0 * OBT_GLOBAL_HOLE_DISTANCE, 0])
				rotate([  0,   0,   0])
					obtConCornerDblPin();
			translate([-1 * OBT_GLOBAL_HOLE_DISTANCE,  0 * OBT_GLOBAL_HOLE_DISTANCE, 0])
				rotate([  0,  90,  90])
					obtConInner();
			translate([-2 * OBT_GLOBAL_HOLE_DISTANCE,  0 * OBT_GLOBAL_HOLE_DISTANCE, 0])
				rotate([  0, 180, -90])
					obtConEndSglPin();

			translate([    1 * OBT_GLOBAL_BAR_HEIGHT,  0 * OBT_GLOBAL_HOLE_DISTANCE, 0])
				rotate([-90,   0, -90])
					obtPinBase(rotateSlit = true);
			translate([    1 * OBT_GLOBAL_BAR_HEIGHT, -2 * OBT_GLOBAL_HOLE_DISTANCE, 0])
				rotate([-90,   0, -90])
					obtPinBase(rotateSlit = true);
			translate([ 0 * OBT_GLOBAL_HOLE_DISTANCE,  0 * OBT_GLOBAL_HOLE_DISTANCE + 1 * OBT_GLOBAL_BAR_HEIGHT, 0])
				rotate([-90,   0,   0])
					obtPinBase(rotateSlit = true);
			translate([-2 * OBT_GLOBAL_HOLE_DISTANCE,  0 * OBT_GLOBAL_HOLE_DISTANCE + 1 * OBT_GLOBAL_BAR_HEIGHT, 0])
				rotate([-90,   0,   0])
					obtPinBase(rotateSlit = true);
		}
}


// Test
obtCon4PinAngled(0);

color("green"){
	translate([                            0, -2 * 1.5 * OBT_GLOBAL_HOLE_DISTANCE, -20])
		rotate([  0,   0,   0])
			obtConEndSglPin();
	translate([                            0, -1 * 1.5 * OBT_GLOBAL_HOLE_DISTANCE, -20])
		rotate([  0,  90,   0])
			obtConInner();
	translate([                            0,  0 * 1.5 * OBT_GLOBAL_HOLE_DISTANCE, -20])
		rotate([  0,   0,   0])
			obtConCornerDblPin();
	translate([-1 * 1.5 * OBT_GLOBAL_HOLE_DISTANCE,  0 * 1.5 * OBT_GLOBAL_HOLE_DISTANCE, -20])
		rotate([  0,  90,  90])
			obtConInner();
	translate([-2 * 1.5 * OBT_GLOBAL_HOLE_DISTANCE,  0 * 1.5 * OBT_GLOBAL_HOLE_DISTANCE, -20])
		rotate([  0, 180, -90])
			obtConEndSglPin();

	translate([    1 * 1.5 * OBT_GLOBAL_BAR_HEIGHT,  0 * 1.5 * OBT_GLOBAL_HOLE_DISTANCE, -20])
		rotate([-90,   0, -90])
			obtPinBase(rotateSlit = true);
	translate([    1 * 1.5 * OBT_GLOBAL_BAR_HEIGHT, -2 * 1.5 * OBT_GLOBAL_HOLE_DISTANCE, -20])
		rotate([-90,   0, -90])
			obtPinBase(rotateSlit = true);
	translate([ 0 * 1.5 * OBT_GLOBAL_HOLE_DISTANCE,  0 * 1.5 * OBT_GLOBAL_HOLE_DISTANCE + 1 * 1.5 * OBT_GLOBAL_BAR_HEIGHT, -20])
		rotate([-90,   0,   0])
			obtPinBase(rotateSlit = true);
	translate([-2 * 1.5 * OBT_GLOBAL_HOLE_DISTANCE,  0 * 1.5 * OBT_GLOBAL_HOLE_DISTANCE + 1 * 1.5 * OBT_GLOBAL_BAR_HEIGHT, -20])
		rotate([-90,   0,   0])
			obtPinBase(rotateSlit = true);
}
