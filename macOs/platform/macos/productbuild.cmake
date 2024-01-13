
set(CPACK_PACKAGE_FILE_NAME "${CPACK_PACKAGE_NAME}-${CPACK_PACKAGE_VERSION}")
set(CPACK_COMMAND_PRODUCTBUILD "${CMAKE_CURRENT_SOURCE_DIR}/macOs/platform/macos/macpack/control/pkg/productbuild.sh")
set(CPACK_COMMAND_PKGBUILD "${CPACK_COMMAND_PRODUCTBUILD}")

install(
  FILES
    "${CMAKE_CURRENT_SOURCE_DIR}/macOs/platform/macos/macpack/control/pkg/io.osquery.agent.conf"
    "${CMAKE_CURRENT_SOURCE_DIR}/macOs/platform/macos/macpack/control/pkg/io.osquery.agent.plist"

  DESTINATION
    "/private/var/osquery"

  COMPONENT
    osquery
)
