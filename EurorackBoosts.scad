use <components/jack_35mm.scad>
use <components/led_3mm.scad>
use <components/pot_alpha_16mm.scad>
use <components/mounting_tab.scad>

$fn=100; 
hp = 4;

EURORACK_H = 128.5;
EURORACK_W = 5.08;
THICKNESS = 2; // thickness

w = hp * EURORACK_W;


module main(){
    cube([w, EURORACK_H, THICKNESS]);
    translate([11, 1.4, -0.8]) cube([w-11, 3.2, 0.8]);
    translate([11, EURORACK_H-4.6, -0.8]) cube([w-11, 3.2, 0.8]);
    
    // rib
    rib_height = 6;
    rib_margin = 13;
    rib_thickness = 5;
    translate([0, rib_margin,-rib_height])
        cube([rib_thickness, EURORACK_H-rib_margin*2, rib_height]);
    // --- 

    translate([0, rib_margin, -1.6])
        cube([w, EURORACK_H-rib_margin*2, 1.6]);
    
    rotate([180, 0, 0])
        translate([0, -64, 0])
        mounting_tab();
}

module eurorack_mult(){
    
    center = EURORACK_W * 2;
    
    difference() {
        
        union(){
            main();
        }
        
        union(){
            // mounting holes
            translate([7.5, 3, 0]) cylinder(r=1.6, h=10, center=true);
            translate([7.5, EURORACK_H-3, 0]) cylinder(r=1.6, h=10, center=true);
            // ---
            
            translate([1, 118, 1.6]) {
                rotate([0, 0, 0]) {
                    linear_extrude(height=1) {
                        text("BOOSTS",
                             font="Liberation Sans",
                             size=3.2);
                    }
                }
            }
            
            translate([2, 93, 1.6]) {
                rotate([0, 0, 0]) {
                    linear_extrude(height=1) {
                        text("1",
                             font="Liberation Sans",
                             size=4);
                    }
                }
            }
            
            
            translate([2, 66, 1.6]) {
                rotate([0, 0, 0]) {
                    linear_extrude(height=1) {
                        text("2",
                             font="Liberation Sans",
                             size=4);
                    }
                }
            }
            
            translate([center, 105]) pot_alpha_16mm(); 
            translate([center, 78]) pot_alpha_16mm(); 
           
            translate([center, 52]) led_3mm();
            
            translate([1.5, 43, 1.6]) {
                rotate([0, 0, 0]) {
                    linear_extrude(height=1) {
                        text("IN1",
                             font="Liberation Sans",
                             size=2.6);
                    }
                }
            }
            
            translate([10.2, 43, 1.6]) {
                rotate([0, 0, 0]) {
                    linear_extrude(height=1) {
                        text("OUT1",
                             font="Liberation Sans",
                             size=2.6);
                    }
                }
            }
            
            translate([center, 37]){
                translate([-4.5, 0, 0]) jack_35mm(); 
                translate([4.5, 0, 0]) jack_35mm();}
            
            translate([1.5, 26, 1.6]) {
                rotate([0, 0, 0]) {
                    linear_extrude(height=1) {
                        text("IN2",
                             font="Liberation Sans",
                             size=2.6);
                    }
                }
            }
            
            translate([10.2, 26, 1.6]) {
                rotate([0, 0, 0]) {
                    linear_extrude(height=1) {
                        text("OUT2",
                             font="Liberation Sans",
                             size=2.4);
                    }
                }
            }
            
            translate([center, 20]){
                translate([-4.5, 0, 0]) jack_35mm(); 
                translate([4.5, 0, 0]) jack_35mm();}
            
            //logo(18, 16, 1.4);
        }
    }
}

translate([w, 0, 2]) rotate([0, 180, 0])  eurorack_mult();
