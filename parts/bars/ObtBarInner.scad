include <ObtBarConst.scad>

use <ObtBarCommon.scad>

module obtBarInnerBase(){
	cube([OBT_BAR_WIDTH, OBT_BAR_HOLE_DISTANCE, OBT_BAR_HEIGHT], center = true);
}

module obtBarInnerDiff(){
	union(){
		obtBarCommonHoleDiff();
		obtBarCommonDiffBase( 1,   0);
		obtBarCommonDiffBase( 1, 180);
		obtBarCommonDiffBase(-1,   0);
		obtBarCommonDiffBase(-1, 180);
	}
}

module obtBarInner(){
	difference(){
		obtBarInnerBase();
		obtBarInnerDiff();
	}
}


// Test
translate([0, 10, 0]) color("green") obtBarInnerBase();
translate([0, 20, 0]) color("red") obtBarInnerDiff();
obtBarInner();


