#ifndef HEAD_H
#define HEAD_H

#include <stdio.h>
#include <stdlib.h>
#include <X11/Xlib.h>
#include <X11/Xutil.h>
#include <X11/keysym.h>

/* Явное определение Pixel для надёжности */
#ifndef Pixel
typedef unsigned long Pixel;
#endif

/* Глобальные переменные (extern) */
extern Display *dpy;
extern Window main_win;
extern Window **cells;
extern int screen;
extern int rows, cols, cell_size;
extern Pixel color_red, color_green, color_blue;

/* Прототипы функций из logic.c */
void init_colors(void);
void set_all_cells(Pixel color);
void free_cells(void);

/* Прототипы функций из display.c */
void create_main_window(void);
void create_cells(void);
void set_cell_color(Window win, Pixel color);
void run_event_loop(void);

#endif