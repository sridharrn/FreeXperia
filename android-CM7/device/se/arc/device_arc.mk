$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

# Discard inherited values and use our own instead.
PRODUCT_NAME := arc
PRODUCT_DEVICE := arc
PRODUCT_MODEL := arc


ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/se/arc/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_PACKAGES += \
    librs_jni \
    gralloc.semc \
    gralloc.msm7x30 \
    overlay.semc \
    overlay.msm7x30 \
    gps.semc \
    lights.semc \
    libaudio \
    libOmxCore \
    libOmxVenc \
    libOmxVdec \
    com.android.future.usb.accessory
    
# proprietary side of the device
$(call inherit-product-if-exists, vendor/se/arc/arc-vendor.mk)

DISABLE_DEXPREOPT := false

#PRODUCT_SPECIFIC_DEFINES += TARGET_PRELINKER_MAP=$(TOP)/device/se/arc/prelink-linux-arm-arc.map

# These is the hardware-specific overlay, which points to the location
# of hardware-specific resource overrides, typically the frameworks and
# application settings that are stored in resourced.
DEVICE_PACKAGE_OVERLAYS := device/se/arc/overlay

# These are the hardware-specific configuration files
PRODUCT_COPY_FILES := \
	device/se/arc/media_profiles.xml:system/etc/media_profiles.xml \
	device/se/arc/prebuilt/chargemon:system/bin/chargemon \
	device/se/arc/prebuilt/model:system/recovery/model \
	device/se/arc/prebuilt/gps.conf:system/etc/gps.conf 

# Init files
PRODUCT_COPY_FILES += \
	device/se/arc/init.semc.rc:root/init.semc.rc \
	device/se/arc/ueventd.mogami.rc:root/ueventd.mogami.rc 

# Prebuilt kl keymaps
PRODUCT_COPY_FILES += \
	vendor/se/arc/proprietary/usr/keylayout/atdaemon.kl:system/usr/keylayout/atdaemon.kl \
	vendor/se/arc/proprietary/usr/keylayout/msm_pmic_pwr_key.kl:system/usr/keylayout/msm_pmic_pwr_key.kl \
	vendor/se/arc/proprietary/usr/keylayout/pm8058-keypad.kl:system/usr/keylayout/pm8058-keypad.kl \
	vendor/se/arc/proprietary/usr/keylayout/simple_remote.kl:system/usr/keylayout/simple_remote.kl
#	vendor/se/arc/proprietary/usr/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml


## RIL related stuff 
PRODUCT_COPY_FILES += \
    device/se/arc/prebuilt/libril.so:system/lib/libril.so \
    vendor/se/arc/proprietary/bin/port-bridge:system/bin/port-bridge \
    vendor/se/arc/proprietary/bin/qmuxd:system/bin/qmuxd \
    vendor/se/arc/proprietary/lib/libauth.so:system/lib/libauth.so \
    vendor/se/arc/proprietary/lib/libcm.so:system/lib/libcm.so \
    vendor/se/arc/proprietary/lib/libdiag.so:system/lib/libdiag.so \
    vendor/se/arc/proprietary/lib/libdll.so:system/lib/libdll.so \
    vendor/se/arc/proprietary/lib/libdsm.so:system/lib/libdsm.so \
    vendor/se/arc/proprietary/lib/libdss.so:system/lib/libdss.so \
    vendor/se/arc/proprietary/lib/libgsdi_exp.so:system/lib/libgsdi_exp.so \
    vendor/se/arc/proprietary/lib/libgstk_exp.so:system/lib/libgstk_exp.so \
    vendor/se/arc/proprietary/lib/libmmgsdilib.so:system/lib/libmmgsdilib.so \
    vendor/se/arc/proprietary/lib/libnv.so:system/lib/libnv.so \
    vendor/se/arc/proprietary/lib/liboem_rapi.so:system/lib/liboem_rapi.so \
    vendor/se/arc/proprietary/lib/liboncrpc.so:system/lib/liboncrpc.so \
    vendor/se/arc/proprietary/lib/libpbmlib.so:system/lib/libpbmlib.so \
    vendor/se/arc/proprietary/lib/libqmi.so:system/lib/libqmi.so \
    vendor/se/arc/proprietary/lib/libqueue.so:system/lib/libqueue.so \
    vendor/se/arc/proprietary/lib/libuim.so:system/lib/libuim.so \
    vendor/se/arc/proprietary/lib/libril-qc-1.so:system/lib/libril-qc-1.so \
    vendor/se/arc/proprietary/lib/libwms.so:system/lib/libwms.so \
    vendor/se/arc/proprietary/lib/libwmsts.so:system/lib/libwmsts.so

