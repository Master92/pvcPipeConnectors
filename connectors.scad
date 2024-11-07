$fn = $preview ? 32 : 64;

connectorDiameter = 18.3;
connectorLength = 20;

sideLength = connectorDiameter / (sqrt(4 + 2 * sqrt(2)));
innerRadius = (sideLength * (1 + sqrt(2))) / 2;

module base() {
    edgeRadius = 1;
    translate([0, 0, edgeRadius])
        minkowski() {
            cube(2 * innerRadius);
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
}

module front() {
    translate([innerRadius, 0, innerRadius]) {
        rotate([90, 0, 0])
                connector();   
    }
}

module back() {
    translate([innerRadius, 2 * innerRadius, innerRadius]) {
        rotate([-90, 0, 0]) 
                connector();   
    }
}

module right() {
    translate([2 * innerRadius, innerRadius, innerRadius]) {
        rotate([0, 90, 0])
                connector();
    }
}

module left() {
    translate([0, innerRadius, innerRadius]) {
        rotate([0, -90, 0])
                connector();
    }
}

module up() {
    translate([innerRadius, innerRadius, connectorDiameter]) {
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
