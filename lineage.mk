# Inherit device configuration
$(call inherit-product, device/samsung/lt023g/device.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Release name
PRODUCT_RELEASE_NAME := lt023g

# Boot animation
TARGET_SCREEN_HEIGHT := 1024
TARGET_SCREEN_WIDTH := 600

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := lt023g
PRODUCT_NAME := lineage_lt023g
PRODUCT_BRAND := Samsung
PRODUCT_MODEL := SM-T211
PRODUCT_MANUFACTURER := Samsung
PRODUCT_RESTRICT_VENDOR_FILES := false
