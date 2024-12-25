message(STATUS "Conan: Using CMakeDeps conandeps_legacy.cmake aggregator via include()")
message(STATUS "Conan: It is recommended to use explicit find_package() per dependency instead")

find_package(SDL2_image)
find_package(SDL2_mixer)

set(CONANDEPS_LEGACY  SDL2_image::SDL2_image  SDL2_mixer::SDL2_mixer )