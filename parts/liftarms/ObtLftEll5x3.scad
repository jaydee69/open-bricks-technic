use <ObtLftEll.scad>

module obtBarEll5x3(color = 0){
	obtBarEll(5, 3, color);
}


// Test
translate([0, 0, 0]) rotate([0, 0, 0]) obtBarEll5x3("orange");
