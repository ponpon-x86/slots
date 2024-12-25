########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

list(APPEND opusfile_COMPONENT_NAMES opusfile::libopusfile)
list(REMOVE_DUPLICATES opusfile_COMPONENT_NAMES)
if(DEFINED opusfile_FIND_DEPENDENCY_NAMES)
  list(APPEND opusfile_FIND_DEPENDENCY_NAMES Ogg Opus OpenSSL)
  list(REMOVE_DUPLICATES opusfile_FIND_DEPENDENCY_NAMES)
else()
  set(opusfile_FIND_DEPENDENCY_NAMES Ogg Opus OpenSSL)
endif()
set(Ogg_FIND_MODE "NO_MODULE")
set(Opus_FIND_MODE "NO_MODULE")
set(OpenSSL_FIND_MODE "NO_MODULE")

########### VARIABLES #######################################################################
#############################################################################################
set(opusfile_PACKAGE_FOLDER_RELEASE "C:/Users/Artyom/.conan2/p/opusf90b807b4950fc/p")
set(opusfile_BUILD_MODULES_PATHS_RELEASE )


set(opusfile_INCLUDE_DIRS_RELEASE )
set(opusfile_RES_DIRS_RELEASE )
set(opusfile_DEFINITIONS_RELEASE )
set(opusfile_SHARED_LINK_FLAGS_RELEASE )
set(opusfile_EXE_LINK_FLAGS_RELEASE )
set(opusfile_OBJECTS_RELEASE )
set(opusfile_COMPILE_DEFINITIONS_RELEASE )
set(opusfile_COMPILE_OPTIONS_C_RELEASE )
set(opusfile_COMPILE_OPTIONS_CXX_RELEASE )
set(opusfile_LIB_DIRS_RELEASE "${opusfile_PACKAGE_FOLDER_RELEASE}/lib")
set(opusfile_BIN_DIRS_RELEASE )
set(opusfile_LIBRARY_TYPE_RELEASE STATIC)
set(opusfile_IS_HOST_WINDOWS_RELEASE 1)
set(opusfile_LIBS_RELEASE opusfile)
set(opusfile_SYSTEM_LIBS_RELEASE )
set(opusfile_FRAMEWORK_DIRS_RELEASE )
set(opusfile_FRAMEWORKS_RELEASE )
set(opusfile_BUILD_DIRS_RELEASE )
set(opusfile_NO_SONAME_MODE_RELEASE FALSE)


# COMPOUND VARIABLES
set(opusfile_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${opusfile_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${opusfile_COMPILE_OPTIONS_C_RELEASE}>")
set(opusfile_LINKER_FLAGS_RELEASE
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${opusfile_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${opusfile_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${opusfile_EXE_LINK_FLAGS_RELEASE}>")


set(opusfile_COMPONENTS_RELEASE opusfile::libopusfile)
########### COMPONENT opusfile::libopusfile VARIABLES ############################################

set(opusfile_opusfile_libopusfile_INCLUDE_DIRS_RELEASE )
set(opusfile_opusfile_libopusfile_LIB_DIRS_RELEASE "${opusfile_PACKAGE_FOLDER_RELEASE}/lib")
set(opusfile_opusfile_libopusfile_BIN_DIRS_RELEASE )
set(opusfile_opusfile_libopusfile_LIBRARY_TYPE_RELEASE STATIC)
set(opusfile_opusfile_libopusfile_IS_HOST_WINDOWS_RELEASE 1)
set(opusfile_opusfile_libopusfile_RES_DIRS_RELEASE )
set(opusfile_opusfile_libopusfile_DEFINITIONS_RELEASE )
set(opusfile_opusfile_libopusfile_OBJECTS_RELEASE )
set(opusfile_opusfile_libopusfile_COMPILE_DEFINITIONS_RELEASE )
set(opusfile_opusfile_libopusfile_COMPILE_OPTIONS_C_RELEASE "")
set(opusfile_opusfile_libopusfile_COMPILE_OPTIONS_CXX_RELEASE "")
set(opusfile_opusfile_libopusfile_LIBS_RELEASE opusfile)
set(opusfile_opusfile_libopusfile_SYSTEM_LIBS_RELEASE )
set(opusfile_opusfile_libopusfile_FRAMEWORK_DIRS_RELEASE )
set(opusfile_opusfile_libopusfile_FRAMEWORKS_RELEASE )
set(opusfile_opusfile_libopusfile_DEPENDENCIES_RELEASE Ogg::ogg Opus::opus openssl::openssl)
set(opusfile_opusfile_libopusfile_SHARED_LINK_FLAGS_RELEASE )
set(opusfile_opusfile_libopusfile_EXE_LINK_FLAGS_RELEASE )
set(opusfile_opusfile_libopusfile_NO_SONAME_MODE_RELEASE FALSE)

# COMPOUND VARIABLES
set(opusfile_opusfile_libopusfile_LINKER_FLAGS_RELEASE
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${opusfile_opusfile_libopusfile_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${opusfile_opusfile_libopusfile_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${opusfile_opusfile_libopusfile_EXE_LINK_FLAGS_RELEASE}>
)
set(opusfile_opusfile_libopusfile_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${opusfile_opusfile_libopusfile_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${opusfile_opusfile_libopusfile_COMPILE_OPTIONS_C_RELEASE}>")