include <ObtBars.scad>

$vpd = 300;
$vpr = [55, 0, 65];
$vpt = [ 0, 0,  0];

translate([-30, -20, 0]) obtBarStd(7, "red");
translate([  0, -20, 0]) obtBarStd(5, "lightgrey");
translate([+30, -20, 0]) obtBarStd(3, "#303030");
translate([-20, +30, 0]) obtBarTee3x3("#303030");
translate([+20, +20, 0]) obtBarEll5x3("green");




