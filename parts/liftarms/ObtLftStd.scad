include <ObtLftConst.scad>

use <ObtLftInner.scad>
use <ObtLftEnd.scad>

module obtLftStd(countHoles, color = 0){
	assert(countHoles >= 2);
	countInnerHoles = countHoles - 2;
	color(color){
		union(){
			yOffset1 = -1 * (countInnerHoles + 1) / 2 * OBT_LFT_HOLE_DISTANCE;
			translate([0, yOffset1, 0]) obtLftEnd();
			if(countInnerHoles > 0){
				for(i = [0:countInnerHoles - 1]){
					yOffset = (i - (countInnerHoles - 1) / 2) * OBT_LFT_HOLE_DISTANCE;
					translate([0, yOffset, 0]) obtLftInner();
				}
			}
			yOffset2 = (countInnerHoles + 1) / 2 * OBT_LFT_HOLE_DISTANCE;
			translate([0, yOffset2, 0]) rotate([180, 0, 0]) obtLftEnd();
		}
	}
}

// Test
translate([0, 0, 0]) obtLftStd(8);
translate([10, 0, 0]) rotate([0, 90, 0]) obtLftStd(5, "green");
translate([-10, 0, 0]) rotate([90, 0, 0]) obtLftStd(3, "red");
translate([20, 0, -1 * OBT_LFT_HOLE_DISTANCE / 2]) rotate([90, 0, 90]) obtLftStd(2, "blue");
