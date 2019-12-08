include <ObtConConst.scad>

use <ObtConCommonDiff.scad>


module obtConCornerDblPinBase(){
	length = OBT_CON_HOLE_DISTANCE / 2;
	union(){
		rotate([ 0,  0, 0]) cylinder(OBT_CON_HEIGHT, d1 = OBT_CON_WIDTH, d2 = OBT_CON_WIDTH, center = true);
		rotate([ 0, 90, 0]) cylinder(OBT_CON_HEIGHT, d1 = OBT_CON_WIDTH, d2 = OBT_CON_WIDTH, center = true);
		rotate([90,  0, 0]) cylinder(OBT_CON_HEIGHT, d1 = OBT_CON_WIDTH, d2 = OBT_CON_WIDTH, center = true);
		translate([-length / 2, 0, 0]) cube([length, OBT_CON_HEIGHT, OBT_CON_WIDTH], center = true);
		translate([0, -length / 2, 0]) cube([OBT_CON_HEIGHT, length, OBT_CON_WIDTH], center = true);
	}
}

module obtConCornerDblPinDiff(){
	union(){
		obtConCommonHoleDiff();
		rotate([ 0,  0,  90]) obtConCommonDiffBase( 1, 0);
		rotate([ 0,  0,  90]) obtConCommonDiffBase(-1, 0);
		rotate([ 0,  0, 180]) obtConCommonDiffBase( 1, 0);
		rotate([ 0,  0, 180]) obtConCommonDiffBase(-1, 0);
	}
}

module obtConCornerDblPin(){
	difference(){
		obtConCornerDblPinBase();
		obtConCornerDblPinDiff();
	}
}


// Test
translate([0,  0, 0]) obtConCornerDblPin();
translate([0, 10, 0]) color("green") obtConCornerDblPinBase();
translate([0, 20, 0]) color("red") obtConCornerDblPinDiff();

