$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
#$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product, build/target/product/full.mk)

$(call inherit-product, vendor/samsung/lt023g/lt023g-vendor.mk)

LOCAL_PATH := device/samsung/lt023g
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Enable higher-res drawables while keeping mdpi as primary source
PRODUCT_AAPT_CONFIG := large mdpi hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi
PRODUCT_LOCALES += mdpi

# API (for CTS backward compatibility)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.first_api_level=19

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Set property overrides
PRODUCT_PROPERTY_OVERRIDES += \
    ro.zygote.disable_gl_preload=true \
    ro.cm.hardware.cabc=/sys/class/mdnie/mdnie/cabc \
    ro.bq.gpu_to_cpu_unsupported=1 \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=30 \
    dalvik.vm.heapsize=128m

DEFAULT_PROPERTY_OVERRIDES += \
    ro.secure=0 \
    ro.allow.mock.location=1 \
    ro.debuggable=1 \
    persist.service.adb.enable=1 \
    persist.sys.usb.config=mtp,adb \
    sys.disable_ext_animation=1

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml	\
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml

# Charger
PRODUCT_PACKAGES += \
    charger \
    charger_res_images

# Graphics config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/graphics/gfx.cfg:system/etc/gfx.cfg \
    $(LOCAL_PATH)/configs/graphics/dms.cfg:system/etc/dms.cfg

# fstab:
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/fstab.pxa988:root/fstab.pxa988 \
    $(LOCAL_PATH)/rootdir/extra.fstab:recovery/root/etc/extra.fstab \
    $(LOCAL_PATH)/rootdir/twrp.fstab:recovery/root/etc/twrp.fstab

# init.rc's:
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/init.recovery.pxa988.rc:root/init.recovery.pxa988.rc \
    $(LOCAL_PATH)/rootdir/init.pxa988.rc:root/init.pxa988.rc \
    $(LOCAL_PATH)/rootdir/init.pxa988.usb.rc:root/init.pxa988.usb.rc \
    $(LOCAL_PATH)/rootdir/init.pxa988.tel.rc:root/init.pxa988.tel.rc

# Init files
PRODUCT_PACKAGES += \
    fstab.pxa988 \
    init.pxa988.rc \
    init.pxa988.usb.rc \
    ueventd.pxa988.rc

# uevent.rc
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/ueventd.pxa988.rc:root/ueventd.pxa988.rc

# Audio configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/configs/audio/audio_effects.conf:system/etc/audio_effects.conf

# Product specific Packages
PRODUCT_PACKAGES += \
    libsecril-client \
    rfkill \
    libMarvellWireless \
    libwpa_client

# Disable SELinux
PRODUCT_PROPERTY_OVERRIDES += \
    ro.boot.selinux=disabled

# GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gps/sirfgps.conf:system/etc/sirfgps.conf

# Misc
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    librs_jni


##
## Others
##
# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.r_submix.default

# Media Config
PRODUCT_COPY_FILES += \
		frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
		frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml

# OMX
PRODUCT_PACKAGES += \
    libion

# Power
PRODUCT_PACKAGES += \
    libxml2 \
    power.mrvl \
    powerhal.conf

# USB
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Wifi
PRODUCT_PACKAGES += \
    hostapd \
    MarvellWirelessDaemon \
    wpa_supplicant \
    wpa_supplicant.conf

$(call inherit-product, build/target/product/full_base.mk)

$(call inherit-product-if-exists, frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk)
$(call inherit-product-if-exists, vendor/marvell/generic/sd8787/FwImage/sd8787fw.mk)
$(call inherit-product-if-exists, vendor/marvell/generic/sd8787/sd8787.mk)
$(call inherit-product-if-exists, vendor/marvell/generic/sd8787/sd8787_modules.mk)


#hack for prebult kernel
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/prebuilt/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif
PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):prebuilt/kernel
