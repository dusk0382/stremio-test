set(VCPKG_TARGET_ARCHITECTURE x64)
set(VCPKG_CMAKE_SYSTEM_NAME Linux)
set(VCPKG_CRT_LINKAGE dynamic)
set(VCPKG_LIBRARY_LINKAGE static)
set(VCPKG_BUILD_TYPE release)
# bdver2 = AMD Piledriver (A4-5300B). The upstream triplet uses -march=x86-64-v3
# (AVX2/BMI2), which is illegal on this CPU; the static openssl/libtorrent built
# with it would crash the whole process the first time those paths ran.
set(VCPKG_C_FLAGS_RELEASE "-march=bdver2")
set(VCPKG_CXX_FLAGS_RELEASE "-march=bdver2")
