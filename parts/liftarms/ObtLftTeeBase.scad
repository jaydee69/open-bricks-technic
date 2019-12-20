include <ObtLftConst.scad>

use <ObtLftCommonDiff.scad>


module obtLftTeeBaseBase(){
	cube([OBT_LFT_HOLE_DISTANCE, OBT_LFT_HOLE_DISTANCE, OBT_LFT_HEIGHT], center = true);
}

module obtLftTeeBaseDiff(){
	union(){
		obtLftCommonDiffWidthReduction(0);
		obtLftCommonHoleDiff();
		obtLftCommonDiffBase( 1,   0);
		obtLftCommonDiffBase( 1, 180);
		obtLftCommonDiffBase( 1, 270);
		obtLftCommonDiffBase(-1,   0);
		obtLftCommonDiffBase(-1, 180);
		obtLftCommonDiffBase(-1, 270);
		obtLftCommonDiffInnerCorner(0);
		obtLftCommonDiffInnerCorner(-90);
	}
}

module obtLftTeeBase(){
	difference(){
		obtLftTeeBaseBase();
		obtLftTeeBaseDiff();
	}
}


// Test
translate([0, 10, 0]) color("green") obtLftTeeBaseBase();
translate([0, 20, 0]) color("red") obtLftTeeBaseDiff();
obtLftTeeBase();