## Camera proprietaries
PRODUCT_COPY_FILES += \
    device/se/arc/prebuilt/libcamera.so:system/lib/libcamera.so \
    device/se/arc/prebuilt/liboemcamera.so:system/lib/liboemcamera.so \
    vendor/se/arc/proprietary/lib/libmmjpeg.so:system/lib/libmmjpeg.so \
    vendor/se/arc/proprietary/lib/libmmipl.so:system/lib/libmmipl.so 
#    device/se/arc/prebuilt/libcamera.so:obj/lib/libcamera.so \

## FIRMWARE
PRODUCT_COPY_FILES += \
    vendor/se/arc/proprietary/etc/firmware/bq27520_fw-0501_filever-0105_proj-hall_golden.bqfs:system/etc/firmware/bq27520_fw-0501_filever-0105_proj-hall_golden.bqfs \
    vendor/se/arc/proprietary/etc/firmware/bq27520_fw-0501_filever-0105_proj-hall_golden.dffs:system/etc/firmware/bq27520_fw-0501_filever-0105_proj-hall_golden.dffs \
    vendor/se/arc/proprietary/etc/firmware/fm_rx_init_1273.1.bts:system/etc/firmware/fm_rx_init_1273.1.bts \
    vendor/se/arc/proprietary/etc/firmware/fm_rx_init_1273.2.bts:system/etc/firmware/fm_rx_init_1273.2.bts \
    vendor/se/arc/proprietary/etc/firmware/fm_tx_init_1273.1.bts:system/etc/firmware/fm_tx_init_1273.1.bts \
    vendor/se/arc/proprietary/etc/firmware/fm_tx_init_1273.2.bts:system/etc/firmware/fm_tx_init_1273.2.bts \
    vendor/se/arc/proprietary/etc/firmware/fmc_init_1273.1.bts:system/etc/firmware/fmc_init_1273.1.bts \
    vendor/se/arc/proprietary/etc/firmware/fmc_init_1273.2.bts:system/etc/firmware/fmc_init_1273.2.bts \
    vendor/se/arc/proprietary/etc/firmware/TIInit_7.5.20.bts:system/etc/firmware/TIInit_7.5.20.bts \
    vendor/se/arc/proprietary/etc/firmware/TIInit_7.6.15.bts:system/etc/firmware/TIInit_7.6.15.bts \
    vendor/se/arc/proprietary/etc/firmware/touch_anzu_sharp_type1.hex:system/etc/firmware/touch_anzu_sharp_type1.hex \
    vendor/se/arc/proprietary/etc/firmware/touch_anzu_sharp_type2.hex:system/etc/firmware/touch_anzu_sharp_type2.hex \
    vendor/se/arc/proprietary/etc/firmware/touch_anzu_sony_type1.hex:system/etc/firmware/touch_anzu_sony_type1.hex \
    vendor/se/arc/proprietary/etc/firmware/touch_anzu_sony_type2.hex:system/etc/firmware/touch_anzu_sony_type2.hex \
    vendor/se/arc/proprietary/etc/firmware/vidc_720p_command_control.fw:system/etc/firmware/vidc_720p_command_control.fw \
    vendor/se/arc/proprietary/etc/firmware/vidc_720p_h263_dec_mc.fw:system/etc/firmware/vidc_720p_h263_dec_mc.fw \
    vendor/se/arc/proprietary/etc/firmware/vidc_720p_h264_dec_mc.fw:system/etc/firmware/vidc_720p_h264_dec_mc.fw \
    vendor/se/arc/proprietary/etc/firmware/vidc_720p_h264_enc_mc.fw:system/etc/firmware/vidc_720p_h264_enc_mc.fw \
    vendor/se/arc/proprietary/etc/firmware/vidc_720p_mp4_dec_mc.fw:system/etc/firmware/vidc_720p_mp4_dec_mc.fw \
    vendor/se/arc/proprietary/etc/firmware/vidc_720p_mp4_enc_mc.fw:system/etc/firmware/vidc_720p_mp4_enc_mc.fw \
    vendor/se/arc/proprietary/etc/firmware/vidc_720p_vc1_dec_mc.fw:system/etc/firmware/vidc_720p_vc1_dec_mc.fw \
    vendor/se/arc/proprietary/etc/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
    vendor/se/arc/proprietary/etc/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw 

