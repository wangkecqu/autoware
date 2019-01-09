set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_VERSION 1)
set(CMAKE_SYSTEM_PROCESSOR aarch64)
set(CMAKE_CROSSCOMPILING ON)
set(CMAKE_SYSROOT $ENV{AUTOWARE_SYSROOT})
set(CMAKE_PREFIX_PATH "${CMAKE_SYSROOT}/opt/ros/kinetic")

# specify the cross compiler
set(CMAKE_C_COMPILER "/usr/bin/${CMAKE_SYSTEM_PROCESSOR}-linux-gnu-gcc")
set(CMAKE_CXX_COMPILER "/usr/bin/${CMAKE_SYSTEM_PROCESSOR}-linux-gnu-g++")

set(_pkgconfig_paths)
list(APPEND _pkgconfig_paths "${CMAKE_SYSROOT}/usr/lib/${CMAKE_SYSTEM_PROCESSOR}-linux-gnu/pkgconfig")
list(APPEND _pkgconfig_paths "${CMAKE_SYSROOT}/usr/lib/openmpi/lib/pkgconfig")
list(APPEND _pkgconfig_paths "${CMAKE_SYSROOT}/usr/lib/pkgconfig")
list(APPEND _pkgconfig_paths "${CMAKE_SYSROOT}/usr/share/pkgconfig")
list(APPEND _pkgconfig_paths "${CMAKE_SYSROOT}/opt/ros/kinetic/lib/${CMAKE_SYSTEM_PROCESSOR}-linux-gnu/pkgconfig")
list(APPEND _pkgconfig_paths "${CMAKE_SYSROOT}/opt/ros/kinetic/lib/pkgconfig")
string(REPLACE ";" ":" _pkgconfig_paths "${_pkgconfig_paths}")
set(ENV{PKG_CONFIG_PATH} "${_pkgconfig_paths}")

# where is the target environment
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

# This assumes that pthread will be available on the target system
# (this emulates that the return of the TRY_RUN is a return code "0"
set(THREADS_PTHREAD_ARG "0"
  CACHE STRING "Result from TRY_RUN" FORCE)

set(CUDA_TOOLKIT_ROOT_DIR "$ENV{CUDA_TOOLKIT_ROOT_DIR}" CACHE STRING "" FORCE)
set(CUDA_TOOLKIT_ROOT_DIR_INTERNAL "${CUDA_TOOLKIT_ROOT_DIR}" CACHE STRING "" FORCE)
set(CUDA_TOOLKIT_TARGET_DIR "${CUDA_TOOLKIT_ROOT_DIR}/targets/aarch64-linux" CACHE STRING "" FORCE)
set(CUDA_TOOLKIT_TARGET_DIR_INTERNAL "${CUDA_TOOLKIT_TARGET_DIR}" CACHE STRING "" FORCE)
set(CUDA_TOOLKIT_INCLUDE "${CUDA_TOOLKIT_TARGET_DIR}/include/" CACHE STRING "" FORCE)

