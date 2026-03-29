#include <stdio.h>
#include <stdlib.h>
#include <X11/Xlib.h>
#include <X11/Xutil.h>
#include <X11/keysym.h>

/* Явное определение Pixel на случай, если Xlib его не предоставляет */
#ifndef Pixel
typedef unsigned long Pixel;
#endif

/* Структура для хранения цветов двух треугольников в клетке */
typedef struct {
    Pixel tri[2];   /* tri[0] и tri[1] — цвета двух треугольников */
} Cell;

/* Глобальные переменные */
Display *dpy;
Window win;
GC gc;
int screen;
int rows, cols, cell_size;
Cell **cells;
Pixel color_red, color_green, color_blue;

/* Прототипы функций */
void init_colors(void);
void draw_triangle(int row, int col, int idx);
void draw_diagonal(int row, int col);
void draw_cell(int row, int col);
void draw_grid(void);
void draw_all(void);
int get_triangle_index(int row, int col, int dx, int dy);
void set_all_triangles(Pixel color);
void free_cells(void);

/* Инициализация цветов */
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

/* Рисование одного треугольника в клетке (row, col) с заданным индексом (0 или 1) */
void draw_triangle(int row, int col, int idx) {
    int x0 = col * cell_size;
    int y0 = row * cell_size;
    int w = cell_size;
    XPoint points[3];

    /* Определяем ориентацию диагонали */
    int even = ((row + col) % 2 == 0);   /* true для '/' , false для '\' */

    if (even) {   /* диагональ '/' (из левого верха в правый низ) */
        if (idx == 0) {   /* треугольник выше диагонали (y <= x) */
            points[0].x = x0;           points[0].y = y0;
            points[1].x = x0 + w - 1;   points[1].y = y0;
            points[2].x = x0 + w - 1;   points[2].y = y0 + w - 1;
        } else {          /* треугольник ниже диагонали (y >= x) */
            points[0].x = x0;           points[0].y = y0;
            points[1].x = x0;           points[1].y = y0 + w - 1;
            points[2].x = x0 + w - 1;   points[2].y = y0 + w - 1;
        }
    } else {      /* диагональ '\' (из правого верха в левый низ) */
        if (idx == 0) {   /* треугольник выше диагонали (y <= -x + w-1) */
            points[0].x = x0;           points[0].y = y0;
            points[1].x = x0 + w - 1;   points[1].y = y0;
            points[2].x = x0;           points[2].y = y0 + w - 1;
        } else {          /* треугольник ниже диагонали (y >= -x + w-1) */
            points[0].x = x0 + w - 1;   points[0].y = y0;
            points[1].x = x0 + w - 1;   points[1].y = y0 + w - 1;
            points[2].x = x0;           points[2].y = y0 + w - 1;
        }
    }

    XSetForeground(dpy, gc, cells[row][col].tri[idx]);
    XFillPolygon(dpy, win, gc, points, 3, Convex, CoordModeOrigin);
}

/* Рисование диагонали (границы между треугольниками) внутри клетки (белым цветом) */
void draw_diagonal(int row, int col) {
    int x0 = col * cell_size;
    int y0 = row * cell_size;
    int w = cell_size;
    int even = ((row + col) % 2 == 0);
    XSetForeground(dpy, gc, WhitePixel(dpy, screen));
    if (even) {
        /* Диагональ '/' */
        XDrawLine(dpy, win, gc, x0, y0, x0 + w - 1, y0 + w - 1);
    } else {
        /* Диагональ '\' */
        XDrawLine(dpy, win, gc, x0 + w - 1, y0, x0, y0 + w - 1);
    }
}

/* Рисование сетки (горизонтальные и вертикальные линии между клетками) белым цветом */
void draw_grid(void) {
    int width = cols * cell_size;
    int height = rows * cell_size;
    XSetForeground(dpy, gc, WhitePixel(dpy, screen));

    /* Вертикальные линии (между столбцами) */
    for (int j = 1; j < cols; j++) {
        int x = j * cell_size;
        XDrawLine(dpy, win, gc, x, 0, x, height);
    }
    /* Горизонтальные линии (между рядами) */
    for (int i = 1; i < rows; i++) {
        int y = i * cell_size;
        XDrawLine(dpy, win, gc, 0, y, width, y);
    }
    /* Внешняя рамка */
    XDrawRectangle(dpy, win, gc, 0, 0, width, height);
}

/* Перерисовка всей клетки (обоих треугольников + диагональ) */
void draw_cell(int row, int col) {
    draw_triangle(row, col, 0);
    draw_triangle(row, col, 1);
    draw_diagonal(row, col);
}

