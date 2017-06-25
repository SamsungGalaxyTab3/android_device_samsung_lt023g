# Copyright (C) 2013 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
LOCAL_PATH := device/samsung/lt023g

#Target info
BOARD_HAS_NO_SELECT_BUTTON := true

# MRVL hardware
BOARD_USES_MRVL_HARDWARE := true

# inherit from the proprietary version
-include vendor/samsung/lt023g/BoardConfigVendor.mk

# Not Yet
#TARGET_BOARD_INFO_FILE := $(LOCAL_PATH)/board-info.txt

# Architecture
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_BOARD_PLATFORM := mrvl
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a9
TARGET_CPU_SMP := true

TARGET_BOOTLOADER_BOARD_NAME := PXA988
ARCH_ARM_HAVE_TLS_REGISTER := true

#Assert
TARGET_OTA_ASSERT_DEVICE := lt023g,lt02,SM-T211

# Flags (removed, shifted to vendor files. INCLUDE_MARVELL_FLAGS present in vendor )
INCLUDE_MARVELL_FLAGS := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

# Kernel
TARGET_KERNEL_SOURCE := kernel/samsung/lt02
TARGET_KERNEL_CONFIG := lt023g_defconfig
BOARD_KERNEL_CMDLINE := androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x10000000
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01000000
BOARD_KERNEL_PAGESIZE := 2048
##prebuilt kernel in case of no source
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/prebuilt/kernel

# Partitions
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 12582912
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 12582912
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1507852288
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5775556608
BOARD_FLASH_BLOCK_SIZE := 4096
BOARD_UMS_LUNFILE := "/sys/class/android_usb/f_mass_storage/lun0/file"
BOARD_USES_MMCUTILS := true
BOARD_HAS_NO_MISC_PARTITION := true

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := "RGB_565"
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/fstab.pxa988
RECOVERY_FSTAB_VERSION := 2
BOARD_RECOVERY_SWIPE := true
#TARGET_RECOVERY_DEVICE_DIRS += $(LOCAL_PATH)
#TARGET_RECOVERY_INITRC := $(LOCAL_PATH)/rootdir/init.pxa988.rc
#TARGET_USERIMAGES_USE_EXT4 := true

# Init
TARGET_PROVIDES_INIT := true
TARGET_PROVIDES_INIT_TARGET_RC := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_MRVL := true
MRVL_WIRELESS_DAEMON_API := true
USE_BLUETOOTH_SAP := false

# Camera
USE_CAMERA_STUB := true
TARGET_HAS_LEGACY_CAMERA_HAL1 := true

# WiFi
BOARD_HAVE_MARVELL_WIFI := true
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_mrvl
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_mrvl
BOARD_WLAN_DEVICE := mrvl
WIFI_DRIVER_FW_PATH_PARAM := "/proc/mwlan/config"
WIFI_DRIVER_FW_PATH_STA := "/system/etc/firmware/mrvl/sd8787_uapsta.bin"
WIFI_DRIVER_FW_PATH_AP := "/system/etc/firmware/mrvl/sd8787_uapsta.bin"
WIFI_DRIVER_FW_PATH_P2P := "/system/etc/firmware/mrvl/sd8787_uapsta.bin"
CONFIG_CTRL_IFACE := true

# Vold
BOARD_VOLD_MAX_PARTITIONS := 17
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_DISC_HAS_MULTIPLE_MAJORS := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/class/android_usb/f_mass_storage/lun%d/file"

# Graphics
VSYNC_EVENT_PHASE_OFFSET_NS := 0
BOARD_HAVE_PIXEL_FORMAT_INFO := true
BOARD_USE_BGRA_8888 := true
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := $(LOCAL_PATH)/configs/egl.cfg
#COMMON_GLOBAL_FLAGS += -DSK_SUPPORT_LEGACY_SETCONFIG

# Audio
#BOARD_USES_ALSA_AUDIO := true
#BUILD_WITH_ALSA_UTILS := true
#BOARD_HAVE_PRE_KITKAT_AUDIO_BLOB := true

# Webkit
ENABLE_WEBGL := true
BOARD_USE_SKIA_LCDTEXT := true
BOARD_NEEDS_CUTILS_LOG := true
BOARD_HAVE_PIXEL_FORMAT_INFO := true
BOARD_USES_HWCOMPOSER := true
#TARGET_FORCE_CPU_UPLOAD := true

TARGET_HARDWARE_3D := false

BOARD_ENABLE_MULTI_DISPLAYS := true

#Generic config
MRVL_ION := true

# The above lines are almost the same as Brownstone.
# MMP3 Special
BOARD_USE_VIVANTE_GRALLOC := true
HDMI_SUPPORT_3D := true

#BOARD_GFX_DRIVER_VERSION=4x

#Enable marvell interface in SurfaceFlinger
MRVL_INTERFACE_ANIMATION := true
#ENABLE_HWC_GC_PATH := true

#Launch DMS in SurfaceFlinger process
MRVL_LAUNCH_DMS_IN_SURFACEFLINGER := true

TARGET_FORCE_CPU_UPLOAD := true

# Charger
BACKLIGHT_PATH := "/sys/class/backlight/panel/brightness"
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/class/power_supply/battery/batt_lp_charging
BOARD_CHARGER_SHOW_PERCENTAGE := true
CHARGING_ENABLED_PATH := "/sys/class/power_supply/battery/batt_lp_charging"
#BOARD_CHARGER_RES := $(LOCAL_PATH)/res/charger

TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include

# Sec_touchscreen
INPUT_TOUCH_DRIVER := TOUCH_LT

# Compatibility with pre-kitkat Sensor HALs
SENSORS_NEED_SETRATE_ON_ENABLE := true

# SELinux
BOARD_SEPOLICY_DIRS += \
    $(LOCAL_PATH)/sepolicy

##
## Extras
##

# Bootanimation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true

# CMHW
BOARD_HARDWARE_CLASS += hardware/samsung/cmhw

# Malloc
MALLOC_SVELTE := true

# MRVL
BOARD_USES_MARVELL_HWC_ENHANCEMENT := true
#COMMON_GLOBAL_CFLAGS += -DMARVELL_HWC_ENHANCEMENT


#TWRP
TW_THEME := landscape_mdpi
DEVICE_RESOLUTION := 1024x600
RECOVERY_SDCARD_ON_DATA := true
TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
BOARD_HAS_NO_REAL_SDCARD := true
SP1_NAME := "efs"
SP1_BACKUP_METHOD := files
TW_NO_USB_STORAGE := true
TW_INCLUDE_FUSE_EXFAT := true
HAVE_SELINUX := true
TW_NO_REBOOT_BOOTLOADER := true
TW_HAS_DOWNLOAD_MODE := true
TW_MAX_BRIGHTNESS := 255
TW_BRIGHTNESS_PATH := /sys/class/backlight/panel/brightness
