#APP_STL := stlport_static
APP_STL := gnustl_static
APP_CPPFLAGS += -std=c++11 -frtti -fno-unsigned-char
APP_BUILD_SCRIPT := Android.mk