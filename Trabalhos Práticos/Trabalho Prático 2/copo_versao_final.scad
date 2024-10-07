
altura = 70;
raio = 27;
altura_base_copo = 0.5*altura;


module anel(){
    rotate_extrude(angle=360, $fn=100)
    translate([raio, 0, 0]) 
    circle(r = 2.5, $fn=100);
}

module barras_padrao_inferior(direcao=1, step_rotacao=10){
    // Direcao = 1 -> Esquerda
    // Direcao = 0 -> Direita

    for (angle = [0:step_rotacao:360]) {
            rotate([0, 0, angle]) {
                rotacao = (direcao) ? 1 : -1;
                echo(str("Rotacao = ", rotacao));
                linear_extrude(height = altura_base_copo, convexity = 10, twist = rotacao*20)
                translate([raio, 0, 2])
                circle(r = 2);
            }   
        }
}

module barras_verticais(){
    translate([raio,0,altura_base_copo])
    cylinder(h = altura-altura_base_copo, r = 1, $fn=20);
}

module copo(){
    union(){
        union(){
            union(){
                cylinder(h = altura, r = raio);
                
                for (angle = [0:4:360]) {
                    rotate([0, 0, angle]) {
                        barras_verticais();
                    }
                }
            }

            translate([0, 0, altura_base_copo]) 
            anel(); 
        }

        barras_padrao_inferior(direcao = 1, step_rotacao = 10);
        barras_padrao_inferior(direcao = 0, step_rotacao = 10);

        translate([0, 0, 2])
        anel();
    }
}

module base(){
    translate([0, 0, 0])
    cube([2.5*raio, 2.5*raio, 2], center = true);
}

difference(){
    copo();
    base();
}