LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    CameraWrapper.cpp

LOCAL_SHARED_LIBRARIES := \
    libhardware \
    liblog \
    libcamera_client \
    libgui \
    libhidltransport \
    libsensor \
    libutils \
    android.hidl.token@1.0-utils

LOCAL_STATIC_LIBRARIES := \
    libarect

LOCAL_C_INCLUDES += \
    system/media/camera/include

LOCAL_HEADER_LIBRARIES := libnativebase_headers

LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_MODULE := camera.$(TARGET_BOARD_PLATFORM)
LOCAL_PROPRIETARY_MODULE := true
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)

# Shim required for camera hal
include $(CLEAR_VARS)
LOCAL_SRC_FILES := camera_shim.c
LOCAL_SHARED_LIBRARIES := libutils
LOCAL_MODULE := libshims_camera
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)
