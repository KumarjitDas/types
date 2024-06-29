# file: export_rules.cmake
# author: Kumarjit Das
# date: 2024-06-29
# brief: TYPES library cmake export rules file.

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


write_status("Generating ${KDAPI_PROJECT_NAME_LOWER}-targets.")

# Adding this to make cache variables for install destinations
include("GNUInstallDirs")

# Creating export target for the main library
install(TARGETS              ${KDAPI_LIBRARY_NAME}
        EXPORT               ${KDAPI_PROJECT_NAME_LOWER}-targets
        LIBRARY  DESTINATION "${KDAPI_INSTALL_DIR_NAME}/${CMAKE_INSTALL_LIBDIR}"
        ARCHIVE  DESTINATION "${KDAPI_INSTALL_DIR_NAME}/${CMAKE_INSTALL_LIBDIR}"
        RUNTIME  DESTINATION "${KDAPI_INSTALL_DIR_NAME}/${CMAKE_INSTALL_BINDIR}"
        INCLUDES DESTINATION "${KDAPI_INSTALL_DIR_NAME}/${CMAKE_INSTALL_INCLUDEDIR}")

# Setting the install location of the generated export target file
install(EXPORT      ${KDAPI_PROJECT_NAME_LOWER}-targets
        FILE        "${KDAPI_PROJECT_NAME_LOWER}-targets.cmake"
        NAMESPACE   KDAPI::
        DESTINATION "${KDAPI_INSTALL_DIR_NAME}/${CMAKE_INSTALL_LIBDIR}/${KDAPI_INSTALL_CMAKE_DIR}")

# Rule to export all the targets directly from the build-tree
export(
  EXPORT ${KDAPI_PROJECT_NAME_LOWER}-targets
  # FILE "${CMAKE_CURRENT_BINARY_DIR}/${KDAPI_PROJECT_NAME_LOWER}-targets.cmake"
  FILE "${PROJECT_BINARY_DIR}/${KDAPI_PROJECT_NAME_LOWER}-targets.cmake"
  NAMESPACE KDAPI::
)
