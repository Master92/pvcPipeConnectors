cmake_minimum_required(VERSION 3.20)

project(PVCConnectors VERSION 0.1.0.0 LANGUAGES NONE)

find_program(OPENSCAD openscad NAMES "openscad.exe" REQUIRED)

option(ABS "Build with scale factor printing in ABS" OFF)

if(ABS)
    set(SCALE_FACTOR 1.02)
else()
    set(SCALE_FACTOR 1.0)
endif()

macro(add_output target)
    add_custom_target(${target} ALL
        ${OPENSCAD} -o ${target}.stl ${CMAKE_CURRENT_SOURCE_DIR}/connectors.scad -D generate=\"${target}\" -D scaleFactor=${SCALE_FACTOR}
        VERBATIM
    )
endmacro()

add_output(elbow)
add_output(threeWay)
add_output(threeWayUp)
add_output(fourWay)
add_output(fourWayUp)
add_output(fiveWay)
