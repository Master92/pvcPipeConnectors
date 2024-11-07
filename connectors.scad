$fn = $preview ? 32 : 64;

// Set this to the inner diameter of your PVC pipe
connectorDiameter = 18.3;
// How long shall the connector protrude into your pipe
connectorLength = 20;

sideLength = connectorDiameter / (sqrt(4 + 2 * sqrt(2)));
innerRadius = (sideLength * (1 + sqrt(2))) / 2;

shiftValue = connectorDiameter / 2;
edgeRadius = 1;
eps = 0.1;

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
    
    cylinder(h = connectorLength, r1 = connectorDiameter / 2, r2 = 5);
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
    base();
    front();
    right();
}

module threeWay() {
    elbow();
    left();
}

module threeWayUp() {
    elbow();
    up();
}

module fourWay() {
    threeWay();
    back();
}

module fourWayUp() {
    threeWay();
    up();
}

module fiveWay() {
    fourWay();
    up();
}
