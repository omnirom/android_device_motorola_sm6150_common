# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017 The LineageOS Project
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
# This file is the build configuration for a full Android
# build for grouper hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

AB_OTA_PARTITIONS += \
    boot \
    system \
    vbmeta \
    product

$(call inherit-product, device/motorola/dynamic_common/dynamic_common.mk)

# Prebuilt
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/motorola/sm6150_common/prebuilt/system,system) \
    $(call find-copy-subdir-files,*,device/motorola/sm6150_common/prebuilt/product,product)

# Boot control
PRODUCT_PACKAGES += \
    bootctrl.sm6150.recovery

PRODUCT_AAPT_CONFIG := xxxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxxhdpi
PRODUCT_CHARACTERISTICS := nosdcard

PRODUCT_PACKAGES += \
    MotoActions

DEVICE_PACKAGE_OVERLAYS += device/motorola/sm6150_common/overlay/device
