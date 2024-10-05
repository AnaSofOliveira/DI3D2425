$fn=20;


module tear(scale_factor) { 
    scale([scale_factor, scale_factor, scale_factor*.8]){
    union(){
        sphere(r=5);
        translate([0,0,10]);
        cylinder(h=50, r1=5, r2=0);
    }
    }
}


for (angle = [0: 20: 360]){
        echo(str("angle = ", angle));
        random= floor(rands(0, 15, 1)[0]);
        echo(str("random = ", random));
        rotate([0,0,angle]){
             translate([30,0,10]){
                r = rands(0.1, 0.5, 1)[0];
                echo(str("R = ", r));
                    tear(scale_factor=r);                   
             }
        }   
}