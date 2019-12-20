include <ObtLftConst.scad>

use <ObtLftCommonDiff.scad>

module obtLftEndBase(){
	length = OBT_LFT_HOLE_DISTANCE / 2;
	union(){
		cylinder(OBT_LFT_HEIGHT, d1 = OBT_LFT_WIDTH, d2 = OBT_LFT_WIDTH, center = true);
		translate([0, length / 2, 0]) cube([OBT_LFT_WIDTH, length, OBT_LFT_HEIGHT], center = true);
	}
}

module obtLftEndDiff(){
	union(){
		obtLftCommonDiffBase( 1, 0);
		obtLftCommonDiffBase(-1, 0);
		obtLftCommonHoleDiff();
	}
}

module obtLftEnd(){
	difference(){
		obtLftEndBase();
		obtLftEndDiff();
	}
}

// Test
translate([0, 10, 0]) color("green") obtLftEndBase();
translate([0, 20, 0]) color("red") obtLftEndDiff();
obtLftEnd();