/* Перерисовка всего окна (сетка рисуется после всех клеток) */
void draw_all(void) {
    /* Сначала заливаем все треугольники */
    for (int i = 0; i < rows; i++)
        for (int j = 0; j < cols; j++) {
            draw_triangle(i, j, 0);
            draw_triangle(i, j, 1);
        }
    /* Затем рисуем диагонали поверх */
    for (int i = 0; i < rows; i++)
        for (int j = 0; j < cols; j++)
            draw_diagonal(i, j);
    /* Затем рисуем сетку (линии между клетками и рамку) */
    draw_grid();
    XFlush(dpy);
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

/* Установка цвета для всех треугольников */
void set_all_triangles(Pixel color) {
    for (int i = 0; i < rows; i++)
        for (int j = 0; j < cols; j++) {
            cells[i][j].tri[0] = color;
            cells[i][j].tri[1] = color;
        }
}

/* Освобождение памяти */
void free_cells(void) {
    for (int i = 0; i < rows; i++)
        free(cells[i]);
    free(cells);
}

/* Точка входа */
int main(int argc, char *argv[]) {
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <rows> <cols> <cell_size>\n", argv[0]);
        return 1;
    }

    rows = atoi(argv[1]);
    cols = atoi(argv[2]);
    cell_size = atoi(argv[3]);
    if (rows <= 0 || cols <= 0 || cell_size <= 0) {
        fprintf(stderr, "All arguments must be positive integers.\n");
        return 1;
    }

    /* Открытие дисплея */
    dpy = XOpenDisplay(NULL);
    if (!dpy) {
        fprintf(stderr, "Cannot open display.\n");
        return 1;
    }
    screen = DefaultScreen(dpy);

    /* Создание окна */
    int width = cols * cell_size;
    int height = rows * cell_size;
    win = XCreateSimpleWindow(dpy, RootWindow(dpy, screen),
                              0, 0, width, height, 0,
                              BlackPixel(dpy, screen), WhitePixel(dpy, screen));
    XSelectInput(dpy, win, ExposureMask | ButtonPressMask | KeyPressMask);
    XMapWindow(dpy, win);

    /* Создание графического контекста */
    gc = XCreateGC(dpy, win, 0, NULL);

    /* Инициализация цветов */
    init_colors();

    /* Выделение памяти для матрицы клеток */
    cells = (Cell **)malloc(rows * sizeof(Cell *));
    for (int i = 0; i < rows; i++) {
        cells[i] = (Cell *)malloc(cols * sizeof(Cell));
        for (int j = 0; j < cols; j++) {
            cells[i][j].tri[0] = color_red;
            cells[i][j].tri[1] = color_red;
        }
    }

    /* Главный цикл обработки событий */
    XEvent ev;
    int running = 1;
    while (running) {
        XNextEvent(dpy, &ev);
        switch (ev.type) {
            case Expose:
                if (ev.xexpose.count == 0)
                    draw_all();
                break;

            case ButtonPress:
                {
                    int x = ev.xbutton.x;
                    int y = ev.xbutton.y;
                    int col = x / cell_size;
                    int row = y / cell_size;
                    if (row >= 0 && row < rows && col >= 0 && col < cols) {
                        int dx = x % cell_size;
                        int dy = y % cell_size;
                        int idx = get_triangle_index(row, col, dx, dy);
                        Pixel new_color;
                        if (ev.xbutton.button == Button1)
                            new_color = color_red;
                        else if (ev.xbutton.button == Button2)
                            new_color = color_green;
                        else if (ev.xbutton.button == Button3)
                            new_color = color_blue;
                        else
                            break;
                        cells[row][col].tri[idx] = new_color;
                        draw_cell(row, col);   /* перерисовываем всю клетку */
                        /* Перерисовываем сетку поверх (чтобы линии не стёрлись) */
                        draw_grid();
                        XFlush(dpy);
                    }
                }
                break;

            case KeyPress:
                {
                    KeySym ks = XLookupKeysym(&ev.xkey, 0);
                    if (ks == XK_Escape) {
                        running = 0;
                    } else if (ks == XK_r || ks == XK_R) {
                        set_all_triangles(color_red);
                        draw_all();
                    } else if (ks == XK_g || ks == XK_G) {
                        set_all_triangles(color_green);
                        draw_all();
                    } else if (ks == XK_b || ks == XK_B) {
                        set_all_triangles(color_blue);
                        draw_all();
                    }
                }
                break;

            default:
                break;
        }
    }

    /* Освобождение ресурсов */
    free_cells();
    XFreeGC(dpy, gc);
    XDestroyWindow(dpy, win);
    XCloseDisplay(dpy);
    return 0;
}