include <ObtBarConst.scad>

use <ObtBarCommon.scad>


module obtBarTeeBaseBase(){
	cube([OBT_BAR_HOLE_DISTANCE, OBT_BAR_HOLE_DISTANCE, OBT_BAR_HEIGHT], center = true);
}

module obtBarTeeBaseDiff(){
	union(){
		obtBarCommonDiffWidthReduction(0);
		obtBarCommonHoleDiff();
		obtBarCommonDiffBase( 1,   0);
		obtBarCommonDiffBase( 1, 180);
		obtBarCommonDiffBase( 1, 270);
		obtBarCommonDiffBase(-1,   0);
		obtBarCommonDiffBase(-1, 180);
		obtBarCommonDiffBase(-1, 270);
		obtBarCommonDiffInnerCorner(0);
		obtBarCommonDiffInnerCorner(-90);
	}
}

module obtBarTeeBase(){
	difference(){
		obtBarTeeBaseBase();
		obtBarTeeBaseDiff();
	}
}


// Test
translate([0, 10, 0]) color("green") obtBarTeeBaseBase();
translate([0, 20, 0]) color("red") obtBarTeeBaseDiff();
obtBarTeeBase();

