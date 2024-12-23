file(GLOB_RECURSE SOURCES *.cpp)

add_executable(slots ${SOURCES})
target_link_libraries(slots PRIVATE SDL2::SDL2main)
target_link_libraries(slots PRIVATE SDL2::SDL2-static)

target_include_directories(slots PUBLIC ../include)
