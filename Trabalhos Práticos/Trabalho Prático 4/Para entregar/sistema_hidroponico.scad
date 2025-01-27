$fn=100;
altura_base = 100;
largura_base = 100;
profundidade_base = 100;
paredes_base = 10;

tolerancia = 2;

altura_tubo_tampa = 50;
altura_tubo_principal = 150;

raio_exterior_tubo = 20;
grossura_paredes_tubo = 5;

raio_tubo_plantas = 20;
comprimento_tubo_plantas = 100;
paredes_tubo_plantas = 5;


// Caixa (base)
module caixa(){
    difference(){
        minkowski(){
            cube([largura_base, profundidade_base, altura_base], center=true);
            sphere(r=1);
        }
        translate([0, 0, 10]){
            cube([largura_base-2*paredes_base+tolerancia, profundidade_base-2*paredes_base+tolerancia, altura_base], center=true);
        }
    }
}

// Tampa
module tampa(){
    union(){
        // Tampa com máscara aplicada
        difference(){
            minkowski() {
                cube([largura_base+2*paredes_base, profundidade_base+2*paredes_base, 20], center=true);
                sphere(r=1);
            }
            #cylinder(altura_tubo_tampa, (raio_exterior_tubo-grossura_paredes_tubo)*2+0.5, (raio_exterior_tubo-grossura_paredes_tubo)*2+0.5);
            translate([0, 0, -10]){
                cube([largura_base + tolerancia+1, profundidade_base + tolerancia+1, 30], center=true);
            }
        }

        // Tubo
        %translate([0,0,5]){
            union(){
                difference(){
                    cylinder(altura_tubo_tampa, raio_exterior_tubo*2, raio_exterior_tubo*2);
                    translate([0,0,-5]){
                        cylinder(altura_tubo_tampa+10, raio_exterior_tubo*2-grossura_paredes_tubo, raio_exterior_tubo*2-grossura_paredes_tubo);
                    }
                }
                difference(){
                    cylinder(altura_tubo_tampa-10, raio_exterior_tubo*2-grossura_paredes_tubo, raio_exterior_tubo*2-grossura_paredes_tubo);
                    translate([0,0,-5]){
                        cylinder(altura_tubo_tampa+10, raio_exterior_tubo*2-grossura_paredes_tubo*2, raio_exterior_tubo*2-grossura_paredes_tubo*2);
                    }
                }
            }
        }
    }
}

module tuboPrincipal(){
    translate([0,0,5]){
        difference(){
            union(){
                difference(){
                    cylinder(altura_tubo_principal, raio_exterior_tubo*2, raio_exterior_tubo*2);
                    translate([0,0,-5]){
                        cylinder(altura_tubo_principal+10, raio_exterior_tubo*2-grossura_paredes_tubo-tolerancia, raio_exterior_tubo*2-grossura_paredes_tubo-tolerancia);
                    }
                }
                translate([0,0,-grossura_paredes_tubo]){
                    difference(){
                        union(){
                            cylinder(altura_tubo_principal, raio_exterior_tubo*2-grossura_paredes_tubo-tolerancia, raio_exterior_tubo*2-grossura_paredes_tubo-tolerancia);

                            // Horifício superior
                            translate([0,-raio_tubo_plantas+5,60]){            
                                rotate([40, 0, 0]){
                                    cylinder(r=raio_tubo_plantas, h=comprimento_tubo_plantas);
                                }
                            }

                            // Horifício inferior
                            translate([0,raio_tubo_plantas-5,20]){
                                rotate([-40, 0, 0]){
                                    cylinder(r=raio_tubo_plantas, h=comprimento_tubo_plantas);
                                }
                            }
                            
                        }

                        translate([0,0,-5]){
                            cylinder(altura_tubo_principal+20, raio_exterior_tubo*2-grossura_paredes_tubo*2-tolerancia, raio_exterior_tubo*2-grossura_paredes_tubo*2-tolerancia);
                        }
                    }
                }                
            }

            // Horifício superior
            translate([0,-raio_tubo_plantas+5,55]){
                rotate([40, 0, 0]){
                    cylinder(r=raio_tubo_plantas-paredes_tubo_plantas, h=comprimento_tubo_plantas+10);
                }
            }

            // Horifício inferior
            translate([0,raio_tubo_plantas-5,15]){
                rotate([-40, 0, 0]){
                    cylinder(r=raio_tubo_plantas-paredes_tubo_plantas, h=comprimento_tubo_plantas+10);
                }
            }

        }
    }
}


// translate([0,0,50]){    
//     %caixa();
// }

translate([0, 0, 150]){
    tampa();
}

// translate([0, 0, 300]){
//     tuboPrincipal();   
// }


