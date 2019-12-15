include <ObtConConst.scad>

use <ObtConCommonDiff.scad>

module obtConInnerSglHoleBase(){
	union(){
		rotate([ 0, 0, 0]) cylinder(OBT_CON_HEIGHT, d1 = OBT_CON_WIDTH, d2 = OBT_CON_WIDTH, center = true);
		rotate([90, 0, 0]) cylinder(OBT_CON_HOLE_DISTANCE, d1 = OBT_PIN_DIAMETER_OUTER, d2 = OBT_PIN_DIAMETER_OUTER, center = true);
	}
}

module obtConInnerSglHole(){
	difference(){
		obtConInnerSglHoleBase();
		obtConCommonHoleDiff();
	}
}


// Test
translate([0,  0, 0]) obtConInnerSglHole();
translate([0, 10, 0]) color("green") obtConInnerSglHoleBase();
translate([0, 20, 0]) color("red") obtConCommonHoleDiff();

