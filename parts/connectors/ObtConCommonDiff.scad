include <../bars/ObtBarConst.scad>
include <ObtConConst.scad>

use <../bars/ObtBarCommonDiff.scad>


module obtConCommonHoleDiff(){
	obtBarCommonHoleDiff();
}

module obtConCommonDiffBase(zOffsetDirection, rotation){
		obtBarCommonDiffBase(zOffsetDirection, rotation);
}

module obtConCommonRoundCenterDiff(){
	difference(){
		cube([OBT_CON_WIDTH + 0.01, OBT_CON_HOLE_DISTANCE + 0.01, OBT_BAR_INNER_WIDTH], center = true);
		cube([OBT_GLOBAL_BAR_WEB_WIDTH, OBT_CON_HOLE_DISTANCE + 0.02, OBT_BAR_INNER_WIDTH + 0.01], center = true);
		cylinder(OBT_CON_HEIGHT, d1=OBT_CON_HOLE_DIAMETER_OUTER, d2=OBT_CON_HOLE_DIAMETER_OUTER, center=true);
	}
}


// Test
translate([0,   0, 0]) color("red") obtConCommonRoundCenterDiff();
translate([0,  10, 0]) color("red") obtConCommonHoleDiff();
translate([0,  20, 0]) color("red") obtConCommonDiffBase(0, 180);

