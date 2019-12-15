include <ObtAxlConst.scad>

module obtAxlStdBase(length){
	union(){
		coneHeight = 0.5 * OBT_AXL_DIAMETER;
		coneOffset = 0.5 * (length * OBT_AXL_BASE_LENGTH + coneHeight);
		cylinder(length * OBT_AXL_BASE_LENGTH, d1 = OBT_AXL_DIAMETER, d2 = OBT_AXL_DIAMETER, center = true);
		translate([0, 0, +coneOffset]) cylinder(coneHeight, d1 = OBT_AXL_DIAMETER, d2 = 0, center = true);
		translate([0, 0, -coneOffset]) cylinder(coneHeight, d1 = 0, d2 = OBT_AXL_DIAMETER, center = true);
	}
}

module obtAxlStdDiff(length){
	cubeWidth = 0.5 * OBT_AXL_DIAMETER;
	crossWidth = 1.8;
	crossOffset = 1 * (cubeWidth + crossWidth);
	offsetChamferCube = length * OBT_AXL_BASE_LENGTH + 1 * OBT_AXL_DIAMETER + 0.5;
	for(i = [0 : 1 : 1]){
		for(j = [0 : 1 : 1])
			translate([crossOffset * (i - 0.5) , crossOffset * (j - 0.5), 0]) cube([cubeWidth, cubeWidth, length * (OBT_AXL_BASE_LENGTH + 0.5 * OBT_AXL_DIAMETER)] , center = true);
		translate([0, 0, offsetChamferCube * (i - 0.5)]) cube(OBT_AXL_DIAMETER, center = true);
	}
}

module obtAxlStd(length = 1, color = "lightgrey", rotation = 0){
	color(color)
		difference(){
			obtAxlStdBase(length);
			rotate([0, 0, rotation]) obtAxlStdDiff(length);
		}
}


// Test
length = 1;
translate([0,  10, 0]) color("green") obtAxlStdBase(length);
translate([0,  20, 0]) color("red") obtAxlStdDiff(length);
translate([0,   0, 0]) obtAxlStd(length);
translate([0, -10, 0]) obtAxlStd(length = 2, color = "khaki", rotation = 45);

