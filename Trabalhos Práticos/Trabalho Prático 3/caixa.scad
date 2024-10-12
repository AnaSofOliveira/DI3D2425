raio_roda = 5;
altura_pega_roda = 5;

difference(){
        cylinder(h=2, r=raio_roda, center = true);
    translate([0,0,1]){
        cylinder(h=3, r=4, center = true);
    } 
}

translate([raio_roda - 0.5, 0, 0]){
    cylinder(h=altura_pega_roda, r=0.5, $fn=50);
}