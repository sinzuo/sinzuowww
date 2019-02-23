#新增设备过程
[新增设备](https://github.com/coolsnowwolf/lede/pull/1060/commits/db9c47daf9f62382713094bd77aefc646e5b96ba)

Add Xiaomi Router 4 support.

Hardware is the same as mir3g
except:
ram 256M ->  128M
switch  lan 2 3  wan 1 ->  lan 1 2 wan 4
phorcys
phorcys committed 5 days ago
commit db9c47daf9f62382713094bd77aefc646e5b96ba
     
2  package/boot/uboot-envtools/files/ramips
@@ -30,7 +30,7 @@ wsr-600|\
zbt-wg2626)
	ubootenv_add_uci_config "/dev/mtd1" "0x0" "0x1000" "0x10000"
	;;
mir3g)
mir3g|mir4)
	ubootenv_add_uci_config "/dev/mtd1" "0x0" "0x1000" "0x20000"
	;;
esac
     
5  target/linux/ramips/base-files/etc/board.d/01_leds
@@ -228,6 +228,11 @@ mir3g)
	ucidef_set_led_switch "lan1-amber" "LAN1 (amber)" "$boardname:amber:lan1" "switch0" "0x08" "0x08"
	ucidef_set_led_switch "lan2-amber" "LAN2 (amber)" "$boardname:amber:lan2" "switch0" "0x04" "0x08"
	;;
mir4)
	ucidef_set_led_switch "wan-amber"  "WAN (amber)"  "$boardname:amber:wan"  "switch0" "0x08" "0x08"
	ucidef_set_led_switch "lan1-amber" "LAN1 (amber)" "$boardname:amber:lan1" "switch0" "0x01" "0x08"
	ucidef_set_led_switch "lan2-amber" "LAN2 (amber)" "$boardname:amber:lan2" "switch0" "0x02" "0x08"
	;;
mlw221|\
mlwg2)
	set_wifi_led "$boardname:blue:wifi"
     
8  target/linux/ramips/base-files/etc/board.d/02_network
@@ -181,6 +181,10 @@ ramips_setup_interfaces()
		ucidef_add_switch "switch0" \
			"2:lan:2" "3:lan:1" "1:wan" "6t@eth0"
		;;
	mir4)
		ucidef_add_switch "switch0" \
			"1:lan:1" "2:lan:2" "4:wan" "6t@eth0"
		;;		
	psg1218b)
		ucidef_add_switch "switch0" \
			"0:lan:3" "1:lan:2" "2:lan:1" "3:wan" "6@eth0"
@@ -543,6 +547,10 @@ ramips_setup_macs()
	mir3g)
		lan_mac=$(mtd_get_mac_binary Factory 0xe006)
		;;
	mir4)
		lan_mac=$(mtd_get_mac_binary Factory 0xe006)
		wan_mac=$(mtd_get_mac_binary Factory 0xe000)
		;;
	miwifi-mini)
		wan_mac=$(cat /sys/class/net/eth0/address)
		lan_mac=$(macaddr_setbit_la "$wan_mac")
     
3  target/linux/ramips/base-files/lib/ramips.sh
@@ -280,6 +280,9 @@ ramips_board_detect() {
	*"Mi Router 3G")
		name="mir3g"
		;;
	*"Mi Router 4")
		name="mir4"
		;;		
	*"MicroWRT")
		name="microwrt"
		;;
     
