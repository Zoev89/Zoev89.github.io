GrootGatDia = 8.1;
BagageDragerStang = 12;
DragerBuis =60;
KettingenAfstand = 13;
KettingGeleider=16;
RuimteTussenFrameEnKetting=8;

$fn = 100;
Afstand = 30;
PlaatDikte = 6;

AchterBoutDia = 20;
AchterAfstandBagage = 17;
AchterAfstandStang = 8;
AchterHouderH = 20;

BeugelD=5; // eigenlijk is het materiaal 6
BeugelB=18;
BeugelBout = 4.1;

module AchterBout()
{
    difference()
    {
        cylinder(d=AchterBoutDia,h=Afstand);
        translate([0,0,-1])cylinder(d=GrootGatDia,h=Afstand+2);
        translate([-AchterBoutDia,AchterAfstandBagage,-0.1]) cube([2*AchterBoutDia,2*AchterBoutDia,AchterHouderH]);
        translate([0,AchterAfstandStang+BagageDragerStang/2,-0.1]) cylinder(d=BagageDragerStang,h=Afstand);
    }
    
}

module VoorBout()
{
    difference()
    {
        cylinder(d=AchterBoutDia,h=Afstand);
        translate([0,0,-1]) cylinder(d=GrootGatDia,h=Afstand+2);
        
        translate([-Afstand/2,KettingGeleider/2+KettingenAfstand/2,KettingGeleider/2+RuimteTussenFrameEnKetting])rotate([0,90,0])cylinder(d=KettingGeleider,h=Afstand);
        translate([-Afstand/2,-KettingGeleider/2-KettingenAfstand/2,KettingGeleider/2+RuimteTussenFrameEnKetting])rotate([0,90,0])cylinder(d=KettingGeleider,h=Afstand);
        
    }
}

module Beugel(hoogte)
{
    difference()
    {
    cube([BeugelBout*4,BeugelBout*8+BeugelB,hoogte]);
        translate([2*BeugelBout,2*BeugelBout,-1])cylinder(d=BeugelBout,h=hoogte+2);
        translate([2*BeugelBout,6*BeugelBout+BeugelB,-1])cylinder(d=BeugelBout,h=hoogte+2);
        translate([-1,4*BeugelBout,Afstand])cube([BeugelBout*4+2,BeugelB,BeugelD+1]);
    }
}

translate([40,0,0])AchterBout();
translate([-40,0,0])VoorBout();
translate([0,10,0])Beugel(Afstand+BeugelD);
translate([0,-60,0]) Beugel(BeugelBout);
