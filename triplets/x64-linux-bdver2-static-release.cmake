set(VCPKG_TARGET_ARCHITECTURE x64)
set(VCPKG_CMAKE_SYSTEM_NAME Linux)
set(VCPKG_CRT_LINKAGE dynamic)
set(VCPKG_LIBRARY_LINKAGE static)
set(VCPKG_BUILD_TYPE release)
# Target CPU: AMD A4-5300B (Trinity). Not -march=bdver2, because that emits
# XOP/FMA4/TBM which modern AMD/Intel hosts lack (the build machine would then
# crash on anything it executes), and not upstream's x86-64-v3 because AVX2/BMI2
# is illegal on this CPU. x86-64-v2 + AVX/FMA/F16C/BMI1/LZCNT runs on both.
set(VCPKG_C_FLAGS_RELEASE "-march=x86-64-v2 -mavx -mfma -mf16c -mbmi -mlzcnt")
set(VCPKG_CXX_FLAGS_RELEASE "-march=x86-64-v2 -mavx -mfma -mf16c -mbmi -mlzcnt")
