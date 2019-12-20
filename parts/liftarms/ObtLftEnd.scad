include <ObtLftConst.scad>

use <ObtLftCommonDiff.scad>

module obtBarEndBase(){
	length = OBT_BAR_HOLE_DISTANCE / 2;
	union(){
		cylinder(OBT_BAR_HEIGHT, d1 = OBT_BAR_WIDTH, d2 = OBT_BAR_WIDTH, center = true);
		translate([0, length / 2, 0]) cube([OBT_BAR_WIDTH, length, OBT_BAR_HEIGHT], center = true);
	}
}

module obtBarEndDiff(){
	union(){
		obtBarCommonDiffBase( 1, 0);
		obtBarCommonDiffBase(-1, 0);
		obtBarCommonHoleDiff();
	}
}

module obtBarEnd(){
	difference(){
		obtBarEndBase();
		obtBarEndDiff();
	}
}

// Test
translate([0, 10, 0]) color("green") obtBarEndBase();
translate([0, 20, 0]) color("red") obtBarEndDiff();
obtBarEnd();


