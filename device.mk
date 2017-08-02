# Dalvik heap configurations
$(call inherit-product-if-exists, frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk)

# Call hwui memory config(needs to be taken a look at.)
#$(call inherit-product-if-exists, frameworks/native/build/tablet-7in-hdpi-1024-hwui-memory.mk)

# Vendor
$(call inherit-product, vendor/samsung/lt023g/lt023g-vendor.mk)

LOCAL_PATH := device/samsung/lt023g

# Overlay Path
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

PRODUCT_CHARACTERISTICS := tablet

# Screen Density Enable higher-res drawables while keeping mdpi as primary source
PRODUCT_AAPT_CONFIG := large mdpi hdpi xhdpi
PRODUCT_AAPT_PREBUILT_DPI := large xxxhdpi xxhdpi xhdpi hdpi ldpi mdpi hdpi nodpi
PRODUCT_AAPT_PREF_CONFIG := mdpi
PRODUCT_LOCALES += mdpi

#Assert
TARGET_OTA_ASSERT_DEVICE := lt023g,lt02,SM-T211,lt02wifi,SM-T210

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
    ro.adb.secure=0 \
    ro.allow.mock.location=1 \
    ro.debuggable=1 \
    persist.service.adb.enable=1 \
    persist.sys.usb.config=mtp,adb \
    sys.disable_ext_animation=1


##
## Config Files
##

# Permissions
PRODUCT_COPY_FILES += \
		frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
		frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
		frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml	\
		frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
		$(LOCAL_PATH)/configs/permissions/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
		$(LOCAL_PATH)/configs/permissions/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
		$(LOCAL_PATH)/configs/permissions/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    $(LOCAL_PATH)/configs/permissions/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \

# fstab:
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/fstab.pxa988:root/fstab.pxa988 \
    $(LOCAL_PATH)/rootdir/extra.fstab:recovery/root/etc/extra.fstab \
    $(LOCAL_PATH)/rootdir/twrp.fstab:recovery/root/etc/twrp.fstab

# init.rc's:
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/init.recovery.pxa988.rc:root/init.recovery.pxa988.rc \
    $(LOCAL_PATH)/rootdir/init.pxa988.rc:root/init.pxa988.rc \
    $(LOCAL_PATH)/rootdir/charger_fix.sh:root/charger_fix.sh \
    $(LOCAL_PATH)/rootdir/init.pxa988.usb.rc:root/init.pxa988.usb.rc \
    $(LOCAL_PATH)/rootdir/init.pxa988.tel.rc:root/init.pxa988.tel.rc \
    $(LOCAL_PATH)/rootdir/ueventd.pxa988.rc:root/ueventd.pxa988.rc

#fake init.rc's and fstab
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/fstab.pxa988:root/fstab.unknown \
    $(LOCAL_PATH)/rootdir/init.recovery.pxa988.rc:root/init.recovery.unknown.rc \
    $(LOCAL_PATH)/rootdir/init.pxa988.rc:root/init.unknown.rc \
    $(LOCAL_PATH)/rootdir/init.pxa988.usb.rc:root/init.unknown.usb.rc \
    $(LOCAL_PATH)/rootdir/init.pxa988.tel.rc:root/init.unknown.tel.rc \
    $(LOCAL_PATH)/rootdir/ueventd.pxa988.rc:root/ueventd.unknown.rc

# uevent.rc
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/ueventd.pxa988.rc:root/ueventd.pxa988.rc

# Audio configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/configs/audio/audio_effects.conf:system/etc/audio_effects.conf \
    $(LOCAL_PATH)/configs/audio/asound.conf:system/etc/asound.conf

# GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gps/sirfgps.conf:system/etc/sirfgps.conf

# Graphics config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/graphics/gfx.cfg:system/etc/gfx.cfg \
    $(LOCAL_PATH)/configs/graphics/dms.cfg:system/etc/dms.cfg

# hostapd
PRODUCT_COPY_FILES += \
		$(LOCAL_PATH)/configs/hostapd/hostapd.accept:system/etc/hostapd/hostapd.accept \
    $(LOCAL_PATH)/configs/hostapd/hostapd.deny:system/etc/hostapd/hostapd.deny \
    $(LOCAL_PATH)/configs/hostapd/hostapd_default.conf:system/etc/hostapd/hostapd_default.conf

# Media Config
PRODUCT_COPY_FILES += \
		frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
		frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    $(LOCAL_PATH)/configs/media/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_performance.xml:system/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/configs/media/mixer_paths.xml:system/etc/mixer_paths.xml

# Wifi
PRODUCT_COPY_FILES += \
		$(LOCAL_PATH)/configs/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
		$(LOCAL_PATH)/configs/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

# Disable SELinux
PRODUCT_PROPERTY_OVERRIDES += \
    ro.boot.selinux=disabled

##
## Packages
##

# Audio
PRODUCT_PACKAGES += \
    audiod \
    audio.a2dp.default \
    audio.primary.default \
    audio.r_submix.default \
    audio.usb.default \
    libaudio-resampler

# Charger
PRODUCT_PACKAGES += \
    charger \
    libold_shim

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    librs_jni

# Init files
PRODUCT_PACKAGES += \
    fstab.pxa988 \
    charger_fix.sh \
    init.pxa988.rc \
    init.pxa988.usb.rc \
    ueventd.pxa988.rc

# IPv6 tethering
PRODUCT_PACKAGES += \
    SamsungServiceMode \
    ebtables \
    ethertypes \
    libebtc

# Product specific Packages
PRODUCT_PACKAGES += \
    libsecril-client \
    rfkill \
    libMarvellWireless \
    libwpa_client

# OMX
PRODUCT_PACKAGES += \
    libion \
    libc2dcolorconvert \
    libdivxdrmdecrypt \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVdecHevc \
    libOmxVenc \
    libstagefrighthw \
    libdashplayer

# Power
PRODUCT_PACKAGES += \
    libxml2 \
    power.mrvl \
    powerhal.conf

# Product specific Packages
PRODUCT_PACKAGES += \
    busybox \
    libsecril-client

# Basic
PRODUCT_PACKAGES += \
    static_busybox

# SoftAP
PRODUCT_PACKAGES += \
    libcurl \
    libqsap_sdk \
    libnetcmdiface \
    libQWiFiSoftApCfg

# TinyAlsa utils
PRODUCT_PACKAGES += \
    tinyplay \
    tinycap \
    tinymix \
    tinypcminfo

# USB
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Wifi | WPA supplicant
PRODUCT_PACKAGES += \
    dhcpcd.conf \
    hostapd.accept \
    hostapd.deny \
    hostapd_default.conf \
    hostapd \
    libwpa_client \
    MarvellWirelessDaemon \
    wpa_supplicant \
    wpa_supplicant.conf

# WCNSS service daemon
PRODUCT_PACKAGES += \
    libwebviewchromium_plat_support \
    libwebviewchromium_loader

PRODUCT_PACKAGES += \
		libhealthd.mrvl
