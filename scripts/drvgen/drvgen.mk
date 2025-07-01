# Copyright (C) 2016 MediaTek Inc.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2 as
# published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See http://www.gnu.org/licenses/gpl-2.0.html for more details.

DRVGEN_PATH := drivers/misc/mediatek/dws/$(MTK_PLATFORM)
DRVGEN_OUT := $(objtree)/arch/$(SRCARCH)/boot/dts/mediatek/biloba
DWS_FILE := $(srctree)/$(DRVGEN_PATH)/$(MTK_PROJECT).dws
DRVGEN_TOOL := $(srctree)/tools/dct/DrvGen.py

.PHONY: drvgen
drvgen: arch/arm64/boot/dts/mediatek/biloba
arch/arm64/boot/dts/mediatek/biloba: $(DRVGEN_TOOL) $(DWS_FILE) $(DRVGEN_OUT)
	echo 'Creating $(DRVGEN_OUT)' ;\
	mkdir $(DRVGEN_OUT) ;\
	$(python) $(DRVGEN_TOOL) $(DWS_FILE) $(DRVGEN_OUT) ;\
