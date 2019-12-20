include <ObtLiftarms.scad>

$vpd = 300;
$vpr = [55, 0, 65];
$vpt = [ 0, 0,  0];

translate([-30, -20, 0]) obtLftStd(7, "red");
translate([  0, -20, 0]) obtLftStd(5, "lightgrey");
translate([+30, -20, 0]) obtLftStd(3, "#303030");
translate([-20, +30, 0]) obtLftTee3x3("#303030");
translate([+20, +20, 0]) obtLftEll5x3("green");




