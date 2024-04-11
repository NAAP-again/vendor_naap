NAAP_TARGET_PACKAGE := $(PRODUCT_OUT)/NAAP-$(NAAP_VERSION).zip
SHA256 := prebuilts/build-tools/path/$(HOST_PREBUILT_TAG)/sha256sum

.PHONY: otapackage naap bacon
otapackage: $(INTERNAL_OTA_PACKAGE_TARGET)
naap: otapackage
	$(hide) mv $(INTERNAL_OTA_PACKAGE_TARGET) $(NAAP_TARGET_PACKAGE)
	$(hide) $(SHA256) $(NAAP_TARGET_PACKAGE) | cut -d ' ' -f1 > $(NAAP_TARGET_PACKAGE).sha256sum
	$(hide) ./vendor/naap/tools/generate_json_build_info.sh $(NAAP_TARGET_PACKAGE)
	@echo -e ""
	@echo -e "${cya}Building ${bldcya}NAAP${txtrst}";
	@echo -e "::::    :::     :::         :::     :::::::::  "
	@echo -e ":+:+:   :+:   :+: :+:     :+: :+:   :+:    :+: "
	@echo -e ":+:+:+  +:+  +:+   +:+   +:+   +:+  +:+    +:+ "
	@echo -e "+#+ +:+ +#+ +#++:++#++: +#++:++#++: +#++:++#+  "
	@echo -e "+#+  +#+#+# +#+     +#+ +#+     +#+ +#+        "
	@echo -e "#+#   #+#+# #+#     #+# #+#     #+# #+#        "
	@echo -e "###    #### ###     ### ###     ### ###        "
	@echo -e "	  	     Not Another AOSP Project	         "
	@echo -e ""
	@echo -e "zip: "$(NAAP_TARGET_PACKAGE)
	@echo -e "sha256: `cat $(NAAP_TARGET_PACKAGE).sha256sum | cut -d ' ' -f 1`"
	@echo -e "size: `ls -lah $(NAAP_TARGET_PACKAGE) | cut -d ' ' -f 5`"
	@echo -e ""

bacon: naap
