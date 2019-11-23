include <ObtBarConst.scad>

module obtBarCommonHolePhaseDiffBase(zOffsetDirection){
	diameter = 6.1;
	height = 0.7;
	zOffset = zOffsetDirection * (OBT_BAR_HEIGHT / 2 - height / 2);
	translate([0, 0, zOffset]) cylinder(height * 1.01, d1 = diameter, d2 = diameter, center = true);
}

module obtBarCommonHolePhaseDiff(){
	union(){
		obtBarCommonHolePhaseDiffBase(1);
		obtBarCommonHolePhaseDiffBase(-1);
	}
}


// Test
color("red") obtBarCommonHolePhaseDiff();


