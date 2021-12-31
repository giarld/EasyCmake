
# 快速初始化cmake工程
function(e_init_cmake)
    if (NOT CMAKE_SIZEOF_VOID_P)
        if (CMAKE_CL_64)
            set(CMAKE_SIZEOF_VOID_P 8)
        else ()
            set(CMAKE_SIZEOF_VOID_P 4)
        endif ()
    endif ()

    if (NOT CMAKE_BUILD_TYPE)
        message(FATAL_ERROR "CMAKE_BUILD_TYPE must be a valid value")
    endif ()
endfunction(e_init_cmake)


# 增加库
# 额外依赖参数：
# E_LIB_PUBLIC_INCLUDE_DIRS     -- 库依赖的公开头文件目录列表
# E_LIB_PRIVATE_INCLUDE_DIRS    -- 库依赖的私有头文件目录列表
# E_LIB_SRCS                    -- 库依赖的源码文件列表
# E_LIB_LINK_LIBRARIES          -- 库需要链接的库列表
# E_LIB_DEPENDS_TARGETS         -- 库依赖的目标列表
# E_LIB_IS_STATIC               -- 库编译为静态库（默认编译为动态库）
#
function(e_add_library TARGET_NAME)
    if (E_LIB_IS_STATIC)
        set(E_BUILD_LIB_TYPE "STATIC")
    else ()
        set(E_BUILD_LIB_TYPE "SHARED")
    endif ()

    add_library(${TARGET_NAME} ${E_BUILD_LIB_TYPE} ${E_LIB_SRCS})

    if (E_LIB_LINK_LIBRARIES)
        target_link_libraries(${TARGET_NAME} ${E_LIB_LINK_LIBRARIES})
    endif ()
    if (E_LIB_PRIVATE_INCLUDE_DIRS)
        target_include_directories(${TARGET_NAME} PRIVATE ${E_LIB_PRIVATE_INCLUDE_DIRS})
    endif ()
    if (E_LIB_PUBLIC_INCLUDE_DIRS)
        target_include_directories(${TARGET_NAME} PUBLIC ${E_LIB_PUBLIC_INCLUDE_DIRS})
    endif ()
    if (E_LIB_DEPENDS_TARGETS)
        add_dependencies(${TARGET_NAME} ${E_LIB_DEPENDS_TARGETS})
    endif ()
endfunction(e_add_library)
