CXX = clang++
SDL = -framework SDL2
CXXFLAGS = -Wall -c -std=c++11
LDFLAGS = $(SDL)
# The source and build output directories
SRC = src
BUILD = build
# Executables will be written to the top level of the repo under out/
OUT = out
EXE = $(OUT)/game

all: $(EXE)

$(EXE): $(BUILD)/main.o | $(OUT)
	$(CXX) $(LDFLAGS) $< -o $@

$(BUILD)/main.o: $(SRC)/main.cpp | $(BUILD)
	$(CXX) $(CXXFLAGS) $< -o $@

# Make sure the build directory exists
$(BUILD):
	mkdir -p $(BUILD)

# Make sure the output directory exists
$(OUT):
	mkdir -p $(OUT)

.PHONY: clean
clean:
	rm $(BUILD)/*.o && rm $(EXE)

