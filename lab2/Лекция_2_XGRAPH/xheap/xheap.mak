# Project Makefile for process  xheap

# Exec file name

EXEC=xheap

# Linking libraries

LIBS= -lX11

# Header files names

INCLUDES=xheap.h

# Headers file directories

HEADDIR= -I.

# cc invoking

CC=cc $(HEADDIR)

# object file names

OBJECTS=xheap0.o xheap1.o xheap2.o

# project dependence

all: $(OBJECTS) $(EXEC)
$(OBJECTS): $(INCLUDES)
$(EXEC): $(OBJECTS) $(INCLUDES)
	$(CC) -o $(EXEC) $(OBJECTS) $(LIBS)

