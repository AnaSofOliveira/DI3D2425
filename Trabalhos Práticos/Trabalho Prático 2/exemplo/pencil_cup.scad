$fn = 32;

h = 80;
d = 60;

np = 18;
dp = 2;

b = 5;
n = 9;

//images unicodes
emojys = ["\u2660","\u2663","\u2665","\u2666"];

module pyramids(d, r, n){
    for(i=[0:n]){
        t = 360*i/n;
        translate([(r-1)*cos(t), (r-1)*sin(t), 0]) 
            rotate([0, 90, t])
                sphere(1.8, $fn = 16);
    }
};

module smilies(r, n, offs, array, size=12, seed = 12){
    // random=rands(0,3,n,seed); // alternative
    for(i=[0:n]){
        t = (360*i/n)+offs;
        translate([(r-1.5)*cos(t), (r-1.5)*sin(t), 0])  
            rotate([90, 0, t+90]) 
                linear_extrude(1) text(emojys[i%4], size, halign="center",spacing=1);
    }
};

translate([0, 0, 0]) cylinder(h=h+(b*2), r=(d/2)-1,$fn=256); // base

translate([0, 0, b]) linear_extrude(height = h, center = false, convexity = 0, twist = 70, , $fn=16)
circle(r=30, $fn=9); //forms

translate([0, 0, dp+0.5]) pyramids(dp, d/2, np); //down pyramids rotate([90, 0, 0])
translate([0, 0, h+(b*2)-(dp+0.5)]) pyramids(dp, d/2, np);//top pyramids


translate([0, 0, (h/2)+b-(12/2.5)]) smilies(d/2, n, 25, emojys); // semiles middle
translate([0, 0, (h/4)+b-(12/2.5)]) smilies(d/2, n, 3, emojys); // semiles down 
translate([0, 0, ((h*3)/4)+b-(12/2.5)]) smilies(d/2, n, 8, emojys); // semiles top

translate([0, 0, (h/15)+b-(12/2.5)]) smilies(d/2, n, 20, emojys, 8); // mini semiles down
translate([0, 0, (h-2)+b-(12/2.5)]) smilies(d/2, n, -10, emojys, 8); // mini semiles top

