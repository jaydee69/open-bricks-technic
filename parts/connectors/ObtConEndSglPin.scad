include <ObtConConst.scad>

use <ObtConCommonDiff.scad>


module obtConEndSglPinBase(){
	length = OBT_CON_HOLE_DISTANCE / 2;
	union(){
		cylinder(OBT_CON_HEIGHT, d1 = OBT_CON_WIDTH, d2 = OBT_CON_WIDTH, center = true);
		rotate([0, 90, 0])
			translate([0, 0, OBT_CON_HEIGHT / 4])
				cylinder(0.5 * OBT_CON_HEIGHT, d1 = OBT_CON_WIDTH, d2 = OBT_CON_WIDTH, center = true);
		translate([0, length / 2, 0]) cube([OBT_CON_HEIGHT, length, OBT_CON_WIDTH], center = true);
	}
}

module obtConEndSglPinDiff(){
	union(){
		obtConCommonHoleDiff();
		obtConCommonDiffBase( 1, 0);
		obtConCommonDiffBase(-1, 0);
	}
}

module obtConEndSglPin(){
	difference(){
		obtConEndSglPinBase();
		obtConEndSglPinDiff();
	}
}


// Test
translate([0,  0, 0]) obtConEndSglPin();
translate([0, 10, 0]) color("green") obtConEndSglPinBase();
translate([0, 20, 0]) color("red") obtConEndSglPinDiff();

