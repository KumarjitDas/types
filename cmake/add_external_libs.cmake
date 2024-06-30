# file: add_external_libs.cmake
# author: Kumarjit Das
# date: 2024-07-01
# brief: TYPES library cmake external libraries fetcher configuration.

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


# Fetch all the external libraries
include(FetchContent)

write_status("Adding external libraries.")

# Try to find the kdapi package first
find_package(kdapi 1.0.0 QUIET)

# If kdapi is not found, fetch it
if(NOT kdapi_FOUND)
  write_status("Fetching external library: kdapi")
  set(_KDAPI_LIB_URL "https://github.com/KumarjitDas/kdapi/releases/download/v1.0.0/kdapi-1.0.0.zip")

  if(TYPES_TARGET_OS STREQUAL "windows")
    if(TYPES_TARGET_ARCH STREQUAL "x64")
      set(_KDAPI_LIB_URL "https://github.com/KumarjitDas/kdapi/releases/download/v1.0.0/kdapi-v1.0.0-windows-x64.zip")
    elseif(TYPES_TARGET_ARCH STREQUAL "x86")
      set(_KDAPI_LIB_URL "https://github.com/KumarjitDas/kdapi/releases/download/v1.0.0/kdapi-v1.0.0-windows-x86.zip")
    endif()
  elseif(TYPES_TARGET_OS STREQUAL "linux")
    if(TYPES_TARGET_ARCH STREQUAL "x64")
      set(_KDAPI_LIB_URL "https://github.com/KumarjitDas/kdapi/releases/download/v1.0.0/kdapi-v1.0.0-linux-x64.zip")
    elseif(TYPES_TARGET_ARCH STREQUAL "x86")
      set(_KDAPI_LIB_URL "https://github.com/KumarjitDas/kdapi/releases/download/v1.0.0/kdapi-v1.0.0-linux-x86.zip")
    endif()
  endif()

  FetchContent_Declare(
    kdapi
    URL                        ${_KDAPI_LIB_URL}
    SOURCE_DIR                 ${CMAKE_BINARY_DIR}/external/kdapi
    DOWNLOAD_EXTRACT_TIMESTAMP TRUE
  )
  FetchContent_MakeAvailable(kdapi)

  set(KDAPI_CMAKE_DIR "${CMAKE_BINARY_DIR}/external/kdapi/lib/cmake")
  list(APPEND CMAKE_PREFIX_PATH ${KDAPI_CMAKE_DIR})

  find_package(kdapi 1.0.0 REQUIRED)
endif()

include_directories(${KDAPI_INCLUDE_DIR})

write_status("kdapi include directories added: ${KDAPI_INCLUDE_DIR}")
