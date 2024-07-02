# file: set_include_directories.cmake
# author: Kumarjit Das
# date: 2024-07-01
# brief: TYPES library cmake include directory configuration file.

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


# Setting the relative include path
set(RELATIVE_INCLUDE_DIR_PATH "." CACHE PATH
  "Public include directories of this project.")

target_include_directories(
  ${TYPES_LIBRARY_NAME} INTERFACE

  # Adding include directory for public inclusion
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/${RELATIVE_INCLUDE_DIR_PATH}>

  # Adding the current binary directory to include path to include the
  # generated export header and configured version header
  $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}>

  # Setting the install location of the above include files
  $<INSTALL_INTERFACE:include>
)

write_status("Setting public include directory: ${CMAKE_CURRENT_SOURCE_DIR}/${RELATIVE_INCLUDE_DIR_PATH}")

# Include kdapi include directories
install(DIRECTORY ${KDAPI_INCLUDE_DIR} DESTINATION "${TYPES_INSTALL_DIR_NAME}")
