TEMP_DIR := $(shell mktemp -d)
build:
	xcodebuild  -configuration Release SYMROOT=$(TEMP_DIR) build
	cp -f $(TEMP_DIR)/Release/CLSPM /usr/local/bin/CLSPM
	rm -r $(TEMP_DIR)