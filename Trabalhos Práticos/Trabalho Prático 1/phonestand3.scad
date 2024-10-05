module base(){
    alturaBase = 10;
    larguraBase = 65;
    comprimentoBase = 125;

    union(){
        translate([-comprimentoBase/2, 0, 0])
        cube([comprimentoBase, larguraBase,10], center=true);

        cylinder(10, r=larguraBase/2, center=true);
    }
}




//translate([0,0,100])
//rotate([90,0,0])




module cabeca(){
    // Cabeça
    cylinder(h=5,r=15, center = true);
}

module tronco(){
    // Pescoço
    translate([15,0, 0]) //raio do circulo
    cube([15, 10, 5], center = true);

    // Tronco
    translate([15+20+3, 0, 0])
    cube([40, 30, 5], center=true);
}

module bracos(){
    //Braço direito
    translate([22,15,0])
    rotate([0,0,20])
    cube([7, 35, 5], center = true);

    //Mão direita
    translate([14, 30, 0])
    cube([10,7,5], center = true);

    //Braço esquerdo
    translate([20,-20,0])
    rotate([0,0,80])
    cube([30,7,5], center=true);

    //Mão esquerda
    translate([17,-35,0])
    rotate([0,0,80])
    cylinder(h=5,r=5, center=true);
    //cube([10,10,5], center=true);
}

module pernas (){
    //Perna direita
    translate([60,15,0])
    rotate([0,0,50])
    cube([25,10,5], center = true);

    // Joelho direito
    translate([73,28.15,0])
    rotate([0,0,37])
    cube([15,10,5], center = true);

    //Pé direito
    translate([83.5,31.65,0])
    cube([15,10,5], center = true);

    //Perna esquerda
    translate([60,-15,0])
    rotate([0,0,-40])
    cube([80,10,5], center = true);
}

module boneco(){
    minkowski(){
        union(){
            cabeca();
            tronco(); 
            bracos();
            pernas();
        }
        sphere(2);
    }
}

module OnePlus5(){
    width = 154.2;
    depth = 74.1;
    height = 7.25;

    margin = 10;
    rotate([0,70,0])
    translate([-width,-depth/2,-margin/2])
    minkowski(){
        //cube([width,depth,height], center)
        cube([width,depth,height]);
        sphere(2);
    }
}


module telefoneBaixo(){
    translate([-5,0,5])
    rotate([90, 0, 0])
    cylinder(h = 75, r=7, center = true);
}

module telefoneCima(){
    translate([-55,0,145])
    rotate([90, 0, 0])
    cylinder(h = 75, r=7, center = true);
}

module telefone(){
    hull(){
        telefoneBaixo();
        telefoneCima();
    }
}


module baseComBoneco(){
    difference(){
        union(){
            base();
            translate([-70,0,92])
            rotate([0,90,-90])
            boneco();
        }
        telefone();
    }
}





minkowski(){
    baseComBoneco();
    sphere(2);
}