1  target/linux/ramips/base-files/lib/upgrade/platform.sh
@@ -37,6 +37,7 @@ platform_do_upgrade() {
	case "$board" in
	hc5962|\
	mir3g|\
	mir4|\
	r6220|\
	netgear,r6350|\
	ubnt-erx|\
     
194  target/linux/ramips/dts/MIR4.dts
@@ -0,0 +1,194 @@
/dts-v1/;

#include "mt7621.dtsi"

#include <dt-bindings/gpio/gpio.h>
#include <dt-bindings/input/input.h>

/ {
	compatible = "xiaomi,mir4", "mediatek,mt7621-soc";
	model = "Xiaomi Mi Router 4";

	aliases {
		led-boot = &led_status_blue;
		led-failsafe = &led_status_blue;
		led-running = &led_status_blue;
		led-upgrade = &led_status_blue;
	};

	memory@0 {
		device_type = "memory";
		reg = <0x0 0x8000000>;
	};

	chosen {
		bootargs = "console=ttyS0,115200n8";
	};

	gpio-leds {
		compatible = "gpio-leds";

		status_red {
			label = "mir3g:red:status";
			gpios = <&gpio0 6 GPIO_ACTIVE_LOW>;
		};

		led_status_blue: status_blue {
			label = "mir3g:blue:status";
			gpios = <&gpio0 8 GPIO_ACTIVE_LOW>;
		};

		status_yellow {
			label = "mir3g:yellow:status";
			gpios = <&gpio0 10 GPIO_ACTIVE_LOW>;
		};

		wan_amber {
			label = "mir3g:amber:wan";
			gpios = <&gpio0 13 GPIO_ACTIVE_LOW>;
		};

		lan1_amber {
			label = "mir3g:amber:lan1";
			gpios = <&gpio0 14 GPIO_ACTIVE_LOW>;
		};

		lan2_amber {
			label = "mir3g:amber:lan2";
			gpios = <&gpio0 16 GPIO_ACTIVE_LOW>;
		};
	};

	gpio-keys-polled {
		compatible = "gpio-keys-polled";
		poll-interval = <20>;

		reset {
			label = "reset";
			gpios = <&gpio0 18 GPIO_ACTIVE_LOW>;
			linux,code = <KEY_RESTART>;
		};
	};
};

&nand {
	status = "okay";

	partitions {
		compatible = "fixed-partitions";
		#address-cells = <1>;
		#size-cells = <1>;

		partition@0 {
			label = "Bootloader";
			reg = <0x0 0x80000>;
			read-only;
		};

		partition@80000 {
			label = "Config";
			reg = <0x80000 0x40000>;
		};

		partition@c0000 {
			label = "Bdata";
			reg = <0xc0000 0x40000>;
			read-only;
		};

		factory: partition@100000 {
			label = "Factory";
			reg = <0x100000 0x40000>;
			read-only;
		};

		partition@140000 {
			label = "crash";
			reg = <0x140000 0x40000>;
		};

		partition@180000 {
			label = "crash_syslog";
			reg = <0x180000 0x40000>;
		};

		partition@1c0000 {
			label = "reserved0";
			reg = <0x1c0000 0x40000>;
			read-only;
		};

		/* uboot expects to find kernels at 0x200000 & 0x600000
		 * referred to as system 1 & system 2 respectively.
		 * a kernel is considered suitable for handing control over
		 * if its linux magic number exists & uImage CRC are correct.
		 * If either of those conditions fail, a matching sys'n'_fail flag
		 * is set in uboot env & a restart performed in the hope that the
		 * alternate kernel is okay.
		 * if neither kernel checksums ok and both are marked failed, system 2
		 * is booted anyway.
		 *
		 * Note uboot's tftp flash install writes the transferred
		 * image to both kernel partitions.
		 */

		partition@200000 {
			label = "kernel_stock";
			reg = <0x200000 0x400000>;
		};

		partition@600000 {
			label = "kernel";
			reg = <0x600000 0x400000>;
		};

		/* ubi partition is the result of squashing
		 * next consecutive stock partitions:
		 * - rootfs0 (rootfs partition for stock kernel0),
		 * - rootfs1 (rootfs partition for stock failsafe kernel1),
		 * - overlay (used as ubi overlay in stock fw)
		 * resulting 117,5MiB space for packages.
		 */

		partition@a00000 {
			label = "ubi";
			reg = <0xa00000 0x7580000>;
		};
	};
};

&pcie {
	status = "okay";
};

&pcie0 {
	wifi@0,0 {
		compatible = "pci14c3,7603";
		reg = <0x0000 0 0 0 0>;
		mediatek,mtd-eeprom = <&factory 0x0000>;
		ieee80211-freq-limit = <2400000 2500000>;
	};
};

&pcie1 {
	wifi@0,0 {
		compatible = "pci14c3,7662";
		reg = <0x0000 0 0 0 0>;
		mediatek,mtd-eeprom = <&factory 0x8000>;
		ieee80211-freq-limit = <5000000 6000000>;
	};
};

&ethernet {
	mtd-mac-address = <&factory 0xe000>;
	mediatek,portmap = "lwlll";
};

&pinctrl {
	state_default: pinctrl0 {
		gpio {
			ralink,group = "jtag", "uart2", "uart3", "wdt";
			ralink,function = "gpio";
		};
	};
};
     
20  target/linux/ramips/image/mt7621.mk
@@ -254,6 +254,26 @@ define Device/mir3g
endef
TARGET_DEVICES += mir3g

define Device/mir4
  DTS := MIR4
  BLOCKSIZE := 128k
  PAGESIZE := 2048
  KERNEL_SIZE := 4096k
  IMAGE_SIZE := 32768k
  UBINIZE_OPTS := -E 5
  IMAGES += kernel1.bin rootfs0.bin factory.bin
  IMAGE/kernel1.bin := append-kernel
  IMAGE/rootfs0.bin := append-ubi | check-size $$$$(IMAGE_SIZE)
  IMAGE/sysupgrade.bin := sysupgrade-tar | append-metadata
  IMAGE/factory.bin := append-kernel | pad-to $$(KERNEL_SIZE) |append-kernel | pad-to $$(KERNEL_SIZE)| append-ubi | check-size $$$$(IMAGE_SIZE)
  DEVICE_TITLE := Xiaomi Mi Router 4
  SUPPORTED_DEVICES += R4
  DEVICE_PACKAGES := \
	kmod-mt7603 kmod-mt76x2 kmod-usb3 wpad-basic \
	uboot-envtools
endef
TARGET_DEVICES += mir4

define Device/mt7621
  DTS := MT7621
  BLOCKSIZE := 64k