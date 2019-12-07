use <ObtBarTee.scad>

module obtBarTee3x3(color = 0){
	obtBarTee(3, 3, color);
}


// Test
translate([0, 0, 0]) rotate([0, 0, 0]) obtBarTee3x3("cyan");
