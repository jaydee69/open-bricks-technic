include <ObtLftConst.scad>

use <ObtLftCommonDiff.scad>

module obtLftInnerBase(){
	cube([OBT_LFT_WIDTH, OBT_LFT_HOLE_DISTANCE, OBT_LFT_HEIGHT], center = true);
}

module obtLftInnerDiff(){
	union(){
		obtLftCommonHoleDiff();
		obtLftCommonDiffBase( 1,   0);
		obtLftCommonDiffBase( 1, 180);
		obtLftCommonDiffBase(-1,   0);
		obtLftCommonDiffBase(-1, 180);
	}
}

module obtLftInner(){
	difference(){
		obtLftInnerBase();
		obtLftInnerDiff();
	}
}


// Test
translate([0, 10, 0]) color("green") obtLftInnerBase();
translate([0, 20, 0]) color("red") obtLftInnerDiff();
obtLftInner();


