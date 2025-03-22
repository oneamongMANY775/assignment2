# Compiler and flags
CC := gcc
CFLAGS := -Wall -g

# Cross-compile settings (set CROSS_COMPILE to use cross-compilation)
CROSS_COMPILE ?= 

# Define the cross-compiler if CROSS_COMPILE is set
CC_CROSS := $(CROSS_COMPILE)gcc

# Source and output file
SRC := writer.c
OUT := writer

# Default target: builds the writer application
all: $(OUT)

# Target to build the writer application
$(OUT): $(SRC)
	$(CC) $(CFLAGS) -o $(OUT) $(SRC)

# Clean target: removes the writer application and all object files
clean:
	rm -f $(OUT) *.o

# Cross-compilation target: check if CROSS_COMPILE is set, use cross-compiler if specified
cross-compile: CROSS_COMPILE := aarch64-none-linux-gnu-
cross-compile: $(OUT)

# Rule to use cross compiler when CROSS_COMPILE is set
$(OUT): $(SRC)
	$(CC_CROSS) $(CFLAGS) -o $(OUT) $(SRC)

.PHONY: all clean cross-compile

