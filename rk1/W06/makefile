CC = gcc
CFLAGS = -Wall -O2
LDFLAGS = -lX11

TARGET = icon_editor

all: $(TARGET)

$(TARGET): icon_editor.c
	$(CC) $(CFLAGS) -o $(TARGET) icon_editor.c $(LDFLAGS)

clean:
	rm -f $(TARGET)