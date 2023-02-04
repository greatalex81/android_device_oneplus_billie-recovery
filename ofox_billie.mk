#
# Copyright 2017 The Android Open Source Project
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

# Release name
PRODUCT_RELEASE_NAME := billie

# Inherit from our custom product configuration
$(call inherit-product, vendor/twrp/config/common.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := billie
PRODUCT_NAME := ofox_billie
PRODUCT_BRAND := OnePlus
PRODUCT_MODEL := BE2026
PRODUCT_MANUFACTURER := OnePlus

PRODUCT_BUILD_PROP_OVERRIDES += \
	PRIVATE_BUILD_DESC="OnePlusN10-user 11 RKQ1.201217.002 2212201638 release-keys"

BUILD_FINGERPRINT := OnePlus/OnePlusN10/OnePlusN10:11/RKQ1.201217.002/2212201638:user/release-keys

# Inherit from hardware-specific part of the product configuration
$(call inherit-product, device/oneplus/billie/device.mk)