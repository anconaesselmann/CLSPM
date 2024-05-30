TEMP_DIR := $(shell mktemp -d)
build:
	xcodebuild  -configuration Release SYMROOT=$(TEMP_DIR) build
	cp -f $(TEMP_DIR)/Release/SPMM /usr/local/bin/SPMM
	rm -r $(TEMP_DIR)