## WIFI TI1271
PRODUCT_COPY_FILES += \
    vendor/se/arc/proprietary/etc/wifi/tiwlan.ini:system/etc/wifi/tiwlan.ini \
    vendor/se/arc/proprietary/etc/wifi/tiwlan_firmware.bin:system/etc/wifi/tiwlan_firmware.bin \
    vendor/se/arc/proprietary/etc/wifi/softap/tiwlan_ap.ini:system/etc/wifi/softap/tiwlan_ap.ini \
    vendor/se/arc/proprietary/etc/wifi/softap/tiwlan_firmware_ap.bin:system/etc/wifi/softap/tiwlan_firmware_ap.bin \
    vendor/se/arc/proprietary/lib/modules/sdio.ko:system/lib/modules/sdio.ko \
    vendor/se/arc/proprietary/lib/modules/tiap_drv.ko:system/lib/modules/tiap_drv.ko \
    vendor/se/arc/proprietary/lib/modules/tiwlan_drv.ko:system/lib/modules/tiwlan_drv.ko
#    vendor/se/arc/proprietary/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
#    vendor/se/arc/proprietary/etc/wifi/softap/hostapd.conf:system/etc/wifi/softap/hostapd.conf \

## BT proprietary
PRODUCT_COPY_FILES += \
    vendor/se/arc/proprietary/etc/init.qcom.bt.sh:system/etc/init.bt.sh 


## Adreno 200 files
PRODUCT_COPY_FILES += \
    vendor/se/arc/proprietary/lib/libgsl.so:system/lib/libgsl.so \
    vendor/se/arc/proprietary/lib/egl/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \
    vendor/se/arc/proprietary/lib/egl/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so \
    vendor/se/arc/proprietary/lib/egl/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \
    vendor/se/arc/proprietary/lib/egl/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so 



## Other libraries and proprietary binaries
PRODUCT_COPY_FILES += \
    vendor/se/arc/proprietary/lib/libaudioalsa.so:obj/lib/libaudioalsa.so \
    vendor/se/arc/proprietary/lib/libaudioalsa.so:system/lib/libaudioalsa.so \
    vendor/se/arc/proprietary/etc/als_curve.conf:system/etc/als_curve.conf \
    vendor/se/arc/proprietary/etc/vold.fstab:system/etc/vold.fstab \
    vendor/se/arc/proprietary/etc/hw_config.sh:system/etc/hw_config.sh \
    vendor/se/arc/proprietary/etc/sensors.conf:system/etc/sensors.conf \
    vendor/se/arc/proprietary/lib/hw/sensors.default.so:system/lib/hw/sensors.semc.so \
    vendor/se/arc/proprietary/bin/akmd8975:system/bin/akmd8975

#offline charging animation - temporary disabled to save space
#PRODUCT_COPY_FILES += \
#    vendor/se/arc/proprietary/bin/updatemiscta:system/bin/updatemiscta \
#    vendor/se/arc/proprietary/lib/libmiscta.so:system/lib/libmiscta.so \
#    device/se/arc/prebuilt/animations/charging_animation_01.png:system/etc/chargemon/charging_01.png \
#    device/se/arc/prebuilt/animations/charging_animation_02.png:system/etc/chargemon/charging_02.png \
#    device/se/arc/prebuilt/animations/charging_animation_03.png:system/etc/chargemon/charging_03.png \
#    device/se/arc/prebuilt/animations/charging_animation_04.png:system/etc/chargemon/charging_04.png \
#    device/se/arc/prebuilt/animations/charging_animation_05.png:system/etc/chargemon/charging_05.png \
#    device/se/arc/prebuilt/animations/charging_animation_06.png:system/etc/chargemon/charging_06.png \
#    device/se/arc/prebuilt/animations/charging_animation_07.png:system/etc/chargemon/charging_07.png \
#    device/se/arc/prebuilt/animations/charging_animation_blank.png:system/etc/chargemon/charging_blank.png


#Temporary GPS Fix
PRODUCT_COPY_FILES += \
    device/se/arc/prebuilt/gps.conf:system/etc/gps.conf \
    vendor/se/arc/proprietary/lib/hw/gps.msm7x30.so:system/lib/hw/gps.semc.so

#FreeXperia BootLogo
PRODUCT_COPY_FILES += \
    device/se/arc/prebuilt/bootanimation.zip:system/media/bootanimation.zip 

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

# arc uses high-density artwork where available
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

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
