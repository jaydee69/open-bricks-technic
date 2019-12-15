include <ObtPins.scad>

$vpd = 200;
$vpr = [55, 0, 65];
$vpt = [ 0, 0,  0];

translate([-10, -10, 0]) obtPinConnector();
translate([-10,  10, 0]) obtPinDoubleConnector();

