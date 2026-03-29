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

/* Структура для хранения цветов двух треугольников в клетке */
typedef struct {
    Pixel tri[2];   /* tri[0] и tri[1] — цвета двух треугольников */
} Cell;

/* Глобальные переменные (extern) */
extern Display *dpy;
extern Window win;
extern GC gc;
extern int screen;
extern int rows, cols, cell_size;
extern Cell **cells;
extern Pixel color_red, color_green, color_blue;

/* Прототипы функций из logic.c */
void init_colors(void);
void set_all_triangles(Pixel color);
void free_cells(void);
int get_triangle_index(int row, int col, int dx, int dy);

/* Прототипы функций из display.c */
void draw_triangle(int row, int col, int idx);
void draw_diagonal(int row, int col);
void draw_cell(int row, int col);
void draw_all(void);
void create_main_window(void);
void allocate_cells(void);
void run_event_loop(void);

#endif