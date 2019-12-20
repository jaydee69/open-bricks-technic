use <ObtLftTee.scad>

module obtLftTee3x3(color = 0){
	obtLftTee(3, 3, color);
}


// Test
translate([0, 0, 0]) rotate([0, 0, 0]) obtLftTee3x3("cyan");
