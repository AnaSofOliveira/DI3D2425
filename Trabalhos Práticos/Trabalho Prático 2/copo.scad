$fn=100;  // Smooth curves

// Parameters
cup_height = 90;
cup_radius_bottom = 30;  // 60 mm diameter
cup_radius_top = 30;     // Uniform shape for spiral print
base_thickness = 2;      // Minimal thickness to act as the base for spiral print

handle_thickness = 1.75;  // Same as nozzle size for spiral print
handle_width = 12;
handle_height = 50;

rope_thickness = 1.75;  // Match nozzle size for smooth print
rope_spacing = 15;

panel_width = 5;
panel_depth = 1.75;
panel_angle_step = 15;  // Spacing for panels (angle)

// Main Cup Module
module cup() {
    difference() {
        // Outer Shell
        cylinder(h = cup_height, r1 = cup_radius_bottom, r2 = cup_radius_top);
        // Optional: Create a base for the cup
        translate([0, 0, -base_thickness]) {
            cylinder(h = base_thickness, r = cup_radius_bottom);
        }
    }
}

// Handle Module
module handle() {
    translate([cup_radius_bottom + handle_thickness/2, 0, cup_height/3]) {
        rotate([0, 90, 0]) {
            cylinder(h = handle_thickness, r = handle_width/2, $fn=100);  // Simple cylindrical handle
        }
    }
}

// Decorative Ropes Module
module ropes() {
    for(i = [20, 45, 70]) {
        translate([0, 0, i]) {
            scale([1, 1, 2.5]) {  // Scale only in the z-direction for height
                rotate_extrude(angle=360) 
                    translate([cup_radius_bottom, 0, 0]) 
                        circle(r = rope_thickness);  // Torus-shaped ropes
            }
        }
    }
}


// Wooden Paneling Module
module panels() {
    for(angle = [0:panel_angle_step:360]) {
        rotate([0, 0, angle]) {
            translate([0, cup_radius_bottom, 45]) {
                cube([panel_width, panel_depth, cup_height], center=true);  // Light indentation for panel look
            }
        }
    }
}

// Assembling the Cup
cup();
handle();
ropes();
panels();
