// Alterar número de fragmentos
//$fn = 32; 
// Se estiver no modo preview mostra com 32 fragmentos. Se quiser compilar usa 64 fragmentos
$fn = $preview ? 32 : 64;
//sphere(10);

// simbolo % coloca o objeto transparente e não vai para a impressão
// simbolo # coloca o objeto transparente, mas vai para a impressão
// simbolo ! apenas mostra o objeto destacado com o ponto de exclamação

//%cube([20, 20, 20], center = true);

//cylinder(h=100, r=5, center = true);

//difference(){
//    sphere(10);
//    cylinder(h=100, r=5, center = true);
//}

//intersection(){
//    sphere(10);
//    cylinder(h=100, r=5, center = true);
//}

// Criar função

module teste(){
    difference(){
        sphere(10);
        cylinder(h=100, r=5, center = true);
    }
}

//rotate([0, 45, 60])
//translate([0,0,20])
//teste();

//cube([20, 20, 20], center = true);

// A rotação e translação acima não se aplicam ao cubo acima. Para fazer isso é preciso colocar as {}

//rotate([0, 45, 60])
//translate([0,0,20]) {
//    teste();
//    %cube([20, 20, 20], center = true);
//}


// rever parametros do rotate e translate

n = 10;
module teste2(){
for(i=[0, n]){
    translate([i*20, 0, 0])
    rotate([0, i*360/n, 0])
    teste();
}
}

module teste3(){
r = 2.5;
minkowski(){
    cube([30-2*r, 30-2*r, 5-r], center = true); 
    //sphere(r);
    cylinder(h=r, r = r, center = true);
}
}


module teste4(){
    difference(){
        sphere(10);
        cylinder(h=100, r=5, center = true);
        
        rotate([0, 90, 0])
        cylinder(h=100, r=5, center = true);
    }
}
//teste4();


//minkowski(){
//    teste4();
//    sphere(1);
//}


hull(){
    sphere(5);
    translate([10, 0, 0])
    sphere(5);
}





















































