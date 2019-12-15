include <../parts/ObtParts.scad>

translate([0,  0                        , 0.0                 ]) obtBarStd(5, "red");
translate([0,  0                        , 0.5 * OBT_PIN_LENGTH]) obtPinConnector();
translate([0,  2 * OBT_BAR_HOLE_DISTANCE, 0.5 * OBT_PIN_LENGTH]) obtPinConnector();
translate([0,  2 * OBT_BAR_HOLE_DISTANCE, 1.0 * OBT_BAR_HEIGHT]) obtBarStd(5, "grey");
translate([0, -2 * OBT_BAR_HOLE_DISTANCE, 0.0                 ]) obtPinDoubleConnector();
translate([0, -1 * OBT_BAR_HOLE_DISTANCE, 0]) obtAxlStd(3, "khaki", -20);

translate([0,  2 * OBT_BAR_HOLE_DISTANCE, 2 * OBT_GLOBAL_BAR_HEIGHT]) rotate([0, 90 , 0]) obtCon4PinStd();
