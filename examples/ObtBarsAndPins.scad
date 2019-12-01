include <../parts/ObtParts.scad>

translate([0, 0, 0]) obtBar(5, "red");
translate([0, 0, OBT_PIN_LENGTH / 2]) obtPinConnector();
translate([0, 2 * OBT_BAR_HOLE_DISTANCE, OBT_PIN_LENGTH / 2]) obtPinConnector();
translate([0, 2 * OBT_BAR_HOLE_DISTANCE, OBT_BAR_HEIGHT]) obtBar(5, "grey");
translate([0, -2 * OBT_BAR_HOLE_DISTANCE, 0]) obtPinDoubleConnector();
translate([0, -1 * OBT_BAR_HOLE_DISTANCE, 0]) obtAxStd(3, "khaki", -20);
