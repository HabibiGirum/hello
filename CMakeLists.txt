cmake_minimum_required(VERSION 3.17.5)

project("Vistar")

set(OSQUERY_DATA_PATH "" CACHE PATH "osquery package data")
set(CPACK_PACKAGE_VERSION "" CACHE STRING "osquery package version")

set(CPACK_PACKAGE_VERSION "1.0.0")

set(CPACK_PACKAGE_DESCRIPTION "osquery is an operating system instrumentation toolchain.")
set(CPACK_COMPONENT_OSQUERY_DESCRIPTION "${CPACK_PACKAGE_DESCRIPTION}")
set(CPACK_PACKAGE_NAME "Vistar")

#######################

set(CPACK_PACKAGE_FILE_NAME "${CPACK_PACKAGE_NAME}-${CPACK_PACKAGE_VERSION}")
set(CPACK_COMMAND_PRODUCTBUILD "${CMAKE_CURRENT_SOURCE_DIR}/macOs/platform/macos/macpack/control/pkg/productbuild.sh")
set(CPACK_COMMAND_PKGBUILD "${CPACK_COMMAND_PRODUCTBUILD}")

# install(
  # FILES
    # "${CMAKE_CURRENT_SOURCE_DIR}/macOs/platform/macos/macpack/control/pkg/io.osquery.agent.conf"
    # "${CMAKE_CURRENT_SOURCE_DIR}/macOs/platform/macos/macpack/control/pkg/io.osquery.agent.plist"
# 
  # DESTINATION
    # "/private/var/Vistar"
# 
  # COMPONENT
    # Vistar
# )

include("macOs/platform/common.cmake")
include("macOs/platform/macos/productbuild.cmake")

#############

# include("osquery-packaging/platform/common.cmake")
# set(CPACK_PACKAGE_RELOCATABLE ON)
# set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_CURRENT_SOURCE_DIR}/macOs/platform/macos/macpack/control/LICENSE.txt")

# include("osquery-packaging/platform/macos/productbuild.cmake")

# Disable CPack license checking
# set(CPACK_SKIP_LICENSE_CHECK ON)

include(CPack)

cpack_add_component("Vistar"
  DISPLAY_NAME "Main binaries and tools"
  REQUIRED
)
