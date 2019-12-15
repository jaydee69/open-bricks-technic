include <ObtConConst.scad>

use <ObtConCommonDiff.scad>

module obtConInnerBase(){
	cube([OBT_CON_WIDTH, OBT_CON_HOLE_DISTANCE, OBT_CON_HEIGHT], center = true);
}

module obtConInnerDiff(){
	union(){
		obtConCommonHoleDiff();
		obtConCommonRoundCenterDiff();
	}
}

module obtConInner(){
	difference(){
		obtConInnerBase();
		obtConInnerDiff();
	}
}


// Test
translate([0,  0, 0]) obtConInner();
translate([0, 10, 0]) color("green") obtConInnerBase();
translate([0, 20, 0]) color("red") obtConInnerDiff();

