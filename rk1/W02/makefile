CC = gcc
CFLAGS = -Wall -O2
LDFLAGS = -lX11
TARGET = icon_editor_squares

all: $(TARGET)

$(TARGET): display.c logic.c head.h
	$(CC) $(CFLAGS) -o $(TARGET) display.c logic.c $(LDFLAGS)

clean:
	rm -f $(TARGET)

run: $(TARGET)
	./$(TARGET) 8 10 50

.PHONY: all clean run