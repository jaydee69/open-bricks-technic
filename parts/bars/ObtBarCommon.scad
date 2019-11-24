include <ObtBarConst.scad>

module obtBarCommonHoleChamferDiffBase(zOffsetDirection){
	zOffset = zOffsetDirection * (OBT_BAR_HEIGHT / 2 - OBT_BAR_HOLE_CHAMFER_HEIGHT / 2);
	translate([0, 0, zOffset]) cylinder(OBT_BAR_HOLE_CHAMFER_HEIGHT * 1.01, d1 = OBT_BAR_HOLE_CHAMFER_DIAMETER, d2 = OBT_BAR_HOLE_CHAMFER_DIAMETER, center = true);
}

module obtBarCommonHoleChamferDiff(){
	union(){
		obtBarCommonHoleChamferDiffBase(1);
		obtBarCommonHoleChamferDiffBase(-1);
	}
}


// Test
color("red") obtBarCommonHoleChamferDiff();


