# Conan automatically generated toolchain file
# DO NOT EDIT MANUALLY, it will be overwritten

# Avoid including toolchain file several times (bad if appending to variables like
#   CMAKE_CXX_FLAGS. See https://github.com/android/ndk/issues/323
include_guard()
message(STATUS "Using Conan toolchain: ${CMAKE_CURRENT_LIST_FILE}")
if(${CMAKE_VERSION} VERSION_LESS "3.15")
    message(FATAL_ERROR "The 'CMakeToolchain' generator only works with CMake >= 3.15")
endif()

########## 'user_toolchain' block #############
# Include one or more CMake user toolchain from tools.cmake.cmaketoolchain:user_toolchain



########## 'generic_system' block #############
# Definition of system, platform and toolset


set(CMAKE_GENERATOR_PLATFORM "x64" CACHE STRING "" FORCE)

message(STATUS "Conan toolchain: CMAKE_GENERATOR_TOOLSET=v143")
set(CMAKE_GENERATOR_TOOLSET "v143" CACHE STRING "" FORCE)


########## 'compilers' block #############



########## 'libcxx' block #############
# Definition of libcxx from 'compiler.libcxx' setting, defining the
# right CXX_FLAGS for that libcxx



########## 'vs_runtime' block #############
# Definition of VS runtime CMAKE_MSVC_RUNTIME_LIBRARY, from settings build_type,
# compiler.runtime, compiler.runtime_type

cmake_policy(GET CMP0091 POLICY_CMP0091)
if(NOT "${POLICY_CMP0091}" STREQUAL NEW)
    message(FATAL_ERROR "The CMake policy CMP0091 must be NEW, but is '${POLICY_CMP0091}'")
endif()
message(STATUS "Conan toolchain: Setting CMAKE_MSVC_RUNTIME_LIBRARY=$<$<CONFIG:Release>:MultiThreadedDLL>")
set(CMAKE_MSVC_RUNTIME_LIBRARY "$<$<CONFIG:Release>:MultiThreadedDLL>")


########## 'vs_debugger_environment' block #############
# Definition of CMAKE_VS_DEBUGGER_ENVIRONMENT from "bindirs" folders of dependencies
# for execution of applications with shared libraries within the VS IDE

set(CMAKE_VS_DEBUGGER_ENVIRONMENT "PATH=$<$<CONFIG:Release>:C:/Users/Artyom/.conan2/p/sdl_i023774f8efa4f/p/bin;C:/Users/Artyom/.conan2/p/libti37f687fa4fc0c/p/bin;C:/Users/Artyom/.conan2/p/libde712e34aa8080e/p/bin;C:/Users/Artyom/.conan2/p/xz_ut80f3ba813098e/p/bin;C:/Users/Artyom/.conan2/p/jbigfe9119c355d4c/p/bin;C:/Users/Artyom/.conan2/p/zstdd8883d62300dc/p/bin;C:/Users/Artyom/.conan2/p/libjp24d144e05a2e3/p/bin;C:/Users/Artyom/.conan2/p/libpn9bfcc2eca1f06/p/bin;C:/Users/Artyom/.conan2/p/libweb2503c6aa238e/p/bin;C:/Users/Artyom/.conan2/p/b/sdl_m4609ccbccd010/p/bin;C:/Users/Artyom/.conan2/p/sdl2094137a649cd/p/bin;C:/Users/Artyom/.conan2/p/flacddd54a5127b79/p/bin;C:/Users/Artyom/.conan2/p/mpg129608668cf86b8/p/bin;C:/Users/Artyom/.conan2/p/libma7e99c0f862f33/p/bin;C:/Users/Artyom/.conan2/p/vorbib3b87ba3196b8/p/bin;C:/Users/Artyom/.conan2/p/opusf90b807b4950fc/p/bin;C:/Users/Artyom/.conan2/p/ogg0603e0d7ed2e4/p/bin;C:/Users/Artyom/.conan2/p/opus1b5cd70a962ca/p/bin;C:/Users/Artyom/.conan2/p/opens50aff95e2aa9e/p/bin;C:/Users/Artyom/.conan2/p/zlib0e715158c1dfd/p/bin;C:/Users/Artyom/.conan2/p/libmi4ded77a1758b8/p/bin;C:/Users/Artyom/.conan2/p/libmoe56118f59e7bb/p/bin>;%PATH%")


########## 'cppstd' block #############
# Define the C++ and C standards from 'compiler.cppstd' and 'compiler.cstd'

function(conan_modify_std_watch variable access value current_list_file stack)
    set(conan_watched_std_variable "14")
    if (${variable} STREQUAL "CMAKE_C_STANDARD")
        set(conan_watched_std_variable "")
    endif()
    if ("${access}" STREQUAL "MODIFIED_ACCESS" AND NOT "${value}" STREQUAL "${conan_watched_std_variable}")
        message(STATUS "Warning: Standard ${variable} value defined in conan_toolchain.cmake to ${conan_watched_std_variable} has been modified to ${value} by ${current_list_file}")
    endif()
    unset(conan_watched_std_variable)
endfunction()

message(STATUS "Conan toolchain: C++ Standard 14 with extensions OFF")
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
variable_watch(CMAKE_CXX_STANDARD conan_modify_std_watch)


########## 'parallel' block #############
# Define VS paralell build /MP flags

string(APPEND CONAN_CXX_FLAGS " /MP28")
string(APPEND CONAN_C_FLAGS " /MP28")


########## 'extra_flags' block #############
# Include extra C++, C and linker flags from configuration tools.build:<type>flags
# and from CMakeToolchain.extra_<type>_flags

# Conan conf flags start: Release
# Conan conf flags end


########## 'cmake_flags_init' block #############
# Define CMAKE_<XXX>_FLAGS from CONAN_<XXX>_FLAGS

foreach(config IN LISTS CMAKE_CONFIGURATION_TYPES)
    string(TOUPPER ${config} config)
    if(DEFINED CONAN_CXX_FLAGS_${config})
      string(APPEND CMAKE_CXX_FLAGS_${config}_INIT " ${CONAN_CXX_FLAGS_${config}}")
    endif()
    if(DEFINED CONAN_C_FLAGS_${config})
      string(APPEND CMAKE_C_FLAGS_${config}_INIT " ${CONAN_C_FLAGS_${config}}")
    endif()
    if(DEFINED CONAN_SHARED_LINKER_FLAGS_${config})
      string(APPEND CMAKE_SHARED_LINKER_FLAGS_${config}_INIT " ${CONAN_SHARED_LINKER_FLAGS_${config}}")
    endif()
    if(DEFINED CONAN_EXE_LINKER_FLAGS_${config})
      string(APPEND CMAKE_EXE_LINKER_FLAGS_${config}_INIT " ${CONAN_EXE_LINKER_FLAGS_${config}}")
    endif()
endforeach()

if(DEFINED CONAN_CXX_FLAGS)
  string(APPEND CMAKE_CXX_FLAGS_INIT " ${CONAN_CXX_FLAGS}")
endif()
if(DEFINED CONAN_C_FLAGS)
  string(APPEND CMAKE_C_FLAGS_INIT " ${CONAN_C_FLAGS}")
endif()
if(DEFINED CONAN_SHARED_LINKER_FLAGS)
  string(APPEND CMAKE_SHARED_LINKER_FLAGS_INIT " ${CONAN_SHARED_LINKER_FLAGS}")
endif()
if(DEFINED CONAN_EXE_LINKER_FLAGS)
  string(APPEND CMAKE_EXE_LINKER_FLAGS_INIT " ${CONAN_EXE_LINKER_FLAGS}")
endif()


########## 'extra_variables' block #############
# Definition of extra CMake variables from tools.cmake.cmaketoolchain:extra_variables



########## 'try_compile' block #############
# Blocks after this one will not be added when running CMake try/checks

get_property( _CMAKE_IN_TRY_COMPILE GLOBAL PROPERTY IN_TRY_COMPILE )
if(_CMAKE_IN_TRY_COMPILE)
    message(STATUS "Running toolchain IN_TRY_COMPILE")
    return()
endif()


########## 'find_paths' block #############
# Define paths to find packages, programs, libraries, etc.
if(EXISTS "${CMAKE_CURRENT_LIST_DIR}/conan_cmakedeps_paths.cmake")
  message(STATUS "Conan toolchain: Including CMakeDeps generated conan_find_paths.cmake")
  include("${CMAKE_CURRENT_LIST_DIR}/conan_cmakedeps_paths.cmake")
else()

set(CMAKE_FIND_PACKAGE_PREFER_CONFIG ON)

# Definition of CMAKE_MODULE_PATH
list(PREPEND CMAKE_MODULE_PATH "C:/Users/Artyom/.conan2/p/opens50aff95e2aa9e/p/lib/cmake")
# the generators folder (where conan generates files, like this toolchain)
list(PREPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR})

