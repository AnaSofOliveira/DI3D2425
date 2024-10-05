$fn=100;  // Smooth curves

// Cup Dimensions
cup_height = 90;
cup_radius_bottom = 30; // 60 mm diameter
cup_radius_top = 30;    // Uniform shape for spiral print

// Base
base_thickness = 2;     // Minimal thickness to act as the base for spiral print

// Create outer shell of the cup
cylinder(h = cup_height, r1 = cup_radius_bottom, r2 = cup_radius_top);

// Base (Optional: Could be handled by spiral mode automatically)
translate([0, 0, -base_thickness]) {
    cylinder(h = base_thickness, r = cup_radius_bottom);
}

// Decorative Rope (Three ropes around the cup)
rope_thickness = 1.75;  // Match nozzle size for smooth print
rope_spacing = 15;
for(i = [20, 45, 70]) {
    translate([0, 0, i]) {
        rotate_extrude(angle=360) 
            translate([cup_radius_bottom, 0, 0]) 
                circle(r = rope_thickness);
    }
}

// Paneling Effect (Optional - For aesthetics)
for(angle = [0:15:360]) {
    rotate([0, 0, angle]) {
        translate([0, cup_radius_bottom, 45]) {
            cube([5, 1.75, cup_height], center=true);  // Shallow indent for panel look
        }
    }
}
