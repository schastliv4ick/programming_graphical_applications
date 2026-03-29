CC = gcc
CFLAGS = -Wall -O2
LDFLAGS = -lX11
TARGET = chess_editor

all: $(TARGET)

$(TARGET): chess_editor.c
	$(CC) $(CFLAGS) -o $(TARGET) chess_editor.c $(LDFLAGS)

clean:
	rm -f $(TARGET)