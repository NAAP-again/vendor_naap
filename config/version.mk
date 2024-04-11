# Copyright (C) 2020 NAAP
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

# Versioning System
BUILD_DATE := $(shell date +%Y%m%d-%H%M%S)
TARGET_PRODUCT_SHORT := $(subst naap_,,$(NAAP_BUILD))

NAAP_BUILD_VERSION := $(PLATFORM_VERSION)
NAAP_VERSION := $(NAAP_BUILD_VERSION)-$(TARGET_PRODUCT_SHORT)-$(BUILD_DATE)
ROM_FINGERPRINT := NAAP/$(PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(shell date -u +%H%M)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
  ro.naap.build.version=$(NAAP_BUILD_VERSION) \
  ro.naap.build.date=$(BUILD_DATE) \
  ro.naap.buildtype=$(NAAP_BUILDTYPE) \
  ro.naap.fingerprint=$(ROM_FINGERPRINT) \
  ro.naap.version=$(NAAP_VERSION) \
  ro.naap.device=$(NAAP_BUILD) \
  ro.modversion=$(NAAP_VERSION)

# Signing
ifneq (eng,$(TARGET_BUILD_VARIANT))
ifneq (,$(wildcard vendor/naap/signing/keys/releasekey.pk8))
PRODUCT_DEFAULT_DEV_CERTIFICATE := vendor/naap/signing/keys/releasekey
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.oem_unlock_supported=1
endif
ifneq (,$(wildcard vendor/naap/signing/keys/otakey.x509.pem))
PRODUCT_OTA_PUBLIC_KEYS := vendor/naap/signing/keys/otakey.x509.pem
endif
endif
