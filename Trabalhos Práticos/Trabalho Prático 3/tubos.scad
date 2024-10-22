$fn=50;
%cylinder(h=30, r=2);

translate([0,0,3])
rotate([90, 0, 90]){
cylinder(h=4, r=1);
square([3,1], center=true);
}