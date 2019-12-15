include <ObtConnectors.scad>

$vpd = 200;
$vpr = [55, 0, 65];
$vpt = [ 0, 0,  0];

translate([-20, -20, 0]) obtCon4PinStd();
translate([-20,  20, 0]) obtCon4PinAngled();
translate([+20, -20, 0]) obtCon2PinSglHole();
