$fn=100;
raio_exterior = 15;
grossura_copo = 2;
altura_copo = 120;
espaco_interior = 2;

module copo_exterior(){
    difference(){
        union(){
            difference(){
                cylinder(altura_copo*0.6, raio_exterior, raio_exterior-espaco_interior);
                translate([0,0,-5]){
                    cylinder(altura_copo*0.6+5, raio_exterior-grossura_copo, raio_exterior-grossura_copo-espaco_interior);
                }
            }
            
            // difference(){
            translate([0,0,altura_copo*0.6]){
                cylinder(altura_copo*0.3, raio_exterior-espaco_interior, raio_exterior*0.3);
                
            }
                
            // }
        }
        translate([0,0,altura_copo*0.6-0.05]){
            cylinder(altura_copo*0.25, raio_exterior-espaco_interior-grossura_copo, raio_exterior*0.2);
        }
    }
}

module cortes(n_cortes){
    for (i = [0: 360/n_cortes: 360]){
        rotate([90, 0, i]) 
        hull(){
            cylinder(40, 2, 2, center=true);
            translate([0,altura_copo*0.7-altura_copo*0.2,0]){
                cylinder(40, raio_exterior*0.1, raio_exterior*0.1, center=true);
            }
        }
    }

    translate([0, 0, altura_copo*0.6-1])
    for (i = [0: 360/n_cortes: 360]){
    rotate([90,0,i])
    hull(){
        cylinder(r=raio_exterior*0.1, h=40, center=true);
        translate([0,altura_copo-altura_copo*0.8,0]){
            cylinder(r=0.5, h=40, center=true);
        }

    }
}
}

module copo(){
    union(){
        difference(){
            copo_exterior();
            translate([0,0,5])
            cortes(n_cortes=10);
        }
    }
}

union(){
    copo();
    rotate_extrude(convexity = 10){
            translate([raio_exterior, 0, 0])
            circle(r = 2);
    }
}



