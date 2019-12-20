include <ObtBarConst.scad>

use <ObtBarCommonDiff.scad>


module obtBarEllBaseBase(){
	cube([OBT_BAR_HOLE_DISTANCE, OBT_BAR_HOLE_DISTANCE, OBT_BAR_HEIGHT], center = true);
}

module obtBarEllBaseDiff(){
	union(){
		obtBarCommonDiffWidthReduction(90);
		obtBarCommonDiffWidthReduction(0);
		obtBarCommonHoleDiff();
		obtBarCommonDiffBase( 1, 0);
		obtBarCommonDiffBase( 1, -90);
		obtBarCommonDiffBase(-1, 0);
		obtBarCommonDiffBase(-1, -90);
		obtBarCommonDiffOuterCorner(180);
		obtBarCommonDiffInnerCorner(0);
	}
}

module obtBarEllBase(){
	difference(){
		obtBarEllBaseBase();
		obtBarEllBaseDiff();
	}
}


// Test
translate([0, 10, 0]) color("green") obtBarEllBaseBase();
translate([0, 20, 0]) color("red") obtBarEllBaseDiff();
obtBarEllBase();

