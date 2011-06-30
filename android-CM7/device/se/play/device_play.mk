$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

# Discard inherited values and use our own instead.
PRODUCT_NAME := play
PRODUCT_DEVICE := play
PRODUCT_MODEL := play

PRODUCT_PACKAGES += \
    gps.semc \
    lights.semc \
    gralloc.semc \
    overlay.semc \
    liboverlay \
    libOmxCore \
    libOmxVdec \
    libOmxVidEnc \
    libmm-omxcore \
    LiveWallpapersPicker


# proprietary side of the device
$(call inherit-product-if-exists, vendor/se/play/play-vendor.mk)

DISABLE_DEXPREOPT := false

PRODUCT_SPECIFIC_DEFINES += TARGET_PRELINKER_MAP=$(TOP)/device/se/common/prelink-linux-arm-2G.map

# These is the hardware-specific overlay, which points to the location
# of hardware-specific resource overrides, typically the frameworks and
# application settings that are stored in resourced.
DEVICE_PACKAGE_OVERLAYS := device/se/play/overlay

# These are the hardware-specific configuration files
PRODUCT_COPY_FILES := \
	vendor/se/play/proprietary/etc/vold.fstab:system/etc/vold.fstab \
	device/se/play/prebuilt/media_profiles.xml:system/etc/media_profiles.xml \
	device/se/play/prebuilt/egl.cfg:system/lib/egl/egl.cfg

# Init files
PRODUCT_COPY_FILES += \
	device/se/play/init.semc.rc:root/init.semc.rc \
	device/se/play/ueventd.zeus.rc:root/ueventd.zeus.rc 

# Prebuilt kl keymaps
PRODUCT_COPY_FILES += \
	vendor/se/play/proprietary/usr/keylayout/atdaemon.kl:system/usr/keylayout/atdaemon.kl \
	vendor/se/play/proprietary/usr/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
	vendor/se/play/proprietary/usr/keylayout/keypad-game-zeus.kl:system/usr/keylayout/keypad-game-zeus.kl \
	vendor/se/play/proprietary/usr/keylayout/keypad-phone-zeus.kl:system/usr/keylayout/keypad-phone-zeus.kl \
	vendor/se/play/proprietary/usr/keylayout/keypad-pmic-zeus.kl:system/usr/keylayout/keypad-pmic-zeus.kl \
	vendor/se/play/proprietary/usr/keylayout/keypad-zeus.kl:system/usr/keylayout/keypad-zeus.kl \
	vendor/se/play/proprietary/usr/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
	vendor/se/play/proprietary/usr/keylayout/simple_remote.kl:system/usr/keylayout/simple_remote.kl \
	vendor/se/play/proprietary/usr/keychars/qwerty.kcm.bin:system/usr/keychars/qwerty.kcm.bin \
	vendor/se/play/proprietary/usr/keychars/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin \
	vendor/se/play/proprietary/usr/keychars/zeus-keypad.kcm.bin:system/usr/keychars/zeus-keypad.kcm.bin 

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
    vendor/se/play/proprietary/lib/libmmipl.so:system/lib/libmmipl.so 


## firmware
PRODUCT_COPY_FILES += \
    vendor/se/play/proprietary/etc/firmware/bcm4329.hcd:system/etc/firmware/bcm4329.hcd \
    vendor/se/play/proprietary/etc/firmware/fw_bcm4329.bin:system/etc/firmware/fw_bcm4329.bin \
    vendor/se/play/proprietary/etc/firmware/fw_bcm4329_apsta.bin:system/etc/firmware/fw_bcm4329_apsta.bin \
    vendor/se/play/proprietary/etc/firmware/vidc_720p_command_control.fw:system/etc/firmware/vidc_720p_command_control.fw \
    vendor/se/play/proprietary/etc/firmware/vidc_720p_h263_dec_mc.fw:system/etc/firmware/vidc_720p_h263_dec_mc.fw \
    vendor/se/play/proprietary/etc/firmware/vidc_720p_h264_dec_mc.fw:system/etc/firmware/vidc_720p_h264_dec_mc.fw \
    vendor/se/play/proprietary/etc/firmware/vidc_720p_h264_enc_mc.fw:system/etc/firmware/vidc_720p_h264_enc_mc.fw \
    vendor/se/play/proprietary/etc/firmware/vidc_720p_mp4_dec_mc.fw:system/etc/firmware/vidc_720p_mp4_dec_mc.fw \
    vendor/se/play/proprietary/etc/firmware/vidc_720p_mp4_enc_mc.fw:system/etc/firmware/vidc_720p_mp4_enc_mc.fw \
    vendor/se/play/proprietary/etc/firmware/vidc_720p_vc1_dec_mc.fw:system/etc/firmware/vidc_720p_vc1_dec_mc.fw \
    vendor/se/play/proprietary/etc/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
    vendor/se/play/proprietary/etc/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw 


