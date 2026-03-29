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

/* Установка цвета для всех ячеек */
void set_all_cells(Pixel color) {
    for (int i = 0; i < rows; i++)
        for (int j = 0; j < cols; j++)
            set_cell_color(cells[i][j], color);
}

/* Освобождение памяти, выделенной под матрицу окон */
void free_cells(void) {
    for (int i = 0; i < rows; i++)
        free(cells[i]);
    free(cells);
}