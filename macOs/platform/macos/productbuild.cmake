
set(CPACK_PACKAGE_FILE_NAME "${CPACK_PACKAGE_NAME}-${CPACK_PACKAGE_VERSION}")
set(CPACK_COMMAND_PRODUCTBUILD "macOs/platform/macos/macpack/control/pkg/productbuild.sh")
set(CPACK_COMMAND_PKGBUILD "${CPACK_COMMAND_PRODUCTBUILD}")

install(
  FILES
    "macOs/platform/macos/macpack/control/pkg/io.osquery.agent.conf"
    "macOs/platform/macos/macpack/control/pkg/io.osquery.agent.plist"

  DESTINATION
    "/private/var/osquery"

  COMPONENT
    osquery
)
