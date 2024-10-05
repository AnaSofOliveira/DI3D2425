$fn = 150;  // Higher number for smooth curves

// Parameters
cup_height = 90;
cup_radius = 40;  // Adjust as needed for diameter
wall_thickness = 2;  // Thickness of the cup wall
rib_width = 1.5;  // Width of each rib
rib_depth = 2;  // Depth of each rib
rib_spacing_angle = 5;  // Angle spacing for each rib

// Main Cup Body
module cup_body() {
    //difference() {
        // Outer cylinder (main body)
        cylinder(h = cup_height, r = cup_radius);

        // Inner hollow part (subtract for thickness)
        translate([0, 0, -0.1])  // Translate a little down for clean bottom
            cylinder(h = cup_height + 0.2, r = cup_radius - wall_thickness);  // Slightly higher to ensure subtraction
    //}
}

// Vertical Ribbing
module vertical_ribs() {
    for (angle = [0:rib_spacing_angle:360]) {
        rotate([0, 0, angle]) {
            translate([cup_radius, 0, 0]) {
                cylinder(h = cup_height, r = rib_depth-0.5);
                
                //cube([rib_depth, rib_width, cup_height], center=false);
            }
        }
    }
}

// Combine the main body and ribs
cup_body();
vertical_ribs();
