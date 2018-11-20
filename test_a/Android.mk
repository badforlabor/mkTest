


LOCAL_PATH:= $(call my-dir)

# 编译a文件
include $(CLEAR_VARS)
LOCAL_MODULE    := add
LOCAL_C_INCLUDES += $(LOCAL_PATH)/include
LOCAL_SRC_FILES += $(LOCAL_PATH)/src/add.cpp
$(warning "$(LOCAL_MODULE) cpp: $(LOCAL_SRC_FILES)") 
include $(BUILD_STATIC_LIBRARY)

