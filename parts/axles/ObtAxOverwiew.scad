include <ObtAxles.scad>

$vpd = 300;
$vpr = [55, 0, 65];
$vpt = [-10, -10,  0];

translate([-30, 0, 0]) rotate([90, 0, 0]) obtAxStd(11, "lightgrey");
translate([-20, 0, 0]) rotate([90, 0, 0]) obtAxStd(9, "#303030");
translate([-10, 0, 0]) rotate([90, 0, 0]) obtAxStd(7, "lightgrey");
translate([  0, 0, 0]) rotate([90, 0, 0]) obtAxStd(5, "#303030");
translate([+10, 0, 0]) rotate([90, 0, 0]) obtAxStd(3, "lightgrey");
translate([+20, 0, 0]) rotate([90, 0, 0]) obtAxStd(2, "#303030");

