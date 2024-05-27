# Removing BusyBox
#PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}utils = "coreutils"
#PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libiconv = "libiconv"
#PREFERRED_PROVIDER_virtual/libc = "glibc"
#IMAGE_INSTALL:remove := "busybox"

EXTRA_IMAGE_FEATURES:append := "allow-empty-password allow-root-login bash-completion-pkgs \
 debug-tweaks package-management ssh-server-openssh tools-debug tools-profile "

IMAGE_INSTALL:append = " tbb"

# To include OpenCL driver that might be needed when compiling SYCL programs, include:
IMAGE_INSTALL:append = " intel-compute-runtime intel-graphics-compiler"

# To install only runtime libraries, include:
IMAGE_INSTALL:append = " intel-oneapi-dpcpp-cpp-runtime intel-oneapi-dpcpp-cpp-runtime-dev"

# To install the toolchain, include:
IMAGE_INSTALL:append = " intel-oneapi-dpcpp-cpp intel-oneapi-dpcpp-cpp-dev"