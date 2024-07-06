# file: add_external_libs.cmake
# author: Kumarjit Das
# date: 2024-07-06
# brief: TYPES library cmake external libraries fetcher configuration.

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


# Fetch all the external libraries
include(FetchContent)

write_status("Adding external libraries.")

set(_KDAPI_LIB kdapi)
set(_KDAPI_VER 1.2.0)

# Try to find the kdapi package first
find_package(${_KDAPI_LIB} ${_KDAPI_VER} QUIET)

# If kdapi is not found, fetch it
if(NOT ${_KDAPI_LIB}_FOUND)
  write_status("Fetching external library: ${_KDAPI_LIB}")
  set(_COMMON_DOWNLOAD_LINK "https://github.com/KumarjitDas/${_KDAPI_LIB}/releases/download/v${_KDAPI_VER}")
  set(_KDAPI_LIB_URL "${_COMMON_DOWNLOAD_LINK}/${_KDAPI_LIB}-${_KDAPI_VER}.zip")

  if(TYPES_TARGET_OS STREQUAL "windows")
    if(TYPES_TARGET_ARCH STREQUAL "x64")
      set(_KDAPI_LIB_URL "${_COMMON_DOWNLOAD_LINK}/${_KDAPI_LIB}-v${_KDAPI_VER}-windows-x64.zip")
    elseif(TYPES_TARGET_ARCH STREQUAL "x86")
      set(_KDAPI_LIB_URL "${_COMMON_DOWNLOAD_LINK}/${_KDAPI_LIB}-v${_KDAPI_VER}-windows-x86.zip")
    endif()
  elseif(TYPES_TARGET_OS STREQUAL "linux")
    if(TYPES_TARGET_ARCH STREQUAL "x64")
      set(_KDAPI_LIB_URL "${_COMMON_DOWNLOAD_LINK}/${_KDAPI_LIB}-v${_KDAPI_VER}-linux-x64.zip")
    elseif(TYPES_TARGET_ARCH STREQUAL "x86")
      set(_KDAPI_LIB_URL "${_COMMON_DOWNLOAD_LINK}/${_KDAPI_LIB}-v${_KDAPI_VER}-linux-x86.zip")
    endif()
  endif()

  FetchContent_Declare(
    ${_KDAPI_LIB}
    URL                        ${_KDAPI_LIB_URL}
    SOURCE_DIR                 ${CMAKE_BINARY_DIR}/external/${_KDAPI_LIB}
    DOWNLOAD_EXTRACT_TIMESTAMP TRUE
  )
  FetchContent_MakeAvailable(${_KDAPI_LIB})

  set(KDAPI_CMAKE_DIR "${CMAKE_BINARY_DIR}/external/${_KDAPI_LIB}/lib/cmake")
  list(APPEND CMAKE_PREFIX_PATH ${KDAPI_CMAKE_DIR})

  find_package(${_KDAPI_LIB} ${_KDAPI_VER} REQUIRED)
endif()

include_directories(${KDAPI_INCLUDE_DIR})

write_status("${_KDAPI_LIB} include directories added: ${KDAPI_INCLUDE_DIR}")
