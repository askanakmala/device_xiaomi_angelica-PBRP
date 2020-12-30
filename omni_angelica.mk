# Release name
PRODUCT_RELEASE_NAME := angelica
DEVICE_PATH := device/xiaomi/angelica

$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/pb/config/common.mk)

PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,$(LOCAL_PATH)/recovery/root,recovery/root) \
    $(LOCAL_PATH)/prebuilt/dtb.img:dtb.img

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := angelica
PRODUCT_NAME := omni_angelica
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Redmi 9C
PRODUCT_MANUFACTURER := Xiaomi

# HACK: Set vendor patch level
PRODUCT_SYSTEM_PROPERTY_BLACKLIST += \
	ro.product.device \
	ro.product.name \
	ro.build.product

PRODUCT_PROPERTY_OVERRIDES += \
	ro.vendor.build.security_patch=2099-12-31 \
	ro.secure=1 \
	ro.adb.secure=0
