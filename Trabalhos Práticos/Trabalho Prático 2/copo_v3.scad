$fn = 150;  // Higher number for smooth curves

// Parameters
cup_height = 90;
cup_radius = 30;  // Adjust as needed for diameter
wall_thickness = 2;  // Thickness of the cup wall
rib_width = 1.5;  // Width of each rib
rib_depth = 1;  // Depth of each rib
rib_spacing_angle = 5;  // Angle spacing for each rib


module cup_structure(scale=1){
    minkowski(){
        cylinder(h = cup_height, r = scale*cup_radius);
        sphere(r = 4);
    }
}

// Vertical Ribbing
module vertical_ribs(scale=1) {
    for (angle = [0:rib_spacing_angle:360]) {
        rotate([0, 0, angle]) {
            translate([scale*cup_radius+3, 0, 0]) {
                minkowski(){
                    cylinder(h = cup_height, r = rib_depth);
                    sphere(r = 1);
                }
            }
        }
    }
}

module cup(scale=1){
    union(){
        cup_structure(scale);
        vertical_ribs(scale);
    }
}

module cup_base(){
    difference(){
        cup();
        translate([0,0,cup_height])
        cube([2.5*cup_radius, 2.5*cup_radius, 10], center=true);
    }
}


module cup_top(){
    union(){
        translate([0, 0, cup_height+8]) {
            sphere(r = 5);   
        }
        difference(){
            cup(scale=1.1);
            translate([0,0,cup_height-(3*cup_radius/2)-10])
            cube([3*cup_radius, 3*cup_radius, 100], center=true);
        }
    }
}

cup_base();
translate([100,0,0])
cup_top();