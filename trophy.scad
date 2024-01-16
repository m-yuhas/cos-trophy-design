$fn = 100;
$vpr = [80, 0, 50 + 360 * $t];

eps = 1e-3;
logo_path = "ntu_logo.png";

module inset(length, width) {
    rotate([90, 0, 0]) cylinder(h = length, r1 = width, r2 = width, center=false, $fn=100);
}

module ntu_bug(width, depth, logo) {
  resize([width, 0, depth], auto = true) surface(file = logo, center = true, invert = false);  
}

module backplate() {
  difference() {
      
    // Plate
    linear_extrude(height = 1) polygon(points = [ [-7, -20], [7, -20], [12, 0], [12, 12], [7, 17], [-7, 17], [-12, 12], [-12, 0] ]);
      
    // Side decorations
    for(y = [10:-2.5:2.5]) {
      translate([-12 - eps, y, 1]) rotate([0, 0, 90]) inset(length = 1 + eps, width = 0.5);
      translate([12 + eps, y, 1]) rotate([0, 0, -90]) inset(length = 1 + eps, width = 0.5);
    }
    
    // Top decorations
    for(x = [-5:2.5:5]) {
      translate([x, 17 + eps, 1]) inset(length = 1 + eps, width = 0.5);
    }
    
    // Top diagonal decorations
    translate([-9.5, 14.5 + eps, 1]) rotate([0, 0, 45]) inset(length = 5 + eps, width = 0.5);
    translate([9.5, 14.5 + eps, 1]) rotate([0, 0, -45]) inset(length = 5 + eps, width = 0.5);
    translate([-9.5, 17.5, 1]) rotate([0, 0, 45]) inset(length = 5 + eps, width = 0.5);
    translate([9.5, 17.5, 1]) rotate([0, 0, -45]) inset(length = 5 + eps, width = 0.5);
    translate([-12.5, 14.5, 1]) rotate([0, 0, 45]) inset(length = 5 + eps, width = 0.5);
    translate([12.5, 14.5, 1]) rotate([0, 0, -45]) inset(length = 5 + eps, width = 0.5);
    
    // Bottom decorations
    y = [for(i = [-1:-2.5:-8.5]) i];
    yaw = [for(i = [75:-15:30]) i];
    for(i = [0:3]) {
      translate([-6, y[i], 1]) rotate([0, 0, -yaw[0]]) inset(length = 6, width = 0.5);
      translate([6, y[i], 1]) rotate([0, 0, yaw[0]]) inset(length = 6, width = 0.5);
    }
  }
}

module middleplate() {
  difference() {
      
    // Plate
    linear_extrude(height = 2) polygon(points = [ [-6, -20], [6, -20], [11,0], [11, 11], [6, 16], [-6, 16], [-11, 11], [-11, 0] ]);
      
    // Side decorations
    for (y = [8.75:-1.5:1.25]) {
      translate([-11 - eps, y, 2]) rotate([0, 0, 90]) inset(length = 1 + eps, width = 0.5);
      translate([11 + eps, y, 2]) rotate([0, 0, -90]) inset(length = 1 + eps, width = 0.5);
    } 

    // Top decorations
    for (x = [-3.75:1.5:3.75]) {
      translate([x, 16 + eps, 2]) inset(length = 1, width = 0.5);
    }

    // Top diagonal decorations
    for (i = [0, 2]) {
      translate([-7.5 - i, 14.5 - i + eps, 2]) rotate([0, 0, 45]) inset(length = 1.5 + eps, width = 0.5);
      translate([7.5 + i, 14.5 - i + eps, 2]) rotate([0, 0, -45]) inset(length = 1.5 + eps, width = 0.5);
    }
    
    // Bottom decorations
    y = [0, -1.75, -4, -6.5, -9.5];
    yaw = [for(i = [75:-15:15]) i];
    for (i = [0:4]) {
      translate([-6, y[i], 2]) rotate([0, 0, -yaw[i]]) inset(length = 7, width = 0.5);
      translate([6, y[i], 2]) rotate([0, 0, yaw[i]]) inset(length = 7, width = 0.5);
    }
  }
}

