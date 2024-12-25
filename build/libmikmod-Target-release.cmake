# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(libmikmod_FRAMEWORKS_FOUND_RELEASE "") # Will be filled later
conan_find_apple_frameworks(libmikmod_FRAMEWORKS_FOUND_RELEASE "${libmikmod_FRAMEWORKS_RELEASE}" "${libmikmod_FRAMEWORK_DIRS_RELEASE}")

set(libmikmod_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET libmikmod_DEPS_TARGET)
    add_library(libmikmod_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET libmikmod_DEPS_TARGET
             APPEND PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Release>:${libmikmod_FRAMEWORKS_FOUND_RELEASE}>
             $<$<CONFIG:Release>:${libmikmod_SYSTEM_LIBS_RELEASE}>
             $<$<CONFIG:Release>:>)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### libmikmod_DEPS_TARGET to all of them
conan_package_library_targets("${libmikmod_LIBS_RELEASE}"    # libraries
                              "${libmikmod_LIB_DIRS_RELEASE}" # package_libdir
                              "${libmikmod_BIN_DIRS_RELEASE}" # package_bindir
                              "${libmikmod_LIBRARY_TYPE_RELEASE}"
                              "${libmikmod_IS_HOST_WINDOWS_RELEASE}"
                              libmikmod_DEPS_TARGET
                              libmikmod_LIBRARIES_TARGETS  # out_libraries_targets
                              "_RELEASE"
                              "libmikmod"    # package_name
                              "${libmikmod_NO_SONAME_MODE_RELEASE}")  # soname

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${libmikmod_BUILD_DIRS_RELEASE} ${CMAKE_MODULE_PATH})

########## GLOBAL TARGET PROPERTIES Release ########################################
    set_property(TARGET libmikmod::libmikmod
                 APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:Release>:${libmikmod_OBJECTS_RELEASE}>
                 $<$<CONFIG:Release>:${libmikmod_LIBRARIES_TARGETS}>
                 )

    if("${libmikmod_LIBS_RELEASE}" STREQUAL "")
        # If the package is not declaring any "cpp_info.libs" the package deps, system libs,
        # frameworks etc are not linked to the imported targets and we need to do it to the
        # global target
        set_property(TARGET libmikmod::libmikmod
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     libmikmod_DEPS_TARGET)
    endif()

    set_property(TARGET libmikmod::libmikmod
                 APPEND PROPERTY INTERFACE_LINK_OPTIONS
                 $<$<CONFIG:Release>:${libmikmod_LINKER_FLAGS_RELEASE}>)
    set_property(TARGET libmikmod::libmikmod
                 APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                 $<$<CONFIG:Release>:${libmikmod_INCLUDE_DIRS_RELEASE}>)
    # Necessary to find LINK shared libraries in Linux
    set_property(TARGET libmikmod::libmikmod
                 APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                 $<$<CONFIG:Release>:${libmikmod_LIB_DIRS_RELEASE}>)
    set_property(TARGET libmikmod::libmikmod
                 APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                 $<$<CONFIG:Release>:${libmikmod_COMPILE_DEFINITIONS_RELEASE}>)
    set_property(TARGET libmikmod::libmikmod
                 APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                 $<$<CONFIG:Release>:${libmikmod_COMPILE_OPTIONS_RELEASE}>)

########## For the modules (FindXXX)
set(libmikmod_LIBRARIES_RELEASE libmikmod::libmikmod)