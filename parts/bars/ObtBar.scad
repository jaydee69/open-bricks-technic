include <ObtBarConst.scad>

use <ObtBarInner.scad>
use <ObtBarEnd.scad>

module obtBar(countHoles, color = "grey"){
	assert(countHoles >= 2);
	countInnerHoles = countHoles - 2;
	color(color)
	union(){
		yOffset1 = -1 * (countInnerHoles + 1) / 2 * OBT_BAR_HOLE_DISTANCE;
		translate([0, yOffset1, 0]) obtBarEnd();
		if(countInnerHoles > 0){
			for(i = [0:countInnerHoles - 1]){
				yOffset = (i - (countInnerHoles - 1) / 2) * OBT_BAR_HOLE_DISTANCE;
				translate([0, yOffset, 0]) obtBarInner();
			}
		}
		yOffset2 = (countInnerHoles + 1) / 2 * OBT_BAR_HOLE_DISTANCE;
		translate([0, yOffset2, 0]) rotate([180, 0, 0]) obtBarEnd();
	}
}

// Test
translate([0, 0, 0]) obtBar(8);
translate([10, 0, 0]) rotate([0, 90, 0]) obtBar(5, "green");
translate([-10, 0, 0]) rotate([90, 0, 0]) obtBar(3, "red");
translate([20, 0, -1 * OBT_BAR_HOLE_DISTANCE / 2]) rotate([90, 0, 90]) obtBar(2, "blue");
