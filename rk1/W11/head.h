#ifndef HEAD_H
#define HEAD_H

#include <stdio.h>
#include <stdlib.h>
#include <X11/Xlib.h>
#include <X11/Xutil.h>
#include <X11/keysym.h>

#define CELL_SIZE 40   /* размер ячейки в пикселях */

/* Тип Pixel (на случай, если не определён в Xlib) */
#ifndef Pixel
typedef unsigned long Pixel;
#endif

/* Глобальные переменные (extern) – графические объекты */
extern Display *dpy;
extern Window main_win;
extern int screen;
extern int N;                     /* размерность векторов */
extern Window *horz_cells;        /* окна горизонтального вектора */
extern Window *vert_cells;        /* окна вертикального вектора */
extern Window **mat_cells;        /* окна матрицы */
extern Pixel color_0, color_1;    /* цвета для 0 и 1 */

/* Глобальные переменные (extern) – логические данные */
extern int *horz_vals;            /* значения горизонтального вектора (0/1) */
extern int *vert_vals;            /* значения вертикального вектора (0/1) */
extern int **mat_vals;            /* значения матрицы внешнего произведения */

/* Прототипы функций из logic.c */
void init_logic(void);
void free_logic(void);
void invert_horz_cell(int idx);
void invert_vert_cell(int idx);
void invert_all_horz(void);
void invert_all_vert(void);
void reset_all(void);
void compute_outer_product(void);

/* Прототипы функций из display.c */
void init_colors(void);
void create_windows(void);
void set_cell_color(Window win, Pixel color);
void update_display(void);
void destroy_windows(void);
void run_event_loop(void);

#endif