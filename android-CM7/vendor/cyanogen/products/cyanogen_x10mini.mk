# Inherit AOSP device configuration for passion.
$(call inherit-product, device/se/x10mini/full_x10mini.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cyanogen/products/common.mk)

# Include GSM stuff
$(call inherit-product, vendor/cyanogen/products/gsm.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := cyanogen_x10mini
PRODUCT_BRAND := SE
PRODUCT_DEVICE := x10mini
PRODUCT_MODEL := X10mini
PRODUCT_MANUFACTURER := SE
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=x10mini BUILD_ID=GRJ22 BUILD_DISPLAY_ID=GRJ22 BUILD_FINGERPRINT=google/passion/passion:2.3.4/GRJ22/121341:user/release-keys PRIVATE_BUILD_DESC="passion-user 2.3.4 GRJ22 121341 release-keys"

PRODUCT_SPECIFIC_DEFINES += TARGET_PRELINKER_MAP=$(TOP)/vendor/cyanogen/prelink-linux-arm-x10mini.map

# Add LDPI assets, in addition to MDPI
PRODUCT_LOCALES += ldpi mdpi

# Extra overlay for LDPI
PRODUCT_PACKAGE_OVERLAYS += vendor/cyanogen/overlay/ldpi

# Enable Windows Media
WITH_WINDOWS_MEDIA := true

# Add the Torch app
PRODUCT_PACKAGES += Torch

# Add the Cyanogenmod Wallpapers
PRODUCT_PACKAGES += CMWallpapers


#
# Set ro.modversion
#
ifdef CYANOGEN_NIGHTLY
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=CyanogenMod-7-$(shell date +%m%d%Y)-NIGHTLY-x10Mini
else
    ifdef CYANOGEN_RELEASE
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CyanogenMod-7.0.4-X10Mini
    else
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CyanogenMod-7.0.4-X10Mini-MiniCM7-2.0.2
    endif
endif

#
# Copy bootanimation
#
PRODUCT_COPY_FILES +=  \
    vendor/cyanogen/prebuilt/ldpi/media/bootanimation.zip:system/media/bootanimation.zip

