########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(sdl_mixer_COMPONENT_NAMES "")
if(DEFINED sdl_mixer_FIND_DEPENDENCY_NAMES)
  list(APPEND sdl_mixer_FIND_DEPENDENCY_NAMES SDL2 flac mpg123 libmad Vorbis opusfile Ogg Opus OpenSSL libmikmod libmodplug)
  list(REMOVE_DUPLICATES sdl_mixer_FIND_DEPENDENCY_NAMES)
else()
  set(sdl_mixer_FIND_DEPENDENCY_NAMES SDL2 flac mpg123 libmad Vorbis opusfile Ogg Opus OpenSSL libmikmod libmodplug)
endif()
set(SDL2_FIND_MODE "NO_MODULE")
set(flac_FIND_MODE "NO_MODULE")
set(mpg123_FIND_MODE "NO_MODULE")
set(libmad_FIND_MODE "NO_MODULE")
set(Vorbis_FIND_MODE "NO_MODULE")
set(opusfile_FIND_MODE "NO_MODULE")
set(Ogg_FIND_MODE "NO_MODULE")
set(Opus_FIND_MODE "NO_MODULE")
set(OpenSSL_FIND_MODE "NO_MODULE")
set(libmikmod_FIND_MODE "NO_MODULE")
set(libmodplug_FIND_MODE "NO_MODULE")

########### VARIABLES #######################################################################
#############################################################################################
set(sdl_mixer_PACKAGE_FOLDER_RELEASE "C:/Users/Artyom/.conan2/p/b/sdl_m4609ccbccd010/p")
set(sdl_mixer_BUILD_MODULES_PATHS_RELEASE )


set(sdl_mixer_INCLUDE_DIRS_RELEASE "${sdl_mixer_PACKAGE_FOLDER_RELEASE}/include"
			"${sdl_mixer_PACKAGE_FOLDER_RELEASE}/include/SDL2")
set(sdl_mixer_RES_DIRS_RELEASE )
set(sdl_mixer_DEFINITIONS_RELEASE )
set(sdl_mixer_SHARED_LINK_FLAGS_RELEASE )
set(sdl_mixer_EXE_LINK_FLAGS_RELEASE )
set(sdl_mixer_OBJECTS_RELEASE )
set(sdl_mixer_COMPILE_DEFINITIONS_RELEASE )
set(sdl_mixer_COMPILE_OPTIONS_C_RELEASE )
set(sdl_mixer_COMPILE_OPTIONS_CXX_RELEASE )
set(sdl_mixer_LIB_DIRS_RELEASE "${sdl_mixer_PACKAGE_FOLDER_RELEASE}/lib")
set(sdl_mixer_BIN_DIRS_RELEASE )
set(sdl_mixer_LIBRARY_TYPE_RELEASE STATIC)
set(sdl_mixer_IS_HOST_WINDOWS_RELEASE 1)
set(sdl_mixer_LIBS_RELEASE SDL2_mixer)
set(sdl_mixer_SYSTEM_LIBS_RELEASE winmm)
set(sdl_mixer_FRAMEWORK_DIRS_RELEASE )
set(sdl_mixer_FRAMEWORKS_RELEASE )
set(sdl_mixer_BUILD_DIRS_RELEASE )
set(sdl_mixer_NO_SONAME_MODE_RELEASE FALSE)


# COMPOUND VARIABLES
set(sdl_mixer_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${sdl_mixer_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${sdl_mixer_COMPILE_OPTIONS_C_RELEASE}>")
set(sdl_mixer_LINKER_FLAGS_RELEASE
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${sdl_mixer_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${sdl_mixer_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${sdl_mixer_EXE_LINK_FLAGS_RELEASE}>")


set(sdl_mixer_COMPONENTS_RELEASE )