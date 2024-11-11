cmake_minimum_required(VERSION 3.20)

project(PVCConnectors VERSION 0.1.0.0 LANGUAGES NONE)

find_program(OPENSCAD openscad NAMES "openscad.exe" REQUIRED)

macro(add_output target)
    add_custom_target(${target} ALL
        ${OPENSCAD} -o ${target}.stl ${CMAKE_CURRENT_SOURCE_DIR}/connectors.scad -D generate=\"${target}\"
        VERBATIM
    )
endmacro()

add_output(elbow ALL)
add_output(threeWay ALL)
add_output(threeWayUp ALL)
add_output(fourWay ALL)
add_output(fourWayUp ALL)
add_output(fiveWay ALL)
