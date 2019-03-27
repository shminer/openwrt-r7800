#
# Copyright (C) 2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=linux-firmware
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2019-03-14
PKG_SOURCE_VERSION:=7bc246451318b3536d9bfd3c4e46d541a9831b33
PKG_MIRROR_HASH:=d5d3c5b5df95a8d51e1bb727b2b2063dcadb670391aba75df39499f630f1fa19
PKG_SOURCE_URL:=https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git

PKG_MAINTAINER:=Felix Fietkau <nbd@nbd.name>

SCAN_DEPS = *.mk

include $(INCLUDE_DIR)/package.mk

define Package/firmware-default
  SECTION:=firmware
  CATEGORY:=Firmware
  URL:=http://git.kernel.org/cgit/linux/kernel/git/firmware/linux-firmware.git
  TITLE:=$(1)
endef

define Build/Compile

endef

include $(wildcard ./*.mk)
#$(eval $(call BuildPackage,linux-firmware))
