########## MACROS ###########################################################################
#############################################################################################

# Requires CMake > 3.15
if(${CMAKE_VERSION} VERSION_LESS "3.15")
    message(FATAL_ERROR "The 'CMakeDeps' generator only works with CMake >= 3.15")
endif()

if(libmad_FIND_QUIETLY)
    set(libmad_MESSAGE_MODE VERBOSE)
else()
    set(libmad_MESSAGE_MODE STATUS)
endif()

include(${CMAKE_CURRENT_LIST_DIR}/cmakedeps_macros.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/libmadTargets.cmake)
include(CMakeFindDependencyMacro)

check_build_type_defined()

foreach(_DEPENDENCY ${libmad_FIND_DEPENDENCY_NAMES} )
    # Check that we have not already called a find_package with the transitive dependency
    if(NOT ${_DEPENDENCY}_FOUND)
        find_dependency(${_DEPENDENCY} REQUIRED ${${_DEPENDENCY}_FIND_MODE})
    endif()
endforeach()

set(libmad_VERSION_STRING "0.15.1b")
set(libmad_INCLUDE_DIRS ${libmad_INCLUDE_DIRS_RELEASE} )
set(libmad_INCLUDE_DIR ${libmad_INCLUDE_DIRS_RELEASE} )
set(libmad_LIBRARIES ${libmad_LIBRARIES_RELEASE} )
set(libmad_DEFINITIONS ${libmad_DEFINITIONS_RELEASE} )


# Only the last installed configuration BUILD_MODULES are included to avoid the collision
foreach(_BUILD_MODULE ${libmad_BUILD_MODULES_PATHS_RELEASE} )
    message(${libmad_MESSAGE_MODE} "Conan: Including build module from '${_BUILD_MODULE}'")
    include(${_BUILD_MODULE})
endforeach()


