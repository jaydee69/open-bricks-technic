include <ObtPinConst.scad>

module obtPinBase(){
	cylinder(OBT_PIN_LENGTH_2, d1 = OBT_PIN_DIAMETER_OUTER, d2 = OBT_PIN_DIAMETER_OUTER, center = true);
}

module obtPinSlitDiff(rotation, height, zOffset){
	rotate([0, 0, rotation]) translate([0, 0, zOffset]) cube([1.3, OBT_PIN_DIAMETER_OUTER * 1.01, height], center = true);
}

module obtPinNarrowDiff(zOffset){
	translate([0, 0, zOffset])
		difference(){
			cylinder(6.2, d1 = OBT_PIN_DIAMETER_OUTER * 1.01, d2 = OBT_PIN_DIAMETER_OUTER * 1.01, center = true);
			cylinder(6.2 * 1.01, d1 = OBT_PIN_DIAMETER_INNER, d2 = OBT_PIN_DIAMETER_INNER, center = true);
		}
}

module obtPinDiff(){
	union(){
		height = OBT_PIN_LENGTH_2 * 1.01;
		cylinder(height, d1 = OBT_PIN_DIAMETER_HOLE, d2 = OBT_PIN_DIAMETER_HOLE, center = true);
		obtPinNarrowDiff(0.7 + 3.1);
		obtPinNarrowDiff(-0.7 - 3.1);
		obtPinSlitDiff(0, 7, 0);
		obtPinSlitDiff(90, 3.5, height /  2 - 3.5 / 2);
		obtPinSlitDiff(90, 3.5, height / -2 + 3.5 / 2);
	}
}

module obtPinConnector(){
	color("#303030")
		difference(){
			obtPinBase();
			obtPinDiff();
		}
}


// Test
translate([0, 10, 0]) color("green") obtPinBase();
translate([0, 20, 0]) color("red") obtPinDiff();
obtPinConnector();
