# file: setup_project.cmake
# author: Kumarjit Das
# date: 2024-07-06
# brief: TYPES library cmake project setup file.

# License:
#
# Copyright (c) 2024, Kumarjit Das
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# * Redistributions of source code must retain the above copyright notice, this
# list of conditions and the following disclaimer.
#
# * Redistributions in binary form must reproduce the above copyright notice,
# this list of conditions and the following disclaimer in the documentation
# and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


# Setting the project name in lower, upper, and mixed case
set(TYPES_PROJECT_NAME "types")
string(TOLOWER ${TYPES_PROJECT_NAME} TYPES_PROJECT_NAME_LOWER)
string(TOUPPER ${TYPES_PROJECT_NAME} TYPES_PROJECT_NAME_UPPER)

# Setting the main library name in both lower and upper-cases
set(TYPES_LIBRARY_NAME "types")
string(TOUPPER ${TYPES_LIBRARY_NAME} TYPES_LIBRARY_NAME_UPPER)

# Setting project version
set(${TYPES_LIBRARY_NAME_UPPER}_VERSION_MAJOR 1)
set(${TYPES_LIBRARY_NAME_UPPER}_VERSION_MINOR 1)
set(${TYPES_LIBRARY_NAME_UPPER}_VERSION_PATCH 1)

string(CONCAT ${TYPES_LIBRARY_NAME_UPPER}_VERSION
  "${${TYPES_LIBRARY_NAME_UPPER}_VERSION_MAJOR}."
  "${${TYPES_LIBRARY_NAME_UPPER}_VERSION_MINOR}."
  "${${TYPES_LIBRARY_NAME_UPPER}_VERSION_PATCH}")

# Setting project description
string(CONCAT ${TYPES_PROJECT_NAME_UPPER}_DESCRIPTION
  "A simple, header-only C library designed to provide types with sizes.")

set(TYPES_INSTALL_DIR_NAME "${TYPES_PROJECT_NAME_LOWER}-v${${TYPES_LIBRARY_NAME_UPPER}_VERSION}")

# Creating the write_status function
function(write_status)
  set(STATUS_VARIABLE "")

  foreach(argument ${ARGV})
    set(STATUS_VARIABLE "${STATUS_VARIABLE}${argument}")
  endforeach()

  message(STATUS "[${TYPES_PROJECT_NAME_UPPER}] ${STATUS_VARIABLE}")
endfunction()

write_status("Initiating the project setup.")

# Generate compile commands for IDE's
set(CMAKE_EXPORT_COMPILE_COMMANDS ON CACHE INTERNAL "")

write_status("CMAKE_EXPORT_COMPILE_COMMANDS is set to: ${CMAKE_EXPORT_COMPILE_COMMANDS}")

# Setting the current user directory
if(CMAKE_HOST_SYSTEM_NAME STREQUAL "Windows")
  set(TYPES_CURRENT_USER_PATH "C:/Users/$ENV{USERNAME}")
else()
  set(TYPES_CURRENT_USER_PATH "/$ENV{USER}")
endif ()

write_status("Current user path: ${TYPES_CURRENT_USER_PATH}")

# Getting the build directory name from current binary directory
string(REPLACE "${CMAKE_SOURCE_DIR}/" "" TYPES_BUILD_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR})

# Setting the build library type name
if(BUILD_SHARED_LIBS)
  set(TYPES_BUILD_LIBRARY_TYPE "Shared")
else()
  set(TYPES_BUILD_LIBRARY_TYPE "Static")
endif()

# Setting the build directory name
string(FIND ${TYPES_BUILD_DIRECTORY} ${TYPES_BUILD_LIBRARY_TYPE} _TYPES_BUILD_LIBRARY_TYPE_EXISTS)

if(${_TYPES_BUILD_LIBRARY_TYPE_EXISTS} EQUAL -1)
  set(TYPES_BUILD_DIRECTORY "${TYPES_BUILD_DIRECTORY}-${TYPES_BUILD_LIBRARY_TYPE}")
endif()
