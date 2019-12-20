include <ObtLftConst.scad>

use <ObtLftCommonDiff.scad>


module obtLftEllBaseBase(){
	cube([OBT_LFT_HOLE_DISTANCE, OBT_LFT_HOLE_DISTANCE, OBT_LFT_HEIGHT], center = true);
}

module obtLftEllBaseDiff(){
	union(){
		obtLftCommonDiffWidthReduction(90);
		obtLftCommonDiffWidthReduction(0);
		obtLftCommonHoleDiff();
		obtLftCommonDiffBase( 1, 0);
		obtLftCommonDiffBase( 1, -90);
		obtLftCommonDiffBase(-1, 0);
		obtLftCommonDiffBase(-1, -90);
		obtLftCommonDiffOuterCorner(180);
		obtLftCommonDiffInnerCorner(0);
	}
}

module obtLftEllBase(){
	difference(){
		obtLftEllBaseBase();
		obtLftEllBaseDiff();
	}
}


// Test
translate([0, 10, 0]) color("green") obtLftEllBaseBase();
translate([0, 20, 0]) color("red") obtLftEllBaseDiff();
obtLftEllBase();

