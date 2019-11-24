include <ObtPinConst.scad>

module obtPinBaseBase(){
	cylinder(OBT_PIN_LENGTH, d1 = OBT_PIN_DIAMETER_OUTER, d2 = OBT_PIN_DIAMETER_OUTER, center = true);
}

module obtPinSlitDiff(rotation, height, zOffset){
	rotate([0, 0, rotation]) translate([0, 0, zOffset]) cube([1.3, OBT_PIN_DIAMETER_OUTER * 1.01, height], center = true);
}

module obtPinNarrowDiff(){
	difference(){
		cylinder(6.2, d1 = OBT_PIN_DIAMETER_OUTER * 1.01, d2 = OBT_PIN_DIAMETER_OUTER * 1.01, center = true);
		cylinder(6.2 * 1.01, d1 = OBT_PIN_DIAMETER_INNER, d2 = OBT_PIN_DIAMETER_INNER, center = true);
	}
}

module obtPinDiff(lowerSlit = true){
	union(){
		height = OBT_PIN_LENGTH * 1.01;
		cylinder(height, d1 = OBT_PIN_DIAMETER_HOLE, d2 = OBT_PIN_DIAMETER_HOLE, center = true);
		obtPinNarrowDiff();
		obtPinNarrowDiff();
		obtPinSlitDiff(0, 3.5, height /  2 - 3.5 / 2);
		if(lowerSlit)
			obtPinSlitDiff(90, 3.5, height / -2 + 3.5 / 2);
	}
}

module obtPinBase(lowerSlit = true){
	difference(){
		obtPinBaseBase();
		obtPinDiff(lowerSlit);
		}
}


// Test
translate([-10,  10, 0]) color("green") obtPinBaseBase();
translate([-10,  20, 0]) color("red") obtPinDiff(false);
translate([-10,   0, 0]) obtPinBase(false);
translate([ 10,  10, 0]) color("green") obtPinBaseBase();
translate([ 10,  20, 0]) color("red") obtPinDiff();
translate([ 10,   0, 0]) obtPinBase();
