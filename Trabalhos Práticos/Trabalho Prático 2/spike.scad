include<"drop.5-u.stl">;

$fn=50;

altura_copo = 80;

raio = 25;
raio_paredes = 0.5;
espacamento_paredes = 20;

rib_radius = 1.5;
rib_width = 1.5;  // Width of each rib
rib_depth = 1;  // Depth of each rib
rib_spacing_angle = 5;  // Angle spacing for each rib


module paredes() {
    for (angle = [0:espacamento_paredes:360]) {
        rotate([0, 0, angle]) {
            translate([raio, 0, 0]) {
                import("drop.5-u.stl", convexity=3);
            }
        }
    }
}

module base_copo(){
    union(){
        //circle(r = raio);
        #paredes();
    }

}


//for (altura=[0: 1: altura_copo]){
    //rotate_extrude(angle=360, convexity=2)
//    linear_extrude(altura, twist=1)
//    translate([1,1,0])
//    #base_copo();
//}

module drop(scale_factor) { 
    scale([scale_factor, scale_factor, scale_factor]){
    union(){
        sphere(r=5);
        translate([0,0,10]);
        cylinder(h=50, r1=5, r2=0);
    }
    }
}

// module drop1(size = [0.2,0.2,0.2]){
//     scale(size)
//     scale([scale_factor, scale_factor, scale_factor]){
//     union(){
//         sphere(r=5);
//         translate([0,0,10]);
//         cylinder(h=50, r1=5, r2=0);
//     }
//     }
// }

// module drop2(size = [0.2,0.2,0.2]){
//     scale(size)
//     import("drop.35-u.stl", convexity=3);
// }

// module drop3(size = [0.2,0.2,0.2]){
//     scale(size)
//     import("drop-1.-u.stl", convexity=3);
// }

module coroa_gotas(){
    for (angle = [0: espacamento_paredes: 360]){
        random= floor(rands(0, 15, 1)[0]);
        rotate([0,0,angle]){
            r = rands(0.1, 0.2, 1)[0];
            drop(scale_factor=r);


            // if(random%2==0){
            //     translate([raio,0,3]){
            //         r = rands(0.1, 0.2, 1)[0];
            //         drop1(r);
            //     }
            // }if(random%5==0){
            //     translate([raio,0,3]){
            //         r = rands(0.1, 0.13, 1)[0];
            //         drop2(size=[r,r,r]);
            //     }
            // }else{
            //     translate([raio,0,3]){
            //         r = rands(0.1, 0.2, 1)[0];
            //         drop3(size=[r,r,r]);
            //     }
            // }
            
        }   
    }
}


module estrutura_copo(){
    offset = 2;
    
    union(){
        translate([0, 0, -offset])
        coroa_gotas();
        translate([0, 0, altura_copo+offset])
        rotate([0, 180, 0])
        coroa_gotas();
        #cylinder(h=altura_copo, r=raio);
     }
}


module copo(){
    difference(){
        difference(){
            estrutura_copo();
            translate([0,0,-2])
            cube([3*raio, 3*raio, 5], center = true);
        }
        translate([0,0,altura_copo])
        cube([3*raio, 3*raio, 5], center = true);
    }
    
}

module anel(){
        for (i = [0: 1: 50]){
            rotate_extrude(angle=-360)
            translate([raio, 0, i]) 
            circle(r = 2);
}
}


module copo_final(){
    union(){
        copo();
        anel();
        translate([0,0,altura_copo-2])
        anel();
    }
}
copo();
copo_final();
