#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm8750-common
$(call inherit-product, device/xiaomi/sm8750-common/common.mk)

# Get non-open-source specific aspects
$(call inherit-product, vendor/xiaomi/dada/dada-vendor.mk)

# Stock MiuiCamera (HyperOS 4 / Leica). Overrides Aperture when the APK is present.
$(call inherit-product-if-exists, device/xiaomi/dada-miuicamera/device.mk)

# Stock camera HAL loads frozen sensors AIDL V2 while sensorservice uses V3.
PRODUCT_PACKAGES += \
    android.hardware.sensors-V2-ndk

# Overlays
PRODUCT_PACKAGES += \
    ApertureResDada \
    FrameworksResDada \
    SettingsOverlayDada \
    SystemUIResDada

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Stock device_features consumed by MiuiCamera / HyperOS 4 HALs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/device_features/dada.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/device_features/dada.xml
