# Project Makefile for pyramid

# Exec file name

EXEC=pyramid

# Linking libraries

LIBS= -lX11

# Header files names

INCLUDES=pyramid.h

# Headers file directories

HEADDIR= -I.

# cc invoking

CC=cc $(HEADDIR)

# object file names

OBJECTS=pyramid0.o pyramid1.o pyramid2.o

# project dependence

all: $(OBJECTS) $(EXEC)
$(OBJECTS): $(INCLUDES)
$(EXEC): $(OBJECTS) $(INCLUDES)
	$(CC) -o $(EXEC) $(OBJECTS) $(LIBS)

