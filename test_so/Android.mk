


LOCAL_PATH:= $(call my-dir)

# 编译so文件
include $(CLEAR_VARS)
LOCAL_MODULE    := libmodule
LOCAL_LDFLAGS += -shared
LOCAL_C_INCLUDES += $(LOCAL_PATH)/include

# 某个目录下的所有文件（不包含子目录）
# MY_CPP_LIST := $(wildcard $(LOCAL_PATH)/src/*.cpp)
# LOCAL_SRC_FILES += $(MY_CPP_LIST)

# 遍历目录，包括子目录
#定义函数，递归返回给定目录下所有C++源文件
MY_SRC_ROOT := $(LOCAL_PATH)/src
all_cpp_files_recursively = \
	$(eval src_files = $(wildcard $1/*.cpp)) \
	$(eval src_files = $(src_files:$(LOCAL_PATH)/%=%))$(src_files) \
	$(eval item_all = $(wildcard $1/*)) \
	$(foreach item, $(item_all) $(),\
		$(eval item := $(item:%.cpp=%)) \
		$(call all_cpp_files_recursively, $(item))\
	)
	
#定义函数，递归返回给定目录下所有C源文件
all_c_files_recursively = \
	$(eval src_files = $(wildcard $1/*.c)) \
	$(eval src_files = $(src_files:$(LOCAL_PATH)/%=%))$(src_files) \
	$(eval item_all = $(wildcard $1/*)) \
	$(foreach item, $(item_all) $(),\
		$(eval item := $(item:%.c=%)) \
		$(call all_c_files_recursively, $(item))\
	)

LOCAL_SRC_FILES += $(call all_cpp_files_recursively,$(MY_SRC_ROOT))
LOCAL_SRC_FILES += $(call all_c_files_recursively,$(MY_SRC_ROOT))

$(warning "$(LOCAL_MODULE) cpp: $(LOCAL_SRC_FILES)") 
include $(BUILD_SHARED_LIBRARY)


