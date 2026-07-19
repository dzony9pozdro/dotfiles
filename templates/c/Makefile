CC = clang
CFLAGS = -std=c17 -Wall -Wextra -Wshadow -Wconversion -g
CFLAGS += -fsanitize=address,undefined -fno-omit-frame-pointer
LDFLAGS = -fsanitize=address,undefined
LDLIBS =

TARGET = $(notdir $(CURDIR))
SRCS = $(wildcard *.c)

$(TARGET): $(SRCS)
	$(CC) $(CFLAGS) $(LDFLAGS) $(SRCS) $(LDLIBS) -o $@

run: $(TARGET)
	MallocNanoZone=0 ./$(TARGET)

clean:
	rm -f $(TARGET)

.PHONY: run clean