# Definition of CMAKE_PREFIX_PATH, CMAKE_XXXXX_PATH
# The explicitly defined "builddirs" of "host" context dependencies must be in PREFIX_PATH
list(PREPEND CMAKE_PREFIX_PATH "C:/Users/Artyom/.conan2/p/opens50aff95e2aa9e/p/lib/cmake")
# The Conan local "generators" folder, where this toolchain is saved.
list(PREPEND CMAKE_PREFIX_PATH ${CMAKE_CURRENT_LIST_DIR} )
list(PREPEND CMAKE_PROGRAM_PATH "C:/Users/Artyom/.conan2/p/cmake1927748c2604b/p/bin")
list(PREPEND CMAKE_LIBRARY_PATH "C:/Users/Artyom/.conan2/p/sdl_i023774f8efa4f/p/lib" "C:/Users/Artyom/.conan2/p/libti37f687fa4fc0c/p/lib" "C:/Users/Artyom/.conan2/p/libde712e34aa8080e/p/lib" "C:/Users/Artyom/.conan2/p/xz_ut80f3ba813098e/p/lib" "C:/Users/Artyom/.conan2/p/jbigfe9119c355d4c/p/lib" "C:/Users/Artyom/.conan2/p/zstdd8883d62300dc/p/lib" "C:/Users/Artyom/.conan2/p/libjp24d144e05a2e3/p/lib" "C:/Users/Artyom/.conan2/p/libpn9bfcc2eca1f06/p/lib" "C:/Users/Artyom/.conan2/p/libweb2503c6aa238e/p/lib" "C:/Users/Artyom/.conan2/p/b/sdl_m4609ccbccd010/p/lib" "C:/Users/Artyom/.conan2/p/sdl2094137a649cd/p/lib" "C:/Users/Artyom/.conan2/p/flacddd54a5127b79/p/lib" "C:/Users/Artyom/.conan2/p/mpg129608668cf86b8/p/lib" "C:/Users/Artyom/.conan2/p/libma7e99c0f862f33/p/lib" "C:/Users/Artyom/.conan2/p/vorbib3b87ba3196b8/p/lib" "C:/Users/Artyom/.conan2/p/opusf90b807b4950fc/p/lib" "C:/Users/Artyom/.conan2/p/ogg0603e0d7ed2e4/p/lib" "C:/Users/Artyom/.conan2/p/opus1b5cd70a962ca/p/lib" "C:/Users/Artyom/.conan2/p/opens50aff95e2aa9e/p/lib" "C:/Users/Artyom/.conan2/p/zlib0e715158c1dfd/p/lib" "C:/Users/Artyom/.conan2/p/libmi4ded77a1758b8/p/lib" "C:/Users/Artyom/.conan2/p/libmoe56118f59e7bb/p/lib")
list(PREPEND CMAKE_INCLUDE_PATH "C:/Users/Artyom/.conan2/p/sdl_i023774f8efa4f/p/include" "C:/Users/Artyom/.conan2/p/sdl_i023774f8efa4f/p/include/SDL2" "C:/Users/Artyom/.conan2/p/libti37f687fa4fc0c/p/include" "C:/Users/Artyom/.conan2/p/libde712e34aa8080e/p/include" "C:/Users/Artyom/.conan2/p/xz_ut80f3ba813098e/p/include" "C:/Users/Artyom/.conan2/p/jbigfe9119c355d4c/p/include" "C:/Users/Artyom/.conan2/p/zstdd8883d62300dc/p/include" "C:/Users/Artyom/.conan2/p/libjp24d144e05a2e3/p/include" "C:/Users/Artyom/.conan2/p/libpn9bfcc2eca1f06/p/include" "C:/Users/Artyom/.conan2/p/libweb2503c6aa238e/p/include" "C:/Users/Artyom/.conan2/p/b/sdl_m4609ccbccd010/p/include" "C:/Users/Artyom/.conan2/p/b/sdl_m4609ccbccd010/p/include/SDL2" "C:/Users/Artyom/.conan2/p/sdl2094137a649cd/p/include" "C:/Users/Artyom/.conan2/p/sdl2094137a649cd/p/include/SDL2" "C:/Users/Artyom/.conan2/p/flacddd54a5127b79/p/include" "C:/Users/Artyom/.conan2/p/mpg129608668cf86b8/p/include" "C:/Users/Artyom/.conan2/p/libma7e99c0f862f33/p/include" "C:/Users/Artyom/.conan2/p/vorbib3b87ba3196b8/p/include" "C:/Users/Artyom/.conan2/p/opusf90b807b4950fc/p/include" "C:/Users/Artyom/.conan2/p/opusf90b807b4950fc/p/include/opus" "C:/Users/Artyom/.conan2/p/ogg0603e0d7ed2e4/p/include" "C:/Users/Artyom/.conan2/p/opus1b5cd70a962ca/p/include" "C:/Users/Artyom/.conan2/p/opus1b5cd70a962ca/p/include/opus" "C:/Users/Artyom/.conan2/p/opens50aff95e2aa9e/p/include" "C:/Users/Artyom/.conan2/p/zlib0e715158c1dfd/p/include" "C:/Users/Artyom/.conan2/p/libmi4ded77a1758b8/p/include" "C:/Users/Artyom/.conan2/p/libmoe56118f59e7bb/p/include" "C:/Users/Artyom/.conan2/p/libmoe56118f59e7bb/p/include/libmodplug")
set(CONAN_RUNTIME_LIB_DIRS "$<$<CONFIG:Release>:C:/Users/Artyom/.conan2/p/sdl_i023774f8efa4f/p/bin>" "$<$<CONFIG:Release>:C:/Users/Artyom/.conan2/p/libti37f687fa4fc0c/p/bin>" "$<$<CONFIG:Release>:C:/Users/Artyom/.conan2/p/libde712e34aa8080e/p/bin>" "$<$<CONFIG:Release>:C:/Users/Artyom/.conan2/p/xz_ut80f3ba813098e/p/bin>" "$<$<CONFIG:Release>:C:/Users/Artyom/.conan2/p/jbigfe9119c355d4c/p/bin>" "$<$<CONFIG:Release>:C:/Users/Artyom/.conan2/p/zstdd8883d62300dc/p/bin>" "$<$<CONFIG:Release>:C:/Users/Artyom/.conan2/p/libjp24d144e05a2e3/p/bin>" "$<$<CONFIG:Release>:C:/Users/Artyom/.conan2/p/libpn9bfcc2eca1f06/p/bin>" "$<$<CONFIG:Release>:C:/Users/Artyom/.conan2/p/libweb2503c6aa238e/p/bin>" "$<$<CONFIG:Release>:C:/Users/Artyom/.conan2/p/b/sdl_m4609ccbccd010/p/bin>" "$<$<CONFIG:Release>:C:/Users/Artyom/.conan2/p/sdl2094137a649cd/p/bin>" "$<$<CONFIG:Release>:C:/Users/Artyom/.conan2/p/flacddd54a5127b79/p/bin>" "$<$<CONFIG:Release>:C:/Users/Artyom/.conan2/p/mpg129608668cf86b8/p/bin>" "$<$<CONFIG:Release>:C:/Users/Artyom/.conan2/p/libma7e99c0f862f33/p/bin>" "$<$<CONFIG:Release>:C:/Users/Artyom/.conan2/p/vorbib3b87ba3196b8/p/bin>" "$<$<CONFIG:Release>:C:/Users/Artyom/.conan2/p/opusf90b807b4950fc/p/bin>" "$<$<CONFIG:Release>:C:/Users/Artyom/.conan2/p/ogg0603e0d7ed2e4/p/bin>" "$<$<CONFIG:Release>:C:/Users/Artyom/.conan2/p/opus1b5cd70a962ca/p/bin>" "$<$<CONFIG:Release>:C:/Users/Artyom/.conan2/p/opens50aff95e2aa9e/p/bin>" "$<$<CONFIG:Release>:C:/Users/Artyom/.conan2/p/zlib0e715158c1dfd/p/bin>" "$<$<CONFIG:Release>:C:/Users/Artyom/.conan2/p/libmi4ded77a1758b8/p/bin>" "$<$<CONFIG:Release>:C:/Users/Artyom/.conan2/p/libmoe56118f59e7bb/p/bin>" )

