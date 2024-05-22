SUMMARY = "Meteor project, Cache as RAM benchmark"
DESCRIPTION = "Cache as RAM benchmark"
LICENSE = "MIT"

inherit cmake
inherit externalsrc
inherit gitsrcpv 

POKYROOT="${@os.path.abspath(os.path.join("${TOPDIR}", os.pardir))}"
EXTERNALSRC = "${POKYROOT}/build/workspace/sources/matrixmul"
OECMAKE_ARGS = "-DINCLUDE_DIRECTORIES=${RECIPE_SYSROOT}/usr/include -DLIBRARY_DIRECTORIES=${RECIPE_SYSROOT}/usr/lib "

PV = "${GITSRCPV}"

# Adding matrixmul to the list of packages
#PACKAGES =+ "${PN}"
FILES:${PN} = "/usr/local/bin/matrixmul"
#FILES:${PN} = "${localbindir}/matrixmul"

