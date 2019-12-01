include <../parts/ObtParts.scad>

$vpd = 260;
$vpr = [55, 0, 35];
$vpt = [ 0, 0,  0];

BW = OBT_GLOBAL_BAR_WIDTH;
BH = OBT_GLOBAL_BAR_HEIGHT;
HD = OBT_GLOBAL_HOLE_DISTANCE;
PL = OBT_PIN_LENGTH;

translate([0,       0,         0]) rotate([0  ,   0,   0]) obtBarStd(7, "lightgray");
translate([0, -3 * HD,         0]) rotate([180,   0,   0]) obtPinDoubleConnector();
translate([0, -1 * HD,         0]) rotate([180,   0,   0]) obtPinDoubleConnector();
translate([0, -2 * HD,        BH]) rotate([0  ,   0,   0]) obtBarStd(3, "red");
translate([0,  1 * HD, -0.5 * PL]) rotate([0  ,   0,   0]) obtPinConnector();
translate([0,  3 * HD, -0.5 * PL]) rotate([0  ,   0,   0]) obtPinConnector();

translate([0, -2 * HD,         0]) rotate([0  ,   0,   0]) obtAxStd(5.5, "lightgrey", -20);
