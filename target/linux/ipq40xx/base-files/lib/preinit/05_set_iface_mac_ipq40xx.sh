#!/bin/sh

. /lib/functions.sh

preinit_set_mac_address() {
	local wan_mac
	local lan14_mac
	local lan_mac

	case $(board_name) in
	asus,map-ac2200)
		base_mac=$(mtd_get_mac_binary_ubi Factory 4102)
		ip link set dev eth0 address $(macaddr_add "$base_mac" +1)
		ip link set dev eth1 address $(macaddr_add "$base_mac" +3)
		;;
	asus,rt-ac58u)
		CI_UBIPART=UBI_DEV
		wan_mac=$(mtd_get_mac_binary_ubi Factory 20486)
		lan14_mac=$(mtd_get_mac_binary_ubi Factory 4102)
		;;
	meraki,mr33)
		lan_mac=$(get_mac_binary "/sys/bus/i2c/devices/0-0050/eeprom" 102)
		;;
	zyxel,nbg6617)
		base_mac=$(cat /sys/class/net/eth0/address)
		ip link set dev eth0 address $(macaddr_add "$base_mac" +2)
		ip link set dev eth1 address $(macaddr_add "$base_mac" +3)
	esac

	[ -n "$lan_mac" ] && ip link set dev lan address "$lan_mac"
	[ -n "$wan_mac" ] && ip link set dev wan address "$wan_mac"
	[ -n "$lan14_mac" ] && {
		ip link set dev lan1 address "$lan14_mac"
		ip link set dev lan2 address "$lan14_mac"
		ip link set dev lan3 address "$lan14_mac"
		ip link set dev lan4 address "$lan14_mac"
	}
}

boot_hook_add preinit_main preinit_set_mac_address
