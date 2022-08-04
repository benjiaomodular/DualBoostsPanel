$fn=100; 

module mounting_tab(){
    
    thickness=6;
    height=27;
    width=17;
    
    difference(){
        union(){
            cube([thickness, width, height]);
            
            translate([thickness, 0, 0]){
                difference(){
                    cube([6, width, 6]);
                    rotate([90, 0, 0])
                        translate([6, 6, -8.5])
                            cylinder(r=6, h=17, center=true);
                }
            }
        }
        
        union(){
            rotate([0, 90, 0]){
                translate([-22, 8.5, thickness/2]){
                    cylinder(r=1.5, h=thickness, center=true);
                    translate([0, 0, -1.5]) {
                        cylinder(r=3, h=3, center=true);
                    }
                }
            }
            
            translate([thickness-1.5, 0, height-10])
            cube([1.5, width, 10]);
        }
    }
}

mounting_tab();