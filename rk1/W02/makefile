CC = gcc
CFLAGS = -Wall -O2
LDFLAGS = -lX11
TARGET = icon_editor_squares

all: $(TARGET)

$(TARGET): icon_editor_squares.c
	$(CC) $(CFLAGS) -o $(TARGET) icon_editor_squares.c $(LDFLAGS)

clean:
	rm -f $(TARGET)