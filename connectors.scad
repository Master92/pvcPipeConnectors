$fn = $preview ? 32 : 64;

// Set this to the inner diameter of your PVC pipe
connectorDiameter = 18.3;
// How long shall the connector protrude into your pipe
connectorLength = 20;
// which object is to be generated
generate = "none"; // [none, elbow, threeWay, threeWayUp, fourWay, fourWayUp, fiveWay]

sideLength = connectorDiameter / (sqrt(4 + 2 * sqrt(2)));
innerRadius = (sideLength * (1 + sqrt(2))) / 2;

shiftValue = connectorDiameter / 2;
edgeRadius = 1;
eps = 0.1;

if (generate == "elbow") {
    elbow();
} else if (generate == "threeWay") {
    threeWay();
} else if (generate == "threeWayUp") {
    threeWayUp();
} else if (generate == "fourWay") {
    fourWay();
} else if (generate == "fourWayUp") {
    fourWayUp();
} else if (generate == "fiveWay") {
    fiveWay();
} else {
    echo("No suitable object selected! Valid values are: \
[elbow, threeWay, threeWayUp, fourWay, fourWayUp, fiveWay]");
}

module base() {
    translate([0, 0, edgeRadius - eps])
        minkowski() {
            cube(connectorDiameter);
            sphere(r=edgeRadius);
        }
}

module connector() {
    facetCount = 8;
    for (i = [0:facetCount / 2 - 1]) {
        rotate([0, 0, 360 * i / facetCount])
            translate([-sideLength / 2, -innerRadius, 0])
                cube([sideLength, innerRadius * 2, connectorLength + edgeRadius]);
            
    }
    
    translate([0, 0, edgeRadius])
        cylinder(h = connectorLength - edgeRadius, r1 = connectorDiameter / 2, r2 = 5);
}

module subtractor() {
    w = 100;
    l = 100;
    h = 20;
    translate([-w / 2, -l / 2, -h]) cube([w, l, h]);
}

module front() {
    translate([shiftValue, 0, innerRadius]) {
        rotate([90, 0, 0])
            connector();   
    }
}

module back() {
    translate([shiftValue, 2 * shiftValue, innerRadius]) {
        rotate([-90, 0, 0]) 
            connector();   
    }
}

module right() {
    translate([2 * shiftValue, shiftValue, innerRadius]) {
        rotate([0, 90, 0])
            connector();
    }
}

module left() {
    translate([0, shiftValue, innerRadius]) {
        rotate([0, -90, 0])
            connector();
    }
}

module up() {
    translate([shiftValue, shiftValue, 2 * shiftValue + edgeRadius - eps]) {
        connector();
    }
}

module elbow() {
    difference() {
        union() {
            base();
            front();
            right();
        }
        subtractor();
    }
}

module threeWay() {
    difference() {
        union() {
            elbow();
            left();
        }
        subtractor();
    }
}

module threeWayUp() {
    elbow();
    up();
}

module fourWay() {
    difference() {
        union() {
            threeWay();
            back();
        }
        subtractor();
    }
}

module fourWayUp() {
    threeWay();
    up();
}

module fiveWay() {
    fourWay();
    up();
}