set(CUDA_CUDA_LIBRARY "${CUDA_TOOLKIT_TARGET_DIR}/lib/stubs/libcuda.so" CACHE STRING "" FORCE)
set(CUDA_CUDART_LIBRARY "${CUDA_TOOLKIT_TARGET_DIR}/lib/stubs/libcudart.so" CACHE STRING "" FORCE)
set(CUDA_cudart_static_LIBRARY "${CUDA_TOOLKIT_TARGET_DIR}/lib/libcudart_static.a" CACHE STRING "" FORCE)
set(CUDA_cublas_LIBRARY "${CUDA_TOOLKIT_TARGET_DIR}/lib/stubs/libcublas.so" CACHE STRING "" FORCE)
set(CUDA_cublasemu_LIBRARY "${CUDA_TOOLKIT_TARGET_DIR}/lib/stubs/libcublasemu.so" CACHE STRING "" FORCE)
set(CUDA_cufft_LIBRARY "${CUDA_TOOLKIT_TARGET_DIR}/lib/stubs/libcufft.so" CACHE STRING "" FORCE)
set(CUDA_cufftemu_LIBRARY "${CUDA_TOOLKIT_TARGET_DIR}/lib/stubs/libcufftemu.so" CACHE STRING "" FORCE)
set(CUDA_cupti_LIBRARY "${CUDA_TOOLKIT_TARGET_DIR}/lib/stubs/libcupti.so" CACHE STRING "" FORCE)
set(CUDA_curand_LIBRARY "${CUDA_TOOLKIT_TARGET_DIR}/lib/stubs/libcurand.so" CACHE STRING "" FORCE)
set(CUDA_cusolver_LIBRARY "${CUDA_TOOLKIT_TARGET_DIR}/lib/stubs/libcusolver.so" CACHE STRING "" FORCE)
set(CUDA_cusparse_LIBRARY "${CUDA_TOOLKIT_TARGET_DIR}/lib/stubs/libcusparse.so" CACHE STRING "" FORCE)
set(CUDA_npp_LIBRARY "${CUDA_TOOLKIT_TARGET_DIR}/lib/libnpp.so" CACHE STRING "" FORCE)
set(CUDA_nppc_LIBRARY "${CUDA_TOOLKIT_TARGET_DIR}/lib/libnppc.so" CACHE STRING "" FORCE)
set(CUDA_nppi_LIBRARY "${CUDA_TOOLKIT_TARGET_DIR}/lib/libnppi.so" CACHE STRING "" FORCE)
set(CUDA_npps_LIBRARY "${CUDA_TOOLKIT_TARGET_DIR}/lib/libnpps.so" CACHE STRING "" FORCE)
set(CUDA_nvcuvenc_LIBRARY "${CUDA_TOOLKIT_TARGET_DIR}/lib/libnvcuvenc.so" CACHE STRING "" FORCE)
set(CUDA_nvcuvid_LIBRARY "${CUDA_TOOLKIT_TARGET_DIR}/lib/libnvcuvid.so" CACHE STRING "" FORCE)

set(DRIVEWORKS_TOOLKIT_ROOT_DIR "$ENV{DRIVEWORKS_TOOLKIT_ROOT_DIR}" CACHE STRING "" FORCE)
set(DRIVEWORKS_TOOLKIT_TARGET_DIR "${DRIVEWORKS_TOOLKIT_ROOT_DIR}/targets/aarch64-linux" CACHE STRING "" FORCE)

set(NVIDIA_TENSORRT_ROOT_DIR "$ENV{NVIDIA_TENSORRT_ROOT_DIR}" CACHE STRING "" FORCE)
set(NVIDIA_TENSORRT_TARGET_DIR "${NVIDIA_TENSORRT_ROOT_DIR}/targets/aarch64-linux-gnu" CACHE STRING "" FORCE)

set(NVIDIA_DRIVE_SDK_ROOT_DIR "$ENV{NVIDIA_DRIVE_SDK_ROOT_DIR}" CACHE STRING "" FORCE)
set(NVIDIA_DRIVE_SDK_TARGET_DIR "${NVIDIA_DRIVE_SDK_ROOT_DIR}/targetfs" CACHE STRING "" FORCE)

set(DRIVE_T186REF_LINUX_ROOT_DIR "$ENV{DRIVE_T186REF_LINUX_ROOT_DIR}" CACHE STRING "" FORCE)

set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -L${CUDA_TOOLKIT_TARGET_DIR}/lib" CACHE STRING "" FORCE)
set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -L${DRIVEWORKS_TOOLKIT_TARGET_DIR}/lib" CACHE STRING "" FORCE)
set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -L${DRIVEWORKS_TOOLKIT_TARGET_DIR}/lib/stubs" CACHE STRING "" FORCE)
set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -L${NVIDIA_DRIVE_SDK_TARGET_DIR}/usr/lib" CACHE STRING "" FORCE)
set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -L${NVIDIA_TENSORRT_TARGET_DIR}/lib" CACHE STRING "" FORCE)
