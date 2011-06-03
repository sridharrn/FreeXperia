$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

# Discard inherited values and use our own instead.
PRODUCT_NAME := play
PRODUCT_DEVICE := play
PRODUCT_MODEL := play

PRODUCT_PACKAGES += \
    gps.msm7x30 \
    lights.msm7x30 \
    gralloc.msm7x30 \
    copybit.msm7x30 \
    libOmxCore \
    libOmxVdec \
    libOmxVidEnc \
    libmm-omxcore \
    LiveWallpapersPicker


#    sensors.es209ra \
    
# proprietary side of the device
$(call inherit-product-if-exists, vendor/se/play/play-vendor.mk)

DISABLE_DEXPREOPT := false

#PRODUCT_SPECIFIC_DEFINES += TARGET_PRELINKER_MAP=$(TOP)/device/se/play/prelink-linux-arm-play.map

# These is the hardware-specific overlay, which points to the location
# of hardware-specific resource overrides, typically the frameworks and
# application settings that are stored in resourced.
DEVICE_PACKAGE_OVERLAYS := device/se/play/overlay

# These are the hardware-specific configuration files
PRODUCT_COPY_FILES := \
	device/se/play/prebuilt/vold.fstab:system/etc/vold.fstab \
        device/se/play/prebuilt/media_profiles.xml:system/etc/media_profiles.xml \
	device/se/play/prebuilt/egl.cfg:system/lib/egl/egl.cfg

# Init files
PRODUCT_COPY_FILES += \
	device/se/play/init.zeus.rc:root/init.zeus.rc 

# Prebuilt kl keymaps
PRODUCT_COPY_FILES += \
	device/se/play/es209ra_handset.kl:system/usr/keylayout/es209ra_handset.kl \
	device/se/play/es209ra_keypad.kl:system/usr/keylayout/es209ra_keypad.kl 

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
	frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/base/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/base/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/base/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
	frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml


ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/se/play/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel




## OMX Video decoder 
#PRODUCT_COPY_FILES += \
#    device/se/play/prebuilt/libOmxVdec.so:system/lib/libOmxVdec.so


## RIL related stuff 
PRODUCT_COPY_FILES += \
    vendor/se/play/proprietary/bin/port-bridge:system/bin/port-bridge \
    vendor/se/play/proprietary/bin/qmuxd:system/bin/qmuxd \
    vendor/se/play/proprietary/lib/libauth.so:system/lib/libauth.so \
    vendor/se/play/proprietary/lib/libcm.so:system/lib/libcm.so \
    vendor/se/play/proprietary/lib/libdiag.so:system/lib/libdiag.so \
    vendor/se/play/proprietary/lib/libdll.so:system/lib/libdll.so \
    vendor/se/play/proprietary/lib/libdsm.so:system/lib/libdsm.so \
    vendor/se/play/proprietary/lib/libdss.so:system/lib/libdss.so \
    vendor/se/play/proprietary/lib/libgsdi_exp.so:system/lib/libgsdi_exp.so \
    vendor/se/play/proprietary/lib/libgstk_exp.so:system/lib/libgstk_exp.so \
    vendor/se/play/proprietary/lib/libmmgsdilib.so:system/lib/libmmgsdilib.so \
    vendor/se/play/proprietary/lib/libnv.so:system/lib/libnv.so \
    vendor/se/play/proprietary/lib/liboem_rapi.so:system/lib/liboem_rapi.so \
    vendor/se/play/proprietary/lib/liboncrpc.so:system/lib/liboncrpc.so \
    vendor/se/play/proprietary/lib/libpbmlib.so:system/lib/libpbmlib.so \
    vendor/se/play/proprietary/lib/libqmi.so:system/lib/libqmi.so \
    vendor/se/play/proprietary/lib/libqueue.so:system/lib/libqueue.so \
    vendor/se/play/proprietary/lib/libril-qc-1.so:system/lib/libril-qc-1.so \
    vendor/se/play/proprietary/lib/libwms.so:system/lib/libwms.so \
    vendor/se/play/proprietary/lib/libwmsts.so:system/lib/libwmsts.so


## Camera proprietaries
PRODUCT_COPY_FILES += \
    vendor/se/play/proprietary/lib/liboemcamera.so:system/lib/liboemcamera.so \
    vendor/se/play/proprietary/lib/libmmjpeg.so:system/lib/libmmjpeg.so \
    vendor/se/play/proprietary/lib/libmmipl.so:system/lib/libmmipl.so \
    vendor/se/play/proprietary/etc/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
    vendor/se/play/proprietary/etc/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw \
    vendor/se/play/proprietary/etc/firmware/camfirm.bin:system/etc/firmware/camfirm.bin 


## Atheros AR6002 firmware
PRODUCT_COPY_FILES += \
    device/se/play/prebuilt/ar6000.ko:system/lib/modules/ar6000.ko \
    vendor/se/play/proprietary/bin/eeprom.AR6002:system/bin/eeprom.AR6002 \
    vendor/se/play/proprietary/bin/wlan_mac:system/bin/wlan_mac \
    vendor/se/play/proprietary/bin/wlan_tool:system/bin/wlan_tool \
    vendor/se/play/proprietary/bin/bmiloader:system/bin/bmiloader \
    vendor/se/play/proprietary/bin/eeprom.AR6002:system/bin/eeprom.AR6002 \
    vendor/se/play/proprietary/bin/recEvent:system/bin/recEvent \
    vendor/se/play/proprietary/bin/wmiconfig:system/bin/wmiconfig 
    

