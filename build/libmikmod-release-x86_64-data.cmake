########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(libmikmod_COMPONENT_NAMES "")
if(DEFINED libmikmod_FIND_DEPENDENCY_NAMES)
  list(APPEND libmikmod_FIND_DEPENDENCY_NAMES )
  list(REMOVE_DUPLICATES libmikmod_FIND_DEPENDENCY_NAMES)
else()
  set(libmikmod_FIND_DEPENDENCY_NAMES )
endif()

########### VARIABLES #######################################################################
#############################################################################################
set(libmikmod_PACKAGE_FOLDER_RELEASE "C:/Users/Artyom/.conan2/p/libmi4ded77a1758b8/p")
set(libmikmod_BUILD_MODULES_PATHS_RELEASE )


set(libmikmod_INCLUDE_DIRS_RELEASE )
set(libmikmod_RES_DIRS_RELEASE )
set(libmikmod_DEFINITIONS_RELEASE "-DMIKMOD_STATIC")
set(libmikmod_SHARED_LINK_FLAGS_RELEASE )
set(libmikmod_EXE_LINK_FLAGS_RELEASE )
set(libmikmod_OBJECTS_RELEASE )
set(libmikmod_COMPILE_DEFINITIONS_RELEASE "MIKMOD_STATIC")
set(libmikmod_COMPILE_OPTIONS_C_RELEASE )
set(libmikmod_COMPILE_OPTIONS_CXX_RELEASE )
set(libmikmod_LIB_DIRS_RELEASE "${libmikmod_PACKAGE_FOLDER_RELEASE}/lib")
set(libmikmod_BIN_DIRS_RELEASE )
set(libmikmod_LIBRARY_TYPE_RELEASE STATIC)
set(libmikmod_IS_HOST_WINDOWS_RELEASE 1)
set(libmikmod_LIBS_RELEASE mikmod)
set(libmikmod_SYSTEM_LIBS_RELEASE dsound winmm)
set(libmikmod_FRAMEWORK_DIRS_RELEASE )
set(libmikmod_FRAMEWORKS_RELEASE CoreAudio)
set(libmikmod_BUILD_DIRS_RELEASE )
set(libmikmod_NO_SONAME_MODE_RELEASE FALSE)


# COMPOUND VARIABLES
set(libmikmod_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${libmikmod_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${libmikmod_COMPILE_OPTIONS_C_RELEASE}>")
set(libmikmod_LINKER_FLAGS_RELEASE
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${libmikmod_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${libmikmod_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${libmikmod_EXE_LINK_FLAGS_RELEASE}>")


set(libmikmod_COMPONENTS_RELEASE )