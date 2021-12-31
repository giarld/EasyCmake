
include(../../cmake/easy.cmake)

set(E_LIB_PUBLIC_INCLUDE_DIRS include/)
set(E_LIB_SRCS src/a.cpp)
set(E_LIB_IS_STATIC TRUE)

e_add_library(A)