module topplate() {
  difference() {
      
    // Plate
    linear_extrude(height = 3 + eps) polygon(points = [ [-5, -20], [5, -20], [10, 0], [10, 10], [5, 15], [-5, 15], [-10, 10], [-10, 0] ]);
      
    // Side decorations
    for (y = [2.5:2.5:7.5]) {
      translate([-10.5, y, 3]) rotate([0, 0, 90]) inset(length = 3, width = 0.5);
      translate([10.5, y, 3]) rotate([0, 0, -90]) inset(length = 3, width = 0.5);
    }

    // Top decorations
    for (x = [-2.5:2.5:2.5]) {
      translate([x, 15 + eps, 3]) inset(length = 4, width = 0.5);
    }
    
    // Top diagonal decorations
    translate([-7.5, 12.5 + eps, 3]) rotate([0, 0, 45]) inset(length = 2.5 + eps, width = 0.5);
    translate([7.5, 12.5 + eps, 3]) rotate([0, 0, -45]) inset(length = 2.5 + eps, width = 0.5);
    
    // Bottom decorations
    y = [-1, -3.5, -6, -8.5, -11.5];
    yaw = [for(i = [75:-15:15]) i];
    for (i = [0:4]) {
      translate([-6, y[i], 3]) rotate([0, 0, -yaw[i]]) inset(length = 4, width = 0.5);
      translate([6, y[i], 3]) rotate([0, 0, yaw[i]]) inset(length = 4, width = 0.5);
    }
  }
}

module face() {
  difference() {
      
    // Plate
    translate([0, 0, 3]) linear_extrude(height = 2 + eps) polygon(points = [ [ -5, -2.5], [5, -2.5], [7.5, 10], [-7.5, 10] ]);
      
    // Eyes
    for (side = [-1, 1]) {
      translate([side * 6, 7.5, 5]) rotate([0, 0, side * -90]) inset(length = 3, width = 0.5);
      translate([side * (3 + eps), 6.5, 4]) rotate([0, 0, 90]) rotate_extrude(angle = side * 45) translate([1, 1, 0]) circle(0.5);
    }

  }   
}

module snout(length = 3) {
  translate([0, 0, 5]) union() {
    
    // Nose
    translate([0, 5, length])  linear_extrude(height = 1 + eps, twist = 0, slices = 20, scale = 0) polygon(points = [ [-3, 0], [3, 0], [0, -3]]);
      
    // Mouth
    difference() {
      hull() {
        translate([0, 0, 0]) linear_extrude(height = eps) polygon(points = [ [-5, -2.5], [5, -2.5], [5/(12.5/2.5) + 5, 6], [-5-5/(12.5/2.5), 6] ]);
        translate([0, 0, length]) linear_extrude(height = eps) polygon(points = [ [-3, -1.5], [3, -1.5], [4/(12.5/2.5) + 4, 5], [-4-5/(12.5/2.5), 5] ]);
      }
      translate([0, 2, length]) inset(length = 2, width = 0.5);
      translate([0, 0, length]) rotate([0, 0, 60]) inset(length = 5, width = 0.5);
      translate([0, 0, length]) rotate([0, 0, -60]) inset(length = 5, width = 0.5);
    }
  }
}

module base() {
  union() {
    cylinder(h = 1 + eps, r1 = 5, r2 = 5, center = false);
    cylinder(h = 2 + eps, r1 = 4.5, r2 = 4.5, center = false);
    cylinder(h = 3 + eps, r1 = 3.5, r2 = 3.5, center = false);
  }
}

module head(total_depth = 5, engraving_depth = 0.5) {
  difference() {
    resize([10, 0, total_depth], auto = true) union() {
      backplate();
      middleplate();
      topplate();
      face();
      snout();
    }
    translate([0, -4, total_depth * 3 / 8 - engraving_depth]) ntu_bug(width = 3, depth = engraving_depth, logo = logo_path);
  }
}

module trophy() {
  color("lightcyan", 0.5) union() {
      base();
      translate([0, 5 * 1.5 / 8, 10]) rotate([90, 0, 0]) head();
  }
}

trophy();