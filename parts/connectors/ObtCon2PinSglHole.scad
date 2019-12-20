include <ObtConConst.scad>

use <../pins/ObtPins.scad>
	use <../pins/ObtPinBase.scad>

use <ObtConInnerSglHole.scad>

module obtCon2PinSglHole(color = "lightgrey"){
	color(color)
		union(){
			obtConInnerSglHole();
			translate([0, +0.5 * (OBT_CON_HOLE_DISTANCE + OBT_GLOBAL_LFT_HEIGHT), 0])
				rotate([-90, 0, 0])
					obtPinBase(rotateSlit = true);
			translate([0, -0.5 * (OBT_CON_HOLE_DISTANCE + OBT_GLOBAL_LFT_HEIGHT), 0])
				rotate([+90, 0, 0])
					obtPinBase(rotateSlit = true);
		}
}


// Test
obtCon2PinSglHole(0);

color("green"){
	translate([0,                                                         0, -15])
		obtConInnerSglHole();
	translate([0, +0.5 * (OBT_CON_HOLE_DISTANCE + OBT_GLOBAL_LFT_HEIGHT) +5, -15])
		rotate([-90, 0, 0])
			obtPinBase(rotateSlit = true);
	translate([0, -0.5 * (OBT_CON_HOLE_DISTANCE + OBT_GLOBAL_LFT_HEIGHT) -5, -15])
		rotate([+90, 0, 0])
			obtPinBase(rotateSlit = true);
}

