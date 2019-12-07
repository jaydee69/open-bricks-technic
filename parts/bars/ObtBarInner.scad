include <ObtBarConst.scad>

use <ObtBarCommon.scad>

module obtBarInnerBase(){
	cube([OBT_BAR_WIDTH, OBT_BAR_HOLE_DISTANCE, OBT_BAR_HEIGHT], center = true);
}

module obtBarInnerDiffBase(zOffsetDirection){
	length = OBT_BAR_HOLE_DISTANCE;
	height = 3.5;
	zOffset = zOffsetDirection * (height / 2 + OBT_BAR_HEIGHT / 2 - height);
	translate([0, 0, zOffset]){
		difference(){
			cube([OBT_BAR_INNER_WIDTH, length * 1.01, height * 1.01], center = true);
			cylinder(OBT_BAR_HEIGHT, d1 = OBT_BAR_HOLE_DIAMETER_OUTER, d2 = OBT_BAR_HOLE_DIAMETER_OUTER, center = true);
		}
	}
}

module obtBarInnerDiff(){
	union(){
		obtBarInnerDiffBase(-1);
		obtBarInnerDiffBase(1);
		cylinder(OBT_BAR_HEIGHT, d1 = OBT_BAR_HOLE_DIAMETER, d2 = OBT_BAR_HOLE_DIAMETER, center = true);
		obtBarCommonHoleChamferDiff();
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


