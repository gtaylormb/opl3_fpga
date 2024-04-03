
cmake_minimum_required(VERSION 3.15)
project(bsp)
find_package(common)
    
if(CMAKE_EXPORT_COMPILE_COMMANDS)
    set(CMAKE_CXX_STANDARD_INCLUDE_DIRECTORIES ${CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES})
    set(CMAKE_C_STANDARD_INCLUDE_DIRECTORIES ${CMAKE_C_IMPLICIT_INCLUDE_DIRECTORIES})
endif()

ADD_DEFINITIONS(-c ${proc_extra_compiler_flags})
include_directories(${CMAKE_BINARY_DIR}/include)

if (EXISTS ${metal_BINARY_DIR})
include_directories(${metal_BINARY_DIR}/lib/include)
endif()
set (BSP_LIBSRC_SUBDIRS libsrc standalone xiltimer)

if (SUBDIR_LIST STREQUAL "ALL")
    set (SUBDIR_LIST ${BSP_LIBSRC_SUBDIRS})
endif()

foreach(entry ${SUBDIR_LIST})
    if(entry STREQUAL "libsrc")
        set (path "${CMAKE_LIBRARY_PATH}/../libsrc")
    else()
        set (path "${CMAKE_LIBRARY_PATH}/../libsrc/${entry}/src")
    endif()
    if(EXISTS ${path})
        add_subdirectory(${path})
    endif()
endforeach()
    