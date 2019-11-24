include <ObtBarConst.scad>

use <ObtBarCommon.scad>
use <ObtBarInner.scad>

module obtBarEndBase(){
	length = OBT_BAR_HOLE_DISTANCE / 2;
	union(){
		cylinder(OBT_BAR_HEIGHT, d1 = OBT_BAR_WIDTH, d2 = OBT_BAR_WIDTH, center = true);
		translate([0, length / 2, 0]) cube([OBT_BAR_WIDTH, length, OBT_BAR_HEIGHT], center = true);
	}
}

module obtBarEndDiffBase(zOffsetDirection){
	length = OBT_BAR_HOLE_DISTANCE / 2;
	height = 3.5;
	zOffset = zOffsetDirection * (height / 2 + OBT_BAR_HEIGHT / 2 - height);
	translate([0, 0, zOffset]){
		difference(){
			translate([0, length / 2, 0]) cube([OBT_BAR_INNER_WIDTH, length * 1.01, height * 1.01], center = true);
			cylinder(OBT_BAR_HEIGHT, d1 = OBT_BAR_HOLE_DIAMETER_OUTER, d2 = OBT_BAR_HOLE_DIAMETER_OUTER, center = true);
		}
	}
}

module obtBarEndDiff(){
	union(){
		obtBarEndDiffBase(-1);
		obtBarEndDiffBase(1);
		cylinder(OBT_BAR_HEIGHT, d1 = OBT_BAR_HOLE_DIAMETER, d2 = OBT_BAR_HOLE_DIAMETER, center = true);
		obtBarCommonHoleChamferDiff();
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


