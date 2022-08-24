# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720
TARGET_BOOTANIMATION_HALF_RES := true

# Inherit some common Lineage stuff
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/zte/p839t60/full_p839t60.mk)

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_l.mk)

PRODUCT_RELEASE_NAME := Turkcell T60
PRODUCT_NAME := lineage_p839t60

# Set product device & name
PRODUCT_BUILD_PROP_OVERRIDES += \
   TARGET_DEVICE=Turkcell-T60 PRODUCT_NAME=Turkcell-T60

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="P839T60-user 5.0.2 LRX22G 20150828.021007 release-keys"

BUILD_FINGERPRINT := TURKCELL/P839T60/P839T60:5.0.2/LRX22G/20150828.021007:user/release-keys


PRODUCT_GMS_CLIENTID_BASE := android-zte

# Vendor security patch level
PRODUCT_PROPERTY_OVERRIDES += \
    ro.lineage.build.vendor_security_patch=2019-10-02
