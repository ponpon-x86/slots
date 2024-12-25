# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(libmad_FRAMEWORKS_FOUND_RELEASE "") # Will be filled later
conan_find_apple_frameworks(libmad_FRAMEWORKS_FOUND_RELEASE "${libmad_FRAMEWORKS_RELEASE}" "${libmad_FRAMEWORK_DIRS_RELEASE}")

set(libmad_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET libmad_DEPS_TARGET)
    add_library(libmad_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET libmad_DEPS_TARGET
             APPEND PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Release>:${libmad_FRAMEWORKS_FOUND_RELEASE}>
             $<$<CONFIG:Release>:${libmad_SYSTEM_LIBS_RELEASE}>
             $<$<CONFIG:Release>:>)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### libmad_DEPS_TARGET to all of them
conan_package_library_targets("${libmad_LIBS_RELEASE}"    # libraries
                              "${libmad_LIB_DIRS_RELEASE}" # package_libdir
                              "${libmad_BIN_DIRS_RELEASE}" # package_bindir
                              "${libmad_LIBRARY_TYPE_RELEASE}"
                              "${libmad_IS_HOST_WINDOWS_RELEASE}"
                              libmad_DEPS_TARGET
                              libmad_LIBRARIES_TARGETS  # out_libraries_targets
                              "_RELEASE"
                              "libmad"    # package_name
                              "${libmad_NO_SONAME_MODE_RELEASE}")  # soname

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${libmad_BUILD_DIRS_RELEASE} ${CMAKE_MODULE_PATH})

########## GLOBAL TARGET PROPERTIES Release ########################################
    set_property(TARGET libmad::libmad
                 APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:Release>:${libmad_OBJECTS_RELEASE}>
                 $<$<CONFIG:Release>:${libmad_LIBRARIES_TARGETS}>
                 )

    if("${libmad_LIBS_RELEASE}" STREQUAL "")
        # If the package is not declaring any "cpp_info.libs" the package deps, system libs,
        # frameworks etc are not linked to the imported targets and we need to do it to the
        # global target
        set_property(TARGET libmad::libmad
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     libmad_DEPS_TARGET)
    endif()

    set_property(TARGET libmad::libmad
                 APPEND PROPERTY INTERFACE_LINK_OPTIONS
                 $<$<CONFIG:Release>:${libmad_LINKER_FLAGS_RELEASE}>)
    set_property(TARGET libmad::libmad
                 APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                 $<$<CONFIG:Release>:${libmad_INCLUDE_DIRS_RELEASE}>)
    # Necessary to find LINK shared libraries in Linux
    set_property(TARGET libmad::libmad
                 APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                 $<$<CONFIG:Release>:${libmad_LIB_DIRS_RELEASE}>)
    set_property(TARGET libmad::libmad
                 APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                 $<$<CONFIG:Release>:${libmad_COMPILE_DEFINITIONS_RELEASE}>)
    set_property(TARGET libmad::libmad
                 APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                 $<$<CONFIG:Release>:${libmad_COMPILE_OPTIONS_RELEASE}>)

########## For the modules (FindXXX)
set(libmad_LIBRARIES_RELEASE libmad::libmad)
