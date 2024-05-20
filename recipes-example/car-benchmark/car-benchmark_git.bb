SUMMARY = "Meteor project, Cache as RAM benchmark"
DESCRIPTION = "Cache as RAM benchmark"
LICENSE = "MIT"

inherit cmake
inherit externalsrc
inherit gitsrcpv 

DEPENDS = "gnu-efi gnu-efi-native"

#SRC_URI = "git@github.com:a1miro/car-benchmark.git;protocol=ssh;branch=master"
POKYROOT="${@os.path.abspath(os.path.join("${TOPDIR}", os.pardir))}"
EXTERNALSRC = "${POKYROOT}/build/workspace/sources/car-benchmark"
OECMAKE_ARGS = "-DINCLUDE_DIRECTORIES=${RECIPE_SYSROOT}/usr/include -DLIBRARY_DIRECTORIES=${RECIPE_SYSROOT}/usr/lib "

PV = "${GITSRCPV}"
