include <ObtConConst.scad>

use <ObtConCommonDiff.scad>


module obtConEndDblPinBase(){
	length = OBT_CON_HOLE_DISTANCE / 2;
	union(){
		cylinder(OBT_CON_HEIGHT, d1 = OBT_CON_WIDTH, d2 = OBT_CON_WIDTH, center = true);
		rotate([0, 90, 0]) cylinder(OBT_CON_HEIGHT, d1 = OBT_CON_WIDTH, d2 = OBT_CON_WIDTH, center = true);
		translate([0, length / 2, 0]) cube([OBT_CON_HEIGHT, length, OBT_CON_WIDTH], center = true);
	}
}

module obtConEndDblPinDiff(){
	union(){
		obtConCommonHoleDiff();
		obtConCommonDiffBase( 1, 0);
		obtConCommonDiffBase(-1, 0);
	}
}

module obtConEndDblPin(){
	difference(){
		obtConEndDblPinBase();
		obtConEndDblPinDiff();
	}
}


// Test
translate([0,  0, 0]) obtConEndDblPin();
translate([0, 10, 0]) color("green") obtConEndDblPinBase();
translate([0, 20, 0]) color("red") obtConEndDblPinDiff();

