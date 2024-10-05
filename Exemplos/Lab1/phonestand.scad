// Author: Tiago Charters de Azevedo 
// Maintainer: Tiago Charters de Azevedo 
// Copyright (c) - 2023 Tiago Charters de Azevedo (tca@nextp.pt)
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 3, or (at your option)
// any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 51 Franklin Street, Fifth Floor,
// Boston, MA 02110-1301, USA.

////////////////////////////////////////////////////////////

phi=1.618;
b=20;
h=10*phi;
rc=.1*h;


////////////////////////////////////////////////////////////
//cellphone dimensions (mm)
////////////////////////////////////////////////////////////
l=160;
c=2*50;
d=40;
hc=10;
theta=20; //tilt angle
a=l/2*cos(theta);

module phonestand(){
    difference(){
	minkowski(){
	    cube([a-2*rc,b-2*rc,h-2*rc],center=true);
	    sphere(rc,$fn=64);}
	// cellphone
	translate([a/2*cos(theta)-2*rc-hc/2,0,0])
	rotate([0,-theta,0])
	hull(){
	    translate([0,0,l])
	    rotate([90,0,0])	cylinder(h=50,r=hc/2,center=true);
	    rotate([90,0,0])	cylinder(h=50,r=hc/2,center=true);}

	translate([0,0,-h+rc*(1-sqrt(2)/2)])
	cube([a+1,a,h],center=true);

	translate([-b/2,0,0*h/2])
	minkowski(){
	    cube([a/1.707-2*rc,b/2-2*rc,10*h-2*rc],center=true);
	    sphere(rc,$fn=64);}
    }
}

phonestand();



