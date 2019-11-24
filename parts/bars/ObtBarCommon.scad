include <ObtBarConst.scad>

module obtBarCommonHolePhaseDiffBase(zOffsetDirection){
	zOffset = zOffsetDirection * (OBT_BAR_HEIGHT / 2 - OBT_BAR_HOLE_PHASE_HEIGHT / 2);
	translate([0, 0, zOffset]) cylinder(OBT_BAR_HOLE_PHASE_HEIGHT * 1.01, d1 = OBT_BAR_HOLE_PHASE_DIAMETER, d2 = OBT_BAR_HOLE_PHASE_DIAMETER, center = true);
}

module obtBarCommonHolePhaseDiff(){
	union(){
		obtBarCommonHolePhaseDiffBase(1);
		obtBarCommonHolePhaseDiffBase(-1);
	}
}


// Test
color("red") obtBarCommonHolePhaseDiff();


