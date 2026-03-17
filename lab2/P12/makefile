# Makefile для сборки лабораторной работы №2 (X11)

CC = gcc
CFLAGS = -Wall -O2
LDFLAGS = -lX11

# Имена объектных файлов
OBJS = lab2_control.o lab2_display.o lab2_geom.o

# Имя исполняемого файла
TARGET = lab2

# Правило по умолчанию
all: $(TARGET)

# Линковка объектных файлов в исполняемый файл
$(TARGET): $(OBJS)
	$(CC) $(OBJS) $(LDFLAGS) -o $(TARGET)

# Компиляция каждого .c файла в .o
lab2_control.o: lab2_control.c lab2.h
	$(CC) $(CFLAGS) -c lab2_control.c

lab2_display.o: lab2_display.c lab2.h
	$(CC) $(CFLAGS) -c lab2_display.c

lab2_geom.o: lab2_geom.c lab2.h
	$(CC) $(CFLAGS) -c lab2_geom.c

# Очистка временных файлов
clean:
	rm -f $(OBJS) $(TARGET)

# Установка, что clean не является файлом
.PHONY: all clean