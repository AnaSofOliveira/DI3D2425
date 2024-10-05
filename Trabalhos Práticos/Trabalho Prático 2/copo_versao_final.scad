
altura = 70;
raio = 27;


module anel(){
    rotate_extrude(angle=360)
    translate([raio, 0, 0]) 
    circle(r = 2, $fn=100);
}

module barras_padrao_inferior(direcao=1, step_rotacao=10){
    // Direcao = 1 -> Esquerda
    // Direcao = 0 -> Direita

    for (angle = [0:step_rotacao:360]) {
            rotate([0, 0, angle]) {
                rotacao = (direcao) ? 1 : -1;
                echo(str("Rotacao = ", rotacao));
                linear_extrude(height = 0.4*altura, convexity = 10, twist = rotacao*20)
                translate([raio, 0, 2])
                circle(r = 2);
            }   
        }
}

module barras_verticais(){
    translate([raio,0,0.4*altura])
    cylinder(h = 0.6*altura+1, r = 2);
}

module copo(){
    union(){
        union(){
            difference(){
                cylinder(h = altura, r = raio);
                
                for (angle = [0:10:360]) {
                    rotate([0, 0, angle]) {
                        barras_verticais();
                    }
                }
            }

            translate([0, 0, 0.4*altura]) 
            anel(); 
        }

        barras_padrao_inferior(direcao = 1, step_rotacao = 10);
        barras_padrao_inferior(direcao = 0, step_rotacao = 10);

        translate([0, 0, 0])
        anel();
    }
}


copo();