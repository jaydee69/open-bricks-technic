include <ObtLftConst.scad>

use <ObtLftInner.scad>
use <ObtLftEnd.scad>
use <ObtLftTeeBase.scad>


module obtLftTee(countHolesX, countHolesY, color = 0){
	assert(countHolesX >= 2);
	assert(countHolesY >= 3);
	assert(countHolesY % 2 != 0);
	countInnerHolesX = countHolesX - 2;
	countInnerHolesY = countHolesY - 2;
	color(color){
		union(){

			endOffsetLeftY = -0.5 * (countInnerHolesY + 1) * OBT_LFT_HOLE_DISTANCE;
			translate([0, endOffsetLeftY, 0]) rotate([0, 0, 0]) obtLftEnd();

			if(countInnerHolesY > 1){
				for(i = [0: countInnerHolesY - 1]){
					if(i != floor(countInnerHolesY / 2)){
						yOffset = (i - 0.5 * (countInnerHolesY - 1)) * OBT_LFT_HOLE_DISTANCE;
						translate([0, yOffset, 0]) obtLftInner();
					} else
						obtLftTeeBase();
				}
			}	else
				obtLftTeeBase();

			endOffsetRightY = +0.5 * (countInnerHolesY + 1) * OBT_LFT_HOLE_DISTANCE;
			translate([0, endOffsetRightY, 0]) rotate([0, 0, 180]) obtLftEnd();

			if(countInnerHolesX > 0){
				for(i = [1: countInnerHolesX]){
					xOffset = i * OBT_LFT_HOLE_DISTANCE;
					translate([xOffset, 0, 0]) rotate([0, 0, 90]) obtLftInner();
				}
			}

			endOffsetX = (countInnerHolesX + 1) * OBT_LFT_HOLE_DISTANCE;
			translate([endOffsetX, 0, 0]) rotate([0, 0, 90]) obtLftEnd();
		}
	}
}


// Test
translate([0, 0, 0]) rotate([0, 0, 0]) obtLftTee(3, 3, undef);
translate([-50, 0, 0]) rotate([0, 0, 0]) obtLftTee(4, 5);
translate([50, 0, 0]) rotate([0, 0, 0]) obtLftTee(2, 7);
