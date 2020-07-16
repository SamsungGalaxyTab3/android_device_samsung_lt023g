# device.mk

DEVICE_PATH := device/samsung/lt023g

PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/rootdir/init.pxa988.rc:root/init.pxa988.rc \
        $(DEVICE_PATH)/rootdir/init.pxa988.tel.rc:root/init.pxa988.tel.rc \
        $(DEVICE_PATH)/rootdir/init.pxa988.usb.rc:root/init.pxa988.usb.rc \
        $(DEVICE_PATH)/rootdir/init.recovery.pxa988.rc:root/init.recovery.pxa988.rc \
	$(DEVICE_PATH)/rootdir/ueventd.pxa988.rc:root/ueventd.pxa988.rc
