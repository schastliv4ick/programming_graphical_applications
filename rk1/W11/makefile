CC = gcc
CFLAGS = -Wall -O2
LDFLAGS = -lX11
TARGET = outer_product_editor

all: $(TARGET)

$(TARGET): outer_product_editor.c
	$(CC) $(CFLAGS) -o $(TARGET) outer_product_editor.c $(LDFLAGS)

clean:
	rm -f $(TARGET)