// 90x60mm wine glass

max_raio = 30;
min_raio = 10;
altura = 90;

$fn = 100;


module copo_baixo() {
    union(){
        cylinder(h = 0.05*altura, r1 = max_raio, r2=0.7*max_raio);
        translate([0, 0, 0.05*altura]) {
            cylinder(h = 0.05*altura, r1 = 0.7*max_raio, r2=0.5*max_raio);
        }
        translate([0, 0, 0.1*altura]) {
            cylinder(h = 0.1*altura, r1 = 0.5*max_raio, r2=0.2*max_raio);
        }
        translate([0, 0, 0.2*altura]) {
            linear_extrude(0.1*altura,twist=360, $fn=200)
            square(0.2*max_raio,center=true);
        }
    }
}

module copo_cima(){
    union(){
        translate([0, 0, 0.2*altura]) {
            linear_extrude(0.1*altura,twist=360, $fn=200)
            square(0.22*max_raio,center=true);
        }
        translate([0, 0, 0.3*altura]) {
            cylinder(h = 0.05*altura, r1 = 0.2*max_raio, r2=0.4*max_raio);
        }
        translate([0, 0, 0.35*altura]) {
            cylinder(h = 0.2*altura, r1 = 0.4*max_raio, r2=0.8*max_raio);
        }
        translate([0, 0, 0.55*altura]) {
            cylinder(h = 0.05*altura, r1 = 0.8*max_raio, r2=0.9*max_raio);
        }
        translate([0, 0, 0.6*altura]) {
            cylinder(h = 0.2*altura, r1 = 0.9*max_raio, r2=max_raio);
        }
        translate([0, 0, 0.8*altura]) {
            cylinder(h = 0.2*altura, r = max_raio);
        }
    }
}

// rotate([180,0,0])
// translate([0, 0, -altura])
// copo_cima();

translate([100, 0, 0])
copo_baixo();

