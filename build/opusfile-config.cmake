########## MACROS ###########################################################################
#############################################################################################

# Requires CMake > 3.15
if(${CMAKE_VERSION} VERSION_LESS "3.15")
    message(FATAL_ERROR "The 'CMakeDeps' generator only works with CMake >= 3.15")
endif()

if(opusfile_FIND_QUIETLY)
    set(opusfile_MESSAGE_MODE VERBOSE)
else()
    set(opusfile_MESSAGE_MODE STATUS)
endif()

include(${CMAKE_CURRENT_LIST_DIR}/cmakedeps_macros.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/opusfileTargets.cmake)
include(CMakeFindDependencyMacro)

check_build_type_defined()

foreach(_DEPENDENCY ${opusfile_FIND_DEPENDENCY_NAMES} )
    # Check that we have not already called a find_package with the transitive dependency
    if(NOT ${_DEPENDENCY}_FOUND)
        find_dependency(${_DEPENDENCY} REQUIRED ${${_DEPENDENCY}_FIND_MODE})
    endif()
endforeach()

set(opusfile_VERSION_STRING "0.12")
set(opusfile_INCLUDE_DIRS ${opusfile_INCLUDE_DIRS_RELEASE} )
set(opusfile_INCLUDE_DIR ${opusfile_INCLUDE_DIRS_RELEASE} )
set(opusfile_LIBRARIES ${opusfile_LIBRARIES_RELEASE} )
set(opusfile_DEFINITIONS ${opusfile_DEFINITIONS_RELEASE} )


# Only the last installed configuration BUILD_MODULES are included to avoid the collision
foreach(_BUILD_MODULE ${opusfile_BUILD_MODULES_PATHS_RELEASE} )
    message(${opusfile_MESSAGE_MODE} "Conan: Including build module from '${_BUILD_MODULE}'")
    include(${_BUILD_MODULE})
endforeach()


