#inherit gitsrcpv

FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://0001-calibrate-Add-printk-example.patch"
SRC_URI += "file://nr_cpus_config.cfg"

PV = "${LINUX_VERSION}-7-g8ea792141019"