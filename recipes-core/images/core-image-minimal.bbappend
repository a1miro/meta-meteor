# Removing BusyBox
#PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}utils = "coreutils"
#PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libiconv = "libiconv"
#PREFERRED_PROVIDER_virtual/libc = "glibc"
#IMAGE_INSTALL:remove := "busybox"

EXTRA_IMAGE_FEATURES:append := "allow-empty-password allow-root-login bash-completion-pkgs \
 debug-tweaks package-management ssh-server-openssh tools-debug tools-profile "