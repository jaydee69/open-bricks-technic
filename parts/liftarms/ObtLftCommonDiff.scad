include <ObtLftConst.scad>

module obtBarCommonHoleChamferDiffBase(zOffsetDirection){
	zOffset = zOffsetDirection * (OBT_BAR_HEIGHT / 2 - OBT_BAR_HOLE_CHAMFER_HEIGHT / 2);
	translate([0, 0, zOffset]) cylinder(OBT_BAR_HOLE_CHAMFER_HEIGHT * 1.01, d1 = OBT_BAR_HOLE_CHAMFER_DIAMETER, d2 = OBT_BAR_HOLE_CHAMFER_DIAMETER, center = true);
}

module obtBarCommonHoleChamferDiff(){
	union(){
		obtBarCommonHoleChamferDiffBase(1);
		obtBarCommonHoleChamferDiffBase(-1);
	}
}

module obtBarCommonHoleDiff(){
	union(){
		obtBarCommonHoleChamferDiff();
		cylinder(OBT_BAR_HEIGHT, d1 = OBT_BAR_HOLE_DIAMETER, d2 = OBT_BAR_HOLE_DIAMETER, center = true);
	}
}

module obtBarCommonDiffBase(zOffsetDirection, rotation){
	height = 0.5 * (OBT_BAR_HEIGHT - OBT_BAR_WEB_WIDTH);
	zOffset = zOffsetDirection * 0.5 * (OBT_BAR_HEIGHT - height);
	translate([0, 0, zOffset])
		rotate([0, 0, rotation])
			difference(){
				translate([0, 0.25 * OBT_BAR_HOLE_DISTANCE + 0.001, 0])
					cube([OBT_BAR_INNER_WIDTH, 0.5 * OBT_BAR_HOLE_DISTANCE, height + 0.01], center = true);
				cylinder(OBT_BAR_HEIGHT, d1 = OBT_BAR_HOLE_DIAMETER_OUTER, d2 = OBT_BAR_HOLE_DIAMETER_OUTER, center = true);
			}
	
}

module obtBarCommonDiffInnerCorner(rotation){
	rotate([0, 0, rotation])
		translate([0.5 * OBT_BAR_HOLE_DISTANCE, 0.5 * OBT_BAR_HOLE_DISTANCE, 0])
			cube([OBT_BAR_HOLE_DISTANCE - OBT_BAR_WIDTH, OBT_BAR_HOLE_DISTANCE - OBT_BAR_WIDTH, OBT_BAR_HEIGHT + 0.01], center = true);
}

module obtBarCommonDiffOuterCorner(rotation){
	rotate([0, 0, rotation])
	difference(){
		translate([OBT_BAR_HOLE_DISTANCE / 4, OBT_BAR_HOLE_DISTANCE / 4, 0])
			cube([OBT_BAR_HOLE_DISTANCE / 2, OBT_BAR_HOLE_DISTANCE / 2, OBT_BAR_HEIGHT + 0.001], center = true);
		cylinder(OBT_BAR_HEIGHT + 0.002 , d1 = OBT_BAR_WIDTH, d2 = OBT_BAR_WIDTH, center = true);
	}
}

module obtBarCommonDiffWidthReduction(rotation){
	rotate([0, 0, rotation])
		translate([-0.5 * OBT_BAR_HOLE_DISTANCE, 0, 0])
			cube([OBT_BAR_HOLE_DISTANCE - OBT_BAR_WIDTH, OBT_BAR_HOLE_DISTANCE + 0.01, OBT_BAR_HEIGHT + 0.01], center = true);
}


// Test
translate([0,  20, 0]) color("red") obtBarCommonHoleChamferDiff();
translate([0,  10, 0]) color("red") obtBarCommonHoleDiff();
translate([0,   0, 0]) color("red") obtBarCommonDiffBase(1, 0);
translate([0,   0, 0]) color("red") obtBarCommonDiffBase(-1, 90);
translate([0, -10, 0]) color("red") obtBarCommonDiffInnerCorner(0);
translate([0, -10, 0]) color("red") obtBarCommonDiffOuterCorner(180);
translate([0, -20, 0]) color("red") obtBarCommonDiffWidthReduction(-90);

