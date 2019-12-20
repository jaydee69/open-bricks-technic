include <ObtLftConst.scad>

use <ObtLftInner.scad>
use <ObtLftEnd.scad>
use <ObtLftEllBase.scad>


module obtLftEllInner(countInnerHoles, xFactor, yFactor){
	if(countInnerHoles > 1){
		for(i = [0: countInnerHoles - 1]){
			offs = (i + 1) * OBT_LFT_HOLE_DISTANCE;
			translate([xFactor * offs, yFactor * offs, 0]) rotate([0, 0, xFactor * 90]) obtLftInner();
		}
	} else if(countInnerHoles > 0) {
		translate([xFactor * OBT_LFT_HOLE_DISTANCE, yFactor * OBT_LFT_HOLE_DISTANCE, 0]) rotate([0, 0, xFactor * 90]) obtLftInner();
	}
}

module obtLftEll(countHolesX, countHolesY, color = 0){
	assert(countHolesX >= 2);
	assert(countHolesY >= 2);
	countInnerHolesX = countHolesX - 2;
	countInnerHolesY = countHolesY - 2;
	color(color){
		union(){
			obtLftEllBase();

			obtLftEllInner(countInnerHolesX, 1, 0);
			endOffsetX = (countInnerHolesX + 1) * OBT_LFT_HOLE_DISTANCE;
			translate([endOffsetX, 0, 0]) rotate([0, 0, 90]) obtLftEnd();

			obtLftEllInner(countInnerHolesY, 0, 1);
			endOffsetY = (countInnerHolesY + 1) * OBT_LFT_HOLE_DISTANCE;
			translate([0, endOffsetY, 0]) rotate([0, 0, 180]) obtLftEnd();
		}
	}
}


// Test
translate([-50, 0, 0]) rotate([0, 0, 0]) obtLftEll(3, 3);
translate([0, 0, 0]) rotate([0, 0, 0]) obtLftEll(2, 2, undef);
translate([50, 0, 0]) rotate([0, 0, 0]) obtLftEll(5, 4);