## BROADCOM WIFI&BT
PRODUCT_COPY_FILES += \
    vendor/se/play/proprietary/etc/wifi/calibration:system/etc/wifi/calibration \
    vendor/se/play/proprietary/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    vendor/se/play/proprietary/bin/brcm_patchram_plus:system/bin/brcm_patchram_plus 


## Adreno 200 files
PRODUCT_COPY_FILES += \
    vendor/se/play/proprietary/lib/libgsl.so:system/lib/libgsl.so \
    vendor/se/play/proprietary/lib/egl/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \
    vendor/se/play/proprietary/lib/egl/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so \
    vendor/se/play/proprietary/lib/egl/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \
    vendor/se/play/proprietary/lib/egl/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so 


## Other libraries and proprietary binaries
PRODUCT_COPY_FILES += \
    vendor/se/play/proprietary/lib/libaudioalsa.so:obj/lib/libaudioalsa.so \
    vendor/se/play/proprietary/lib/libaudioalsa.so:system/lib/libaudioalsa.so \
    device/se/play/prebuilt/hw_config.sh:system/etc/hw_config.sh \
    vendor/se/play/proprietary/etc/sensors.conf:system/etc/sensors.conf \
    vendor/se/play/proprietary/bin/akmd8975:system/bin/akmd8975 \
    vendor/se/play/proprietary/lib/hw/sensors.default.so:system/lib/hw/sensors.semc.so

#Recovery TEST Files
PRODUCT_COPY_FILES += \
    device/se/play/recovery.fstab:root/etcrec/recovery.fstab \
    device/se/play/prebuilt/recovery:root/sbin/recovery \
    device/se/play/prebuilt/bootrec:root/sbin/bootrec \
    device/se/play/prebuilt/init.rc:root/init.rc

#offline charging animation
PRODUCT_COPY_FILES += \
    device/se/play/prebuilt/chargemon:system/bin/chargemon \
    vendor/se/play/proprietary/lib/libmiscta.so:system/lib/libmiscta.so \
    device/se/play/prebuilt/animations/charging_animation_01.png:system/etc/chargemon/animation_01.png \
    device/se/play/prebuilt/animations/charging_animation_02.png:system/etc/chargemon/animation_02.png \
    device/se/play/prebuilt/animations/charging_animation_03.png:system/etc/chargemon/animation_03.png \
    device/se/play/prebuilt/animations/charging_animation_04.png:system/etc/chargemon/animation_04.png \
    device/se/play/prebuilt/animations/charging_animation_05.png:system/etc/chargemon/animation_05.png \
    device/se/play/prebuilt/animations/charging_animation_06.png:system/etc/chargemon/animation_06.png \
    device/se/play/prebuilt/animations/charging_animation_07.png:system/etc/chargemon/animation_07.png \
    device/se/play/prebuilt/animations/charging_animation_blank.png:system/etc/chargemon/animation_blank.png

#Temporary GPS Fix untill we have 50001 gps
PRODUCT_COPY_FILES += \
    vendor/se/play/proprietary/lib/hw/gps.msm7x30.so:system/lib/hw/gps.semc.so

#FreeXperia BootLogo
PRODUCT_COPY_FILES += \
    device/se/play/prebuilt/bootanimation.zip:system/media/bootanimation.zip 

#FreeXperia LiveView
PRODUCT_COPY_FILES += \
    device/se/common/com.sonyericsson.extras.liveview.apk:system/app/com.sonyericsson.extras.liveview.apk \
    device/se/common/com.sonyericsson.extras.liveware.apk:system/app/com.sonyericsson.extras.liveware.apk

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
    wifi.interface=eth0 \
    wifi.supplicant_scan_interval=15

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
