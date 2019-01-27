include(${CMAKE_CURRENT_LIST_DIR}/../../../compiler/llvm-7.0/etc/compiler.cmake)
set(INSTALL_PREFIX "${CMAKE_CURRENT_LIST_DIR}/../")
list(APPEND CMAKE_SYSTEM_PREFIX_PATH ${INSTALL_PREFIX})
include_directories(SYSTEM "${INSTALL_PREFIX}/include")
link_directories(AFTER "${INSTALL_PREFIX}/lib")

# Library Specific Variables
set(Boost_ROOT ${INSTALL_PREFIX})
set(nlohmann_json_ROOT ${INSTALL_PREFIX})
