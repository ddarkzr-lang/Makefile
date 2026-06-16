TARGET := iphone:clang:latest:14.0
ARCHS := arm64

include $(THEOS)/makefiles/common.mk

TWEAK_NAME := ColorRoadModMenu

# إضافة الملفات البرمجية وملفات القائمة
ColorRoadModMenu_FILES := Tweak.x Menu.mm
ColorRoadModMenu_FRAMEWORKS := UIKit QuartzCore
ColorRoadModMenu_CFLAGS := -fobjc-arc

include $(THEOS)/makefiles/tweak.mk
