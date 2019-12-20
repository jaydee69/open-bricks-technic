include <ObtLftConst.scad>

module obtLftCommonHoleChamferDiffBase(zOffsetDirection){
	zOffset = zOffsetDirection * (OBT_LFT_HEIGHT / 2 - OBT_LFT_HOLE_CHAMFER_HEIGHT / 2);
	translate([0, 0, zOffset]) cylinder(OBT_LFT_HOLE_CHAMFER_HEIGHT * 1.01, d1 = OBT_LFT_HOLE_CHAMFER_DIAMETER, d2 = OBT_LFT_HOLE_CHAMFER_DIAMETER, center = true);
}

module obtLftCommonHoleChamferDiff(){
	union(){
		obtLftCommonHoleChamferDiffBase(1);
		obtLftCommonHoleChamferDiffBase(-1);
	}
}

module obtLftCommonHoleDiff(){
	union(){
		obtLftCommonHoleChamferDiff();
		cylinder(OBT_LFT_HEIGHT, d1 = OBT_LFT_HOLE_DIAMETER, d2 = OBT_LFT_HOLE_DIAMETER, center = true);
	}
}

module obtLftCommonDiffBase(zOffsetDirection, rotation){
	height = 0.5 * (OBT_LFT_HEIGHT - OBT_LFT_WEB_WIDTH);
	zOffset = zOffsetDirection * 0.5 * (OBT_LFT_HEIGHT - height);
	translate([0, 0, zOffset])
		rotate([0, 0, rotation])
			difference(){
				translate([0, 0.25 * OBT_LFT_HOLE_DISTANCE + 0.001, 0])
					cube([OBT_LFT_INNER_WIDTH, 0.5 * OBT_LFT_HOLE_DISTANCE, height + 0.01], center = true);
				cylinder(OBT_LFT_HEIGHT, d1 = OBT_LFT_HOLE_DIAMETER_OUTER, d2 = OBT_LFT_HOLE_DIAMETER_OUTER, center = true);
			}
	
}

module obtLftCommonDiffInnerCorner(rotation){
	rotate([0, 0, rotation])
		translate([0.5 * OBT_LFT_HOLE_DISTANCE, 0.5 * OBT_LFT_HOLE_DISTANCE, 0])
			cube([OBT_LFT_HOLE_DISTANCE - OBT_LFT_WIDTH, OBT_LFT_HOLE_DISTANCE - OBT_LFT_WIDTH, OBT_LFT_HEIGHT + 0.01], center = true);
}

module obtLftCommonDiffOuterCorner(rotation){
	rotate([0, 0, rotation])
	difference(){
		translate([OBT_LFT_HOLE_DISTANCE / 4, OBT_LFT_HOLE_DISTANCE / 4, 0])
			cube([OBT_LFT_HOLE_DISTANCE / 2, OBT_LFT_HOLE_DISTANCE / 2, OBT_LFT_HEIGHT + 0.001], center = true);
		cylinder(OBT_LFT_HEIGHT + 0.002 , d1 = OBT_LFT_WIDTH, d2 = OBT_LFT_WIDTH, center = true);
	}
}

module obtLftCommonDiffWidthReduction(rotation){
	rotate([0, 0, rotation])
		translate([-0.5 * OBT_LFT_HOLE_DISTANCE, 0, 0])
			cube([OBT_LFT_HOLE_DISTANCE - OBT_LFT_WIDTH, OBT_LFT_HOLE_DISTANCE + 0.01, OBT_LFT_HEIGHT + 0.01], center = true);
}


// Test
translate([0,  20, 0]) color("red") obtLftCommonHoleChamferDiff();
translate([0,  10, 0]) color("red") obtLftCommonHoleDiff();
translate([0,   0, 0]) color("red") obtLftCommonDiffBase(1, 0);
translate([0,   0, 0]) color("red") obtLftCommonDiffBase(-1, 90);
translate([0, -10, 0]) color("red") obtLftCommonDiffInnerCorner(0);
translate([0, -10, 0]) color("red") obtLftCommonDiffOuterCorner(180);
translate([0, -20, 0]) color("red") obtLftCommonDiffWidthReduction(-90);

