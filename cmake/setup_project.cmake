# file: setup_project.cmake
# author: Kumarjit Das
# date: 2024-06-29
# brief: TYPES library cmake project setup file.

# BSD 2-Clause License
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
set(KDAPI_PROJECT_NAME "types")
string(TOLOWER ${KDAPI_PROJECT_NAME} KDAPI_PROJECT_NAME_LOWER)
string(TOUPPER ${KDAPI_PROJECT_NAME} KDAPI_PROJECT_NAME_UPPER)

# Setting the main library name in both lower and upper-cases
set(KDAPI_LIBRARY_NAME "types")
string(TOUPPER ${KDAPI_LIBRARY_NAME} KDAPI_LIBRARY_NAME_UPPER)

# Setting project version
set(${KDAPI_LIBRARY_NAME_UPPER}_VERSION_MAJOR 1)
set(${KDAPI_LIBRARY_NAME_UPPER}_VERSION_MINOR 0)
set(${KDAPI_LIBRARY_NAME_UPPER}_VERSION_PATCH 0)

string(CONCAT ${KDAPI_LIBRARY_NAME_UPPER}_VERSION
  "${${KDAPI_LIBRARY_NAME_UPPER}_VERSION_MAJOR}."
  "${${KDAPI_LIBRARY_NAME_UPPER}_VERSION_MINOR}."
  "${${KDAPI_LIBRARY_NAME_UPPER}_VERSION_PATCH}")

# Setting project description
string(CONCAT ${KDAPI_PROJECT_NAME_UPPER}_DESCRIPTION
  "A simple, header-only C library designed to provide compile-time system information.")

set(KDAPI_INSTALL_DIR_NAME "${KDAPI_PROJECT_NAME_LOWER}-${${KDAPI_LIBRARY_NAME_UPPER}_VERSION}")

# Creating the write_status function
function(write_status)
  set(STATUS_VARIABLE "")

  foreach(argument ${ARGV})
    set(STATUS_VARIABLE "${STATUS_VARIABLE}${argument}")
  endforeach()

  message(STATUS "[${KDAPI_PROJECT_NAME_UPPER}] ${STATUS_VARIABLE}")
endfunction()

write_status("Initiating the project setup.")

# Generate compile commands for IDE's
set(CMAKE_EXPORT_COMPILE_COMMANDS ON CACHE INTERNAL "")

write_status("CMAKE_EXPORT_COMPILE_COMMANDS is set to: "
  ${CMAKE_EXPORT_COMPILE_COMMANDS})

# Setting the current user directory
if(CMAKE_HOST_SYSTEM_NAME STREQUAL "Windows")
  set(KDAPI_CURRENT_USER_PATH "C:/Users/$ENV{USERNAME}")
else()
  set(KDAPI_CURRENT_USER_PATH "/$ENV{USER}")
endif ()

write_status("Current user path: ${KDAPI_CURRENT_USER_PATH}")

# Getting the build directory name from current binary directory
string(REPLACE "${CMAKE_SOURCE_DIR}/"
  "" KDAPI_BUILD_DIRECTORY
  ${CMAKE_CURRENT_BINARY_DIR})

# Setting the build library type name
if(BUILD_SHARED_LIBS)
  set(KDAPI_BUILD_LIBRARY_TYPE "Shared")
else()
  set(KDAPI_BUILD_LIBRARY_TYPE "Static")
endif()

# Setting the build directory name
string(FIND ${KDAPI_BUILD_DIRECTORY} ${KDAPI_BUILD_LIBRARY_TYPE} _KDAPI_BUILD_LIBRARY_TYPE_EXISTS)

if(${_KDAPI_BUILD_LIBRARY_TYPE_EXISTS} EQUAL -1)
  set(KDAPI_BUILD_DIRECTORY "${KDAPI_BUILD_DIRECTORY}-${KDAPI_BUILD_LIBRARY_TYPE}")
endif()
