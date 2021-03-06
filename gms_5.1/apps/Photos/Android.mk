###############################################################################
# Photos
LOCAL_PATH := $(call my-dir)

my_archs := arm
my_src_arch := $(call get-prebuilt-src-arch, $(my_archs))
ifeq ($(my_src_arch),arm)
my_src_abi := armeabi-v7a
else ifeq ($(my_src_arch),x86)
my_src_abi := x86
else ifeq ($(my_src_arch),arm64)
my_src_abi := arm64-v8a
else ifeq ($(my_src_arch),x86_64)
my_src_abi := x86_64
endif

include $(CLEAR_VARS)
LOCAL_MODULE := Photos
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_BUILT_MODULE_STEM := package.apk
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
#LOCAL_PRIVILEGED_MODULE :=
LOCAL_CERTIFICATE := PRESIGNED
#LOCAL_OVERRIDES_PACKAGES :=
#LOCAL_SRC_FILES := $(LOCAL_MODULE).apk
ifneq (,$(filter xxxhdpi,$(PRODUCT_AAPT_PREF_CONFIG)))
  LOCAL_SRC_FILES := $(LOCAL_MODULE)_xxhdpi.apk
else ifneq (,$(filter xxhdpi,$(PRODUCT_AAPT_PREF_CONFIG)))
  LOCAL_SRC_FILES := $(LOCAL_MODULE)_xxhdpi.apk
else ifneq (,$(filter xhdpi,$(PRODUCT_AAPT_PREF_CONFIG)))
  LOCAL_SRC_FILES := $(LOCAL_MODULE)_xhdpi.apk
else ifneq (,$(filter hdpi,$(PRODUCT_AAPT_PREF_CONFIG)))
  LOCAL_SRC_FILES := $(LOCAL_MODULE)_hdpi.apk
else ifneq (,$(filter mdpi,$(PRODUCT_AAPT_PREF_CONFIG)))
  LOCAL_SRC_FILES := $(LOCAL_MODULE)_mdpi.apk
else
  LOCAL_SRC_FILES := $(LOCAL_MODULE)_alldpi.apk
endif
#LOCAL_REQUIRED_MODULES :=
LOCAL_PREBUILT_JNI_LIBS := \
    @lib/$(my_src_abi)/libconsumerphotoeditor_native.so \
    @lib/$(my_src_abi)/libcronet.so \
    @lib/$(my_src_abi)/libfilterframework_jni.so \
    @lib/$(my_src_abi)/libframesequence.so \
    @lib/$(my_src_abi)/libmoviemaker-jni.so
LOCAL_MODULE_TARGET_ARCH := $(my_src_arch)
include $(BUILD_PREBUILT)
