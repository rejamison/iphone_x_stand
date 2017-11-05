$fn = 100;

// dimensions include some extra margin to account for print accuracy
iphone_length = 144.1;
iphone_width = 71.1;
iphone_depth = 8.1;
qi_diam = 50.1;

iphone_stand();
watch_stand();

module watch_stand() {
    translate([-41-20,0,70]) rotate([20,0,0]) translate([0,-38.1,0]) rotate([0,90,0]) difference() {
        union() {
            translate([-20,0,-20]) cylinder(h=40, d=40);
            translate([-20,-20,-20]) cube([40,40,40]);
            translate([20,0,-20]) cylinder(h=40, d=40);
        }
        
        rotate([-90,0,0]) translate([0,0,20-11.3]) cylinder(h=11.5,d=33.5);
        rotate([-90,0,0]) translate([-15,-5,-50]) cube([30,10,100]);
        rotate([-90,0,0]) translate([-28,-2.5,-50]) cube([30,5,68]);
        w = sqrt((37 * 37) / 2);
        translate([40,0,0]) rotate([-90,45,0]) translate([-w/2,-w/2,-20]) cube([w,w,40]);
    }
    
    difference() {
        translate([-41,0,17]) rotate([110,0,0]) {
            translate([-40,-22,-6]) cube([40,20,46]);
            translate([-40,-20, 0]) cube([3,60,40]);
            translate([-1.5,-20, 0]) cube([1.5,60,40]);
        }
        translate([-100,-100,-100]) cube([200,200,100]);
        groove_size = 1;
        for(i=[-100:10:100]) {
            translate([-100,i - 3,0]) rotate([0,90,0]) rotate([0,0,45]) translate([-groove_size/2,-groove_size/2,0]) cube([groove_size,groove_size,200]);
        }
    }
}



module iphone_stand() {
    difference() {
        translate([0,0,17]) rotate([110,0,0]) difference() {
            union() {
                translate([-41,-20,0]) cube([82,120,8]);
                translate([-41,-22,-6]) cube([82,20,15]);
                translate([-41,-20,0]) cube([82,25,60]);
                
                // add some pegs to hold the qi PCB in place
                translate([-(32.5/2),5,20]) {
                    translate([0,0,-2.5]) cube([3,3,2.5]);
                    translate([12,0,-2.5]) cube([20.5,3,2.5]);
                    translate([10.05,0,29.6]) cube([2.4,3,2.5]);
                    translate([32.55-8-2.5,0,29.6]) cube([2.4,3,2.5]);
                }
            }
            iphone_x();
            
            // cut some slots for the speakers
            for(delta=[0:2.5:15]) {
                translate([-10.5 - 1 - delta,-4,-6]) rotate([0,90,0]) rotate_extrude(angle=90) translate([5,0,0]) square([4,1]);
                translate([10.5 + delta,-4,-6]) rotate([0,90,0]) rotate_extrude(angle=90) translate([5,0,0]) square([4,1]);
            }
            
            // cut an indentation for the qi coil
            translate([0,(iphone_length - iphone_depth)/2,6]) cylinder(h=20, d=50);
            translate([-8,(iphone_length - iphone_depth)/2 - 23.7,6]) rotate([-10,0,0]) translate([0,-20,0]) cube([16,20,20]);
        }
        translate([-100,-100,-100]) cube([200,200,100]);
        groove_size = 1;
        for(i=[-100:10:100]) {
            translate([-100,i - 3,0]) rotate([0,90,0]) rotate([0,0,45]) translate([-groove_size/2,-groove_size/2,0]) cube([groove_size,groove_size,200]);
        }
    }
}

module iphone_x() {
    color("gray") hull() {
        translate([-(iphone_width - iphone_depth)/2,0,0]) rotate_extrude() translate([4,0,0]) circle(d=8);
        translate([(iphone_width - iphone_depth)/2,0,0]) rotate_extrude() translate([4,0,0]) circle(d=8);
        translate([-(iphone_width - iphone_depth)/2,iphone_length - iphone_depth,0]) rotate_extrude() translate([4,0,0]) circle(d=8);
        translate([(iphone_width - iphone_depth)/2,iphone_length - iphone_depth,0]) rotate_extrude() translate([4,0,0]) circle(d=8);
    }
}
