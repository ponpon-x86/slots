# Load the debug and release variables
file(GLOB DATA_FILES "${CMAKE_CURRENT_LIST_DIR}/libmikmod-*-data.cmake")

foreach(f ${DATA_FILES})
    include(${f})
endforeach()

# Create the targets for all the components
foreach(_COMPONENT ${libmikmod_COMPONENT_NAMES} )
    if(NOT TARGET ${_COMPONENT})
        add_library(${_COMPONENT} INTERFACE IMPORTED)
        message(${libmikmod_MESSAGE_MODE} "Conan: Component target declared '${_COMPONENT}'")
    endif()
endforeach()

if(NOT TARGET libmikmod::libmikmod)
    add_library(libmikmod::libmikmod INTERFACE IMPORTED)
    message(${libmikmod_MESSAGE_MODE} "Conan: Target declared 'libmikmod::libmikmod'")
endif()
# Load the debug and release library finders
file(GLOB CONFIG_FILES "${CMAKE_CURRENT_LIST_DIR}/libmikmod-Target-*.cmake")

foreach(f ${CONFIG_FILES})
    include(${f})
endforeach()