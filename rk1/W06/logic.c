#include "head.h"

/* Инициализация цветов (красный, зелёный, синий) */
void init_colors(void) {
    Colormap cmap = DefaultColormap(dpy, screen);
    XColor xcol;

    XParseColor(dpy, cmap, "red", &xcol);
    XAllocColor(dpy, cmap, &xcol);
    color_red = xcol.pixel;

    XParseColor(dpy, cmap, "green", &xcol);
    XAllocColor(dpy, cmap, &xcol);
    color_green = xcol.pixel;

    XParseColor(dpy, cmap, "blue", &xcol);
    XAllocColor(dpy, cmap, &xcol);
    color_blue = xcol.pixel;
}

/* Установка цвета для всех треугольников */
void set_all_triangles(Pixel color) {
    for (int i = 0; i < rows; i++)
        for (int j = 0; j < cols; j++) {
            cells[i][j].tri[0] = color;
            cells[i][j].tri[1] = color;
        }
}

/* Освобождение памяти, выделенной под матрицу клеток */
void free_cells(void) {
    for (int i = 0; i < rows; i++)
        free(cells[i]);
    free(cells);
}

/* Определение индекса треугольника (0 или 1) по координатам мыши внутри клетки */
int get_triangle_index(int row, int col, int dx, int dy) {
    int w = cell_size;
    int even = ((row + col) % 2 == 0);
    if (even) {   /* диагональ '/' */
        return (dy <= dx) ? 0 : 1;
    } else {      /* диагональ '\' */
        return (dy <= (w - 1 - dx)) ? 0 : 1;
    }
}