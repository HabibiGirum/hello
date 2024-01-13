

set(OSQUERY_PACKAGE_RELEASE "1.macos")
set(CPACK_PACKAGE_FILE_NAME "${CPACK_PACKAGE_NAME}-${CPACK_PACKAGE_VERSION}_${OSQUERY_PACKAGE_RELEASE}_${CMAKE_SYSTEM_PROCESSOR}")
set(CPACK_SET_DESTDIR ON)

install(
  DIRECTORY
    "macpack/opt/osquery/osquery.app"

  DESTINATION
    "/opt/osquery/lib"

  USE_SOURCE_PERMISSIONS

  COMPONENT
    osquery
)

execute_process(
  COMMAND "${CMAKE_COMMAND}" -E create_symlink "macpack/opt/osquery/lib/osquery.app/Contents/MacOS/osqueryd" osqueryi
  WORKING_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}"
)

execute_process(
  COMMAND "${CMAKE_COMMAND}" -E create_symlink "macpack/opt/osquery/lib/osquery.app/Contents/Resources/osqueryctl" osqueryctl
  WORKING_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}"
)

install(
  FILES
    "${CMAKE_CURRENT_BINARY_DIR}/osqueryi"
    "${CMAKE_CURRENT_BINARY_DIR}/osqueryctl"
  
  DESTINATION
    "/usr/local/bin/"
  
  COMPONENT
    osquery
)

install(
  DIRECTORY "macpack/private/var/osquery"
  DESTINATION "macpack/private/var"
  COMPONENT osquery
)

install(
  DIRECTORY
  DESTINATION "macpack/private/var/log/osquery"
  COMPONENT osquery
)