## BT proprietary
PRODUCT_COPY_FILES += \
    vendor/se/play/proprietary/bin/hci_qcomm_init:system/bin/hci_qcomm_init \
    device/se/play/prebuilt/init.bt.sh:system/etc/init.bt.sh 


## Adreno 200 files
PRODUCT_COPY_FILES += \
    vendor/se/play/proprietary/lib/libgsl.so:system/lib/libgsl.so \
    vendor/se/play/proprietary/lib/egl/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \
    vendor/se/play/proprietary/lib/egl/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so \
    vendor/se/play/proprietary/lib/egl/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \
    vendor/se/play/proprietary/lib/egl/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so 



## Other libraries and proprietary binaries
PRODUCT_COPY_FILES += \
    device/se/play/prebuilt/chargemon:system/bin/chargemon \
    device/se/play/prebuilt/model:system/recovery/model \
    device/se/play/prebuilt/sh:system/recovery/sh \
    device/se/play/prebuilt/recovery.tar.bz2:system/recovery/recovery.tar.bz2 \
    device/se/play/prebuilt/hw_config.sh:system/etc/hw_config.sh \
    vendor/se/play/proprietary/etc/sensors.conf:system/etc/sensors.conf \
    vendor/se/play/proprietary/bin/akmd2:system/bin/akmd2 \
    vendor/se/play/proprietary/etc/DualMicControl.txt:system/etc/DualMicControl.txt 

#offline charging animation
PRODUCT_COPY_FILES += \
    vendor/se/play/proprietary/bin/chargemon:system/bin/charger \
    vendor/se/play/proprietary/bin/updatemiscta:system/bin/updatemiscta \
    vendor/se/play/proprietary/lib/libmiscta.so:system/lib/libmiscta.so \
    vendor/se/play/proprietary/etc/semc/chargemon/anim1.rle:system/etc/semc/chargemon/anim1.rle \
    vendor/se/play/proprietary/etc/semc/chargemon/anim2.rle:system/etc/semc/chargemon/anim2.rle \
    vendor/se/play/proprietary/etc/semc/chargemon/anim3.rle:system/etc/semc/chargemon/anim3.rle \
    vendor/se/play/proprietary/etc/semc/chargemon/anim4.rle:system/etc/semc/chargemon/anim4.rle \
    vendor/se/play/proprietary/etc/semc/chargemon/anim5.rle:system/etc/semc/chargemon/anim5.rle \
    vendor/se/play/proprietary/etc/semc/chargemon/anim6.rle:system/etc/semc/chargemon/anim6.rle \
    vendor/se/play/proprietary/etc/semc/chargemon/anim7.rle:system/etc/semc/chargemon/anim7.rle \
    vendor/se/play/proprietary/etc/semc/chargemon/anim8.rle:system/etc/semc/chargemon/anim8.rle 

#various fixes
PRODUCT_COPY_FILES += \
    device/se/play/prebuilt/gps.conf:system/etc/gps.conf \
    device/se/play/prebuilt/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    vendor/se/play/proprietary/etc/dhcpcd/dhcpcd-hooks/01-test:system/etc/dhcpcd/dhcpcd-hooks/01-test \
    vendor/se/play/proprietary/etc/dhcpcd/dhcpcd-run-hooks:system/etc/dhcpcd/dhcpcd-run-hooks \
    vendor/se/play/proprietary/etc/dhcpcd/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    vendor/se/play/proprietary/lib/hw/sensors.default.so:system/lib/hw/sensors.es209ra.so


#testing kernel
PRODUCT_COPY_FILES += \
    device/se/play/prebuilt/boot.img:system/kernel/boot.img \
    device/se/play/prebuilt/miniloader:system/kernel/miniloader \
    device/se/play/prebuilt/splboot.ko:system/kernel/splboot.ko \

#FreeXperia BootLogo
PRODUCT_COPY_FILES += \
    device/se/play/prebuilt/bootanimation.zip:system/media/bootanimation.zip 

PRODUCT_PROPERTY_OVERRIDES := \
    keyguard.no_require_sim=true \
    ro.ril.hsxpa=1 \
    ro.ril.gprsclass=10 \
    ro.media.dec.jpeg.memcap=10000000

PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/system/lib/libril-qc-1.so \
    rild.libargs=-d/dev/smd0 \
    keyguard.no_require_sim=true \
    ro.ril.hsxpa=2 \
    ro.ril.gprsclass=10 \
    ro.telephony.default_network=0 \
    ro.telephony.call_ring.multiple=false \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15 \

#MT 
PRODUCT_PROPERTY_OVERRIDES += \
ro.product.multi_touch_enabled=true \
ro.product.max_num_touch=2 

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=240 \
    qemu.sf.lcd_density=240 \
    ro.sf.hwrotation=180

# play uses high-density artwork where available
PRODUCT_LOCALES += hdpi

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y \
    dalvik.vm.heapsize=32m \
    dalvik.vm.execution-mode=int:jit \
    dalvik.vm.dexopt-data-only=1 \
    ro.opengles.version=131072  \
    ro.compcache.default=0\
    ro.product.locale.language=en \
    ro.product.locale.region=US
