include <NopSCADlib/utils/horiholes.scad>

%translate([5,100,-20]){
    rotate([90,0,0])
    import("cncArduinoShield.stl");
}


module parafusoFemea(){
    altura = 7;
    raio_externo = 3;
    raio_interno = 1.5;
    lados = 10;
    shrink = cos(180/lados);
    diametro_interno = (raio_interno*2);

    difference(){
        cylinder(h=altura, r=raio_externo);
        translate([0,0,2])
        cylinder(h=altura, r = (diametro_interno/2)/shrink, $fn= lados);
    }    
}

module caixa(){
    union(){
        difference(){
            difference(){
                // Caixa exterior
                cube([95, 75, 60]);

                // Cubo interior
                translate([5,5,5])
                cube([85, 65, 60]);
                
                // Painel direito (Vista frente USB)
                translate([5,-1,5])
                cube([85, 7, 40]);
                
                // Painel esquerdo (Vista frente USB)
                translate([5,69,5])
                cube([85, 7, 40]);
                
                // Ranhura
                translate([3, 3, 57])
                rotate([-90, 0, 0]){
                    cube([100, 7, 69]);
                }
            }
            
            // Porta USB
            translate([-9, 42, 9])
            cube([16, 13, 13]);

            // Porta corrente Arduino
            translate([-7, 15, 9])
            cube([13, 11, 13]);

            // Ventoinha
            translate([85, 35, 25]) {
                rotate([0, 90, 0])
                cylinder(h=15, r=20);
            }
        }

        difference(){
            cube([95, 1, 50]);
            for (i = [0: 2: 45]) {
                for (j = [0: 2: 26]) {
                    translate([i * 2, -1, j * 2])
                    cube([3, 3, 3]);
                }
            }
        }

        translate([0, 74, 0])
        difference(){
            #cube([95, 1, 50]);
            for (i = [0: 2: 45]) {
                for (j = [0: 2: 26]) {
                    translate([i * 2, -1, j * 2])
                    cube([3, 3, 3]);
                }
            }
        }

        // Parafuso Arduino Frente-Direita
        translate([22, 15, 0])
        parafusoFemea();

        // Parafuso Arduino Frente-Esquerda
        translate([23, 63, 0])
        parafusoFemea();

        // Parafuso Arduino Trás-Direita
        translate([74, 20, 0])
        parafusoFemea();

        // Parafuso Arduino Trás-Esquerda
        translate([74, 48, 0])
        parafusoFemea();

                
        // Parafuso Ventoinha Baixo-Direita
        translate([90, 15, 5]){
            rotate([0,90,0]){
                parafusoFemea();
            }
        }

        // Parafuso Ventoinha Topo-Direita
        translate([90, 15, 45]){
            rotate([0,90,0]){
                parafusoFemea();
            }
        }

        // Parafuso Ventoinha Baixo-Esquerda
        translate([90, 55, 5]){
            rotate([0,90,0]){
                parafusoFemea();
            }
        }

        // Parafuso Ventoinha Topo-Esquerda
        translate([90, 55, 45]){
            rotate([0,90,0]){
                parafusoFemea();
            }
        }

    }
}


module tampa(){
    translate([100, 4, 50])
    union(){
        difference(){
            cube([90, 65, 5]);

            translate([5, 5, -1])
            cube([80, 55, 7]);
        }

        for (i = [0: 5: 80]){
            translate([i, 0, 2]) {
                cube([1, 60, 2]);
            }
        }

        for (i = [0: 5: 60]){
            translate([90, i, 2]) {
                rotate([0, 0, 90])
                cube([1, 90, 2]);
            }
        }
    
    }
}

caixa();
tampa(); 

