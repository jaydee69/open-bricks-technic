include <../parts/ObtParts.scad>

$vpd = 260;
$vpr = [70, 0, 45];
$vpt = [ 0, 0,  0];

BW = OBT_GLOBAL_LFT_WIDTH;
BH = OBT_GLOBAL_LFT_HEIGHT;
HD = OBT_GLOBAL_HOLE_DISTANCE;
PL = OBT_PIN_LENGTH;

translate([ 0 * HD,  0 * HD,         0]) rotate([  0,   0,    0]) obtLftStd(7, "lightgray");
translate([ 0 * HD, -3 * HD,         0]) rotate([180,   0,    0]) obtPinDoubleConnector();
translate([ 0 * HD, -1 * HD,         0]) rotate([180,   0,    0]) obtPinDoubleConnector();
translate([ 0 * HD, -2 * HD,        BH]) rotate([  0,   0,    0]) obtLftStd(3, "red");
translate([ 0 * HD, +1 * HD, +0.5 * PL]) rotate([  0,   0,    0]) obtPinConnector();
translate([ 0 * HD, +3 * HD, +0.5 * PL]) rotate([  0,   0,    0]) obtPinConnector();
translate([ 0 * HD, -2 * HD, -1.0 * PL]) rotate([  0,   0,    0]) obtLftTee3x3(color = "#303030");
translate([ 0 * HD, +3 * HD, +1.0 * PL]) rotate([180,   0,    0]) obtLftEll5x3(color = "orange");
translate([ 0 * HD, -2 * HD,         0]) rotate([  0,   0,    0]) obtAxlStd(5.5, "lightgrey", 0);
translate([+2 * HD, +3 * HD,  0.0 * BH]) rotate([  0,  90 ,  90]) obtCon4PinStd();
translate([+4 * HD, +3 * HD, +2.0 * BH]) rotate([  0,  90 , -90]) obtCon4PinAngled();
translate([ 0 * HD, +2 * HD, +2.0 * BH]) rotate([ 90,   0 ,  45]) obtCon2PinSglHole();
