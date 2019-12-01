include <ObtAxConst.scad>

module obtAxStdBase(length){
	union(){
		coneHeight = 0.5 * OBT_AX_DIAMETER;
		coneOffset = 0.5 * (length * OBT_AX_BASE_LENGTH + coneHeight);
		cylinder(length * OBT_AX_BASE_LENGTH, d1 = OBT_AX_DIAMETER, d2 = OBT_AX_DIAMETER, center = true);
		translate([0, 0, +coneOffset]) cylinder(coneHeight, d1 = OBT_AX_DIAMETER, d2 = 0, center = true);
		translate([0, 0, -coneOffset]) cylinder(coneHeight, d1 = 0, d2 = OBT_AX_DIAMETER, center = true);
	}
}

module obtAxStdDiff(length){
	cubeWidth = 0.5 * OBT_AX_DIAMETER;
	crossWidth = 1.8;
	crossOffset = 1 * (cubeWidth + crossWidth);
	offsetChamferCube = length * OBT_AX_BASE_LENGTH + 1 * OBT_AX_DIAMETER + 0.5;
	for(i = [0 : 1 : 1]){
		for(j = [0 : 1 : 1])
			translate([crossOffset * (i - 0.5) , crossOffset * (j - 0.5), 0]) cube([cubeWidth, cubeWidth, length * (OBT_AX_BASE_LENGTH + 0.5 * OBT_AX_DIAMETER)] , center = true);
		translate([0, 0, offsetChamferCube * (i - 0.5)]) cube(OBT_AX_DIAMETER, center = true);
	}
}

module obtAxStd(length = 1, color = "lightgrey", rotation = 0){
	color(color)
		difference(){
			obtAxStdBase(length);
			rotate([0, 0, rotation]) obtAxStdDiff(length);
		}
}


// Test
length = 1;
translate([0,  10, 0]) color("green") obtAxStdBase(length);
translate([0,  20, 0]) color("red") obtAxStdDiff(length);
translate([0,   0, 0]) obtAxStd(length);
translate([0, -10, 0]) obtAxStd(length = 2, color = "khaki", rotation = 45);

