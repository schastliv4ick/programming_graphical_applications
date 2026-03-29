CC = gcc
CFLAGS = -Wall -O2
LDFLAGS = -lX11
TARGET = chess_editor

all: $(TARGET)

$(TARGET): display.c logic.c head.h
	$(CC) $(CFLAGS) -o $(TARGET) display.c logic.c $(LDFLAGS)

clean:
	rm -f $(TARGET)

run: $(TARGET)
	./$(TARGET)

.PHONY: all clean run