# Compiler Information
set(CMAKE_C_COMPILER_LAUNCHER "ccache")
set(CMAKE_CXX_COMPILER_LAUNCHER "ccache")
set(COMPILER_PREFIX "${CMAKE_CURRENT_LIST_DIR}/../")
set(CMAKE_C_COMPILER "${COMPILER_PREFIX}/bin/clang")
set(CMAKE_CXX_COMPILER "${COMPILER_PREFIX}/bin/clang++")
set(CMAKE_LINKER "${COMPILER_PREFIX}/bin/lld")
list(APPEND CMAKE_SYSTEM_PREFIX_PATH ${COMPILER_PREFIX})

# Standard Library
include_directories(SYSTEM "${COMPILER_PREFIX}/include/c++/v1")
include_directories(SYSTEM "${COMPILER_PREFIX}/include")
add_compile_options(-nostdinc++)

# Linker
add_link_options(-stdlib=libc++)
add_link_options(-Wl,-rpath,${COMPILER_PREFIX}/lib)
add_link_options(-fuse-ld=lld)
add_link_options(-lc++abi)
add_link_options(-lc++experimental)


set(CMAKE_CXX_FLAGS_DEBUG "-O0")
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -fverbose-asm ")
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -g ")
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -DDEBUG")

set(CMAKE_CXX_FLAGS_RELEASE "-O3")
set(CMAKE_EXE_LINKER_FLAGS_RELEASE "${CMAKE_EXE_LINKER_FLAGS_RELEASE} -flto")

set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "-O3")
set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "${CMAKE_CXX_FLAGS_RELWITHDEBINFO} -g")
set(CMAKE_EXE_LINKER_FLAGS_RELWITHDEBINFO "${CMAKE_EXE_LINKER_FLAGS_RELWITHDEBINFO} -flto")

if(HPCSTACK_ENABLE_ALL_WARNINGS)
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Weverything")
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-c++98-compat")
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-c++98-compat-pedantic")
endif()
