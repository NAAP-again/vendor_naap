NAAP_FASTBOOT_PACKAGE := $(PRODUCT_OUT)/NAAP-$(NAAP_VERSION)-img.zip

.PHONY: updatepackage naap-fastboot
updatepackage: $(INTERNAL_UPDATE_PACKAGE_TARGET)
naap-fastboot: updatepackage
	$(hide) mv $(INTERNAL_UPDATE_PACKAGE_TARGET) $(NAAP_FASTBOOT_PACKAGE)
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
	@echo -e "zip: "$(NAAP_FASTBOOT_PACKAGE)
	@echo -e "size: `ls -lah $(NAAP_FASTBOOT_PACKAGE) | cut -d ' ' -f 5`"
	@echo -e ""
