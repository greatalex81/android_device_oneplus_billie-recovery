# Inherit from common AOSP config
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

LOCAL_PATH := device/oneplus/billie

#SHIPPING API
PRODUCT_SHIPPING_API_LEVEL := 29

# define hardware platform
PRODUCT_PLATFORM := lito

# A/B support
AB_OTA_UPDATER := true

# fscrypt policy
TW_USE_FSCRYPT_POLICY := 2

# A/B updater updatable partitions list. Keep in sync with the partition list
# with "_a" and "_b" variants in the device. Note that the vendor can add more
# more partitions to this list for the bootloader and radio.
AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    system \
    system_ext \
    vendor \
    vbmeta \
    vbmeta_system

PRODUCT_PACKAGES += \
    otapreopt_script \
    update_engine \
    update_engine_sideload \
    update_verifier

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true
    
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true
    
# Userdata Checkpointing OTA GC
PRODUCT_PACKAGES += \
    checkpoint_gc

# tell update_engine to not change dynamic partition table during updates
# needed since our qti_dynamic_partitions does not include
# vendor and odm and we also dont want to AB update them
#TARGET_ENFORCE_AB_OTA_PARTITION_LIST := true

#AVB
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_VBMETA_SYSTEM := system product system_ext
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 1

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-impl \
    android.hardware.boot@1.2-service \
    android.hardware.boot@1.2-impl-wrapper.recovery \
    android.hardware.boot@1.2-impl-wrapper \
    android.hardware.boot@1.2-impl.recovery \
    bootctrl.$(PRODUCT_PLATFORM) \
    bootctrl.$(PRODUCT_PLATFORM).recovery \

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    android.hardware.fastboot@1.0-impl-mock.recovery \
    fastbootd \
    resetprop

# qcom decryption
PRODUCT_PACKAGES_ENG += \
    qcom_decrypt \
    qcom_decrypt_fbe 

PRODUCT_PROPERTY_OVERRIDES += \
        ro.crypto.allow_encrypt_override=true \
	ro.crypto.dm_default_key.options_format.version=2 \
	ro.crypto.volume.filenames_mode=aes-256-cts \
	ro.crypto.volume.metadata.method=dm-default-key \
	ro.crypto.volume.options=::v2
# Hidl Service
PRODUCT_ENFORCE_VINTF_MANIFEST := true

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# enable USB Storage
TW_NO_USB_STORAGE := false

# set refreshrate
TW_FRAMERATE := 60

#Display	
PRODUCT_SOONG_NAMESPACES += \
    vendor/qcom/opensource/commonsys-intf/display
	
RECOVERY_LIBRARY_SOURCE_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libion.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.display.config@1.0.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.display.config@2.0.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/libdisplayconfig.qti.so \

# tzdata
PRODUCT_PACKAGES_ENG += \
    tzdata_twrp

#ofox
PRODUCT_COPY_FILES += \
    device/oneplus/billie/prebuilt/systemmanifest.xml:$(TARGET_COPY_OUT_RECOVERY)/root/system/manifest.xml \
    device/oneplus/billie/prebuilt/vendormanifest.xml:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/manifest.xml \
