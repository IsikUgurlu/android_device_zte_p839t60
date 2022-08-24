#
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

-include device/zte/msm8916-common/BoardConfigCommon.mk

DEVICE_PATH := device/zte/p839t60

# For building with minimal manifest
#ALLOW_MISSING_DEPENDENCIES := true

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := generic

#BOARD_PAGE_SIZE := 0x2048
#BOARD_INCLUDE_DTB_IN_BOOTIMG := true

# Assert
TARGET_OTA_ASSERT_DEVICE := p839t60
#TARGET_OTA_ASSERT_DEVICE := p839t60,P839T60,Turkcell-T60

# File systems
#BOARD_HAS_LARGE_FILESYSTEM := true
#BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
#BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
#BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
#TARGET_USERIMAGES_USE_EXT4 := true
#TARGET_USERIMAGES_USE_F2FS := true
#TARGET_COPY_OUT_VENDOR := vendor

# Kernel: Base flags
BOARD_KERNEL_CMDLINE   := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom user_debug=30 msm_rtb.filter=0x3F ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci lpm_levels.sleep_disabled=1 androidboot.selinux=permissive
##TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/zImage
TARGET_PREBUILT_DT     := $(DEVICE_PATH)/prebuilt/dt.img
#BOARD_BOOTIMG_HEADER_VERSION := 2

# Kernel: Board (kernel...) flags
#BOARD_NAME               := SRPTJ06B001
BOARD_KERNEL_BASE        := 0x80000000
BOARD_KERNEL_PAGESIZE    := 2048
BOARD_KERNEL_OFFSET		 := 0x00008000
BOARD_RAMDISK_OFFSET     := 0x02000000
BOARD_SECOND_OFFSET		 := 0x00f00000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100

# Kernel: mkbootimgs args
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dt $(TARGET_PREBUILT_DT)
BOARD_KERNEL_IMAGE_NAME   := zImage
TARGET_KERNEL_ARCH        := arm
TARGET_KERNEL_HEADER_ARCH := arm
TARGET_KERNEL_SOURCE      := kernel/zte/p839t60
TARGET_KERNEL_CONFIG      := msm_P839T60_defconfig
#TARGET_KERNEL_CONFIG      := p839t60_defconfig
#BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_KERNEL_PAGESIZE)
#BOARD_MKBOOTIMG_ARGS += --ramdisk $(TARGET_PREBUILT_RAMDISK)
#BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
#BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
#BOARD_MKBOOTIMG_ARGS += --board $(BOARD_NAME)

# Platform
TARGET_BOARD_PLATFORM := msm8916


# Partition: Size
BOARD_BOOTIMAGE_PARTITION_SIZE     := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432
BOARD_USERDATAIMAGE_PARTITION_SIZE := 11978914816 # (BOARD_USERDATAIMAGE_PARTITION_SIZE - 16384 for crypto footer)
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 3011510272
BOARD_DT_SIZE                      := 206848
#BOARD_DTBOIMAGE_PARTITION_SIZE := 25165824

# Recovery
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
#RECOVERY_VARIANT := twrp

# Bluetooth
#BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth

# Lineagehw
BOARD_HARDWARE_CLASS += $(DEVICE_PATH)/lineagehw/src
TARGET_TAP_TO_WAKE_NODE := "/sys/syna_wake_gesture/wake_gesture"

# Power
TARGET_POWERHAL_SET_INTERACTIVE_EXT := $(DEVICE_PATH)/power/power_ext.c

# SELinux
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy

# Vendor Interface Manifest
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

# Inherit from the proprietary version
-include vendor/zte/p839t60/BoardConfigVendor.mk

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab

# twrp
#TW_THEME := portrait_hdpi
#RECOVERY_SDCARD_ON_DATA := true
#BOARD_HAS_NO_REAL_SDCARD := true