endif()


########## 'pkg_config' block #############
# Define pkg-config from 'tools.gnu:pkg_config' executable and paths

if (DEFINED ENV{PKG_CONFIG_PATH})
set(ENV{PKG_CONFIG_PATH} "${CMAKE_CURRENT_LIST_DIR};$ENV{PKG_CONFIG_PATH}")
else()
set(ENV{PKG_CONFIG_PATH} "${CMAKE_CURRENT_LIST_DIR};")
endif()


########## 'rpath' block #############
# Defining CMAKE_SKIP_RPATH



########## 'output_dirs' block #############
# Definition of CMAKE_INSTALL_XXX folders

set(CMAKE_INSTALL_BINDIR "bin")
set(CMAKE_INSTALL_SBINDIR "bin")
set(CMAKE_INSTALL_LIBEXECDIR "bin")
set(CMAKE_INSTALL_LIBDIR "lib")
set(CMAKE_INSTALL_INCLUDEDIR "include")
set(CMAKE_INSTALL_OLDINCLUDEDIR "include")


########## 'variables' block #############
# Definition of CMake variables from CMakeToolchain.variables values

# Variables
# Variables  per configuration



########## 'preprocessor' block #############
# Preprocessor definitions from CMakeToolchain.preprocessor_definitions values

# Preprocessor definitions per configuration



if(CMAKE_POLICY_DEFAULT_CMP0091)  # Avoid unused and not-initialized warnings
endif()
