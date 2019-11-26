include <ObtPinConst.scad>

module obtPinBaseBase(){
	cylinder(OBT_PIN_LENGTH, d1 = OBT_PIN_DIAMETER_OUTER, d2 = OBT_PIN_DIAMETER_OUTER, center = true);
}

module obtPinSlitDiff(rotation, height, zOffset){
	rotate([0, 0, rotation]) translate([0, 0, zOffset]) cube([1.3, OBT_PIN_DIAMETER_OUTER * 1.01, height], center = true);
}

module obtPinNarrowDiffBase(length, diameterOuter, diameterInner){
	difference(){
		cylinder(length, d1 = diameterOuter * 1.01, d2 = diameterOuter * 1.01, center = true);
		cylinder(length + 0.001, d1 = diameterInner, d2 = diameterInner, center = true);
	}
}

module obtPinNarrowDiff(mechStop){
	mainNarrowLength = 6.2;
	if(mechStop){
		subNarrowLength = ((OBT_PIN_LENGTH + 0.001 - mainNarrowLength) / 2) + 0.001;
		subNarrowOffset = ((mainNarrowLength + subNarrowLength) / 2) - 0.001;
		union(){
			obtPinNarrowDiffBase(mainNarrowLength, OBT_PIN_DIAMETER_OUTER, OBT_PIN_DIAMETER_INNER);
			translate([0, 0, subNarrowOffset])
				obtPinNarrowDiffBase(subNarrowLength, OBT_PIN_DIAMETER_OUTER, OBT_PIN_DIAMETER_LATCH);
		}
	} else {
		subNarrowLength = OBT_PIN_LENGTH + 0.001;
		union(){
			obtPinNarrowDiffBase(mainNarrowLength, OBT_PIN_DIAMETER_OUTER, OBT_PIN_DIAMETER_INNER);
			obtPinNarrowDiffBase(subNarrowLength, OBT_PIN_DIAMETER_OUTER, OBT_PIN_DIAMETER_LATCH);
		}
	}
}

module obtPinDiff(doubleSlit, rotateSlit, mechStop){
	union(){
		height = OBT_PIN_LENGTH + 0.001;
		cylinder(height, d1 = OBT_PIN_DIAMETER_HOLE, d2 = OBT_PIN_DIAMETER_HOLE, center = true);
		obtPinNarrowDiff(mechStop);
		obtPinNarrowDiff(mechStop);
		if(rotateSlit)
			obtPinSlitDiff(00, 3.5, height /  2 - 3.5 / 2);
		else
			obtPinSlitDiff(90, 3.5, height /  2 - 3.5 / 2);
		if(doubleSlit)
			obtPinSlitDiff(90, 3.5, height / -2 + 3.5 / 2);
	}
}

module obtPinBase(doubleSlit = false, rotateSlit = false, mechStop = true){
	difference(){
		obtPinBaseBase();
		obtPinDiff(doubleSlit, rotateSlit, mechStop);
		}
}


// Test
translate([-10,  10, 0]) color("green") obtPinBaseBase();
translate([-10,  20, 0]) color("red") obtPinDiff(OBT_PIN_SLIT_SINGLE, ! OBT_PIN_SLIT_ROTATE, OBT_PIN_SLIT_MECH_STOP);
translate([-10,   0, 0]) obtPinBase(OBT_PIN_SLIT_SINGLE, ! OBT_PIN_SLIT_ROTATE, OBT_PIN_SLIT_MECH_STOP);
translate([ 10,  10, 0]) color("green") obtPinBaseBase();
translate([ 10,  20, 0]) color("red") obtPinDiff(OBT_PIN_SLIT_DOUBLE, OBT_PIN_SLIT_ROTATE, ! OBT_PIN_SLIT_MECH_STOP);
translate([ 10,   0, 0]) obtPinBase(OBT_PIN_SLIT_DOUBLE, OBT_PIN_SLIT_ROTATE, ! OBT_PIN_SLIT_MECH_STOP);
