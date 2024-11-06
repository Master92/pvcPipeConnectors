use <connectors.scad>

// which object is to be generated
generate = "default"; // [ellbow, threeWay, threeWayUp, fourWay, fourWayUp, fiveWay]

if (generate == "ellbow") {
    ellbow();
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
    
}
