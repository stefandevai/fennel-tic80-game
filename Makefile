SOURCE_DIR=source
BUILD_DIR=build
OUT_FILE=$(BUILD_DIR)/game.lua

SOURCE_FILES=$(sort $(wildcard ${SOURCE_DIR}/*.fnl))
LUA_FILES=$(patsubst %.fnl,%.lua,$(patsubst $(SOURCE_DIR),$(BUILD_DIR),$(SOURCE_FILES)))

compile: $(OUT_FILE)

$(BUILD_DIR)/out.fnl:
	mkdir -p $(BUILD_DIR)
	cat $(SOURCE_FILES) > $@

$(OUT_FILE): $(BUILD_DIR)/out.fnl
	fennel --compile $< > $@

run: ${OUT_FILE}; tic80 -code-watch $<

clean: ; rm $(BUILD_DIR)/*

server: ; python -m SimpleHTTPServer 8000

.PHONY: server clean run compile
