use <ObtLftEll.scad>

module obtLftEll5x3(color = 0){
	obtLftEll(5, 3, color);
}


// Test
translate([0, 0, 0]) rotate([0, 0, 0]) obtLftEll5x3("orange");
