#include <stdio.h>
#include <stdlib.h>
#include <X11/Xlib.h>
#include <X11/Xutil.h>
#include <X11/keysym.h>

/* Определение Pixel на случай, если заголовки X11 его не предоставляют */
#ifndef Pixel
typedef unsigned long Pixel;
#endif

/* Глобальные переменные */
Display *dpy;
Window main_win;
Window **cells;          /* матрица дочерних окон (rows x cols) */
int screen;
int rows, cols, cell_size;
Pixel color_red, color_green, color_blue;

/* Прототипы функций */
void init_colors(void);
void create_cells(void);
void set_cell_color(Window win, Pixel color);
void set_all_cells(Pixel color);
void destroy_cells(void);

/* Инициализация цветов (получение Pixel из строковых имён) */
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

/* Создание матрицы дочерних окон (ячеек) */
void create_cells(void) {
    int width = cols * cell_size;
    int height = rows * cell_size;

    /* Выделяем память под массив окон */
    cells = (Window **)malloc(rows * sizeof(Window *));
    for (int i = 0; i < rows; i++) {
        cells[i] = (Window *)malloc(cols * sizeof(Window));
        for (int j = 0; j < cols; j++) {
            int x = j * cell_size;
            int y = i * cell_size;
            /* Создаём дочернее окно с красным фоном */
            cells[i][j] = XCreateSimpleWindow(dpy, main_win,
                                              x, y, cell_size, cell_size, 0,
                                              BlackPixel(dpy, screen),
                                              color_red);
            /* Разрешаем события нажатия мыши */
            XSelectInput(dpy, cells[i][j], ButtonPressMask);
            /* Отображаем окно */
            XMapWindow(dpy, cells[i][j]);
        }
    }
}

/* Изменение цвета фона конкретного окна */
void set_cell_color(Window win, Pixel color) {
    XSetWindowBackground(dpy, win, color);
    XClearWindow(dpy, win);   /* немедленно обновить */
    XFlush(dpy);
}

/* Установка цвета для всех ячеек */
void set_all_cells(Pixel color) {
    for (int i = 0; i < rows; i++)
        for (int j = 0; j < cols; j++)
            set_cell_color(cells[i][j], color);
}

/* Освобождение памяти и уничтожение окон */
void destroy_cells(void) {
    for (int i = 0; i < rows; i++) {
        for (int j = 0; j < cols; j++)
            XDestroyWindow(dpy, cells[i][j]);
        free(cells[i]);
    }
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

    /* Создание главного окна (контейнера) */
    int main_width = cols * cell_size;
    int main_height = rows * cell_size;
    main_win = XCreateSimpleWindow(dpy, RootWindow(dpy, screen),
                                   0, 0, main_width, main_height, 1,
                                   BlackPixel(dpy, screen), WhitePixel(dpy, screen));
    /* Главное окно реагирует на нажатия клавиш */
    XSelectInput(dpy, main_win, KeyPressMask);
    XMapWindow(dpy, main_win);

    /* Инициализация цветов */
    init_colors();

    /* Создание матрицы ячеек (все красные) */
    create_cells();

    /* Главный цикл обработки событий */
    XEvent ev;
    int running = 1;
    while (running) {
        XNextEvent(dpy, &ev);

        switch (ev.type) {
            case KeyPress: {
                KeySym ks = XLookupKeysym(&ev.xkey, 0);
                if (ks == XK_Escape) {
                    running = 0;
                } else if (ks == XK_r || ks == XK_R) {
                    set_all_cells(color_red);
                } else if (ks == XK_g || ks == XK_G) {
                    set_all_cells(color_green);
                } else if (ks == XK_b || ks == XK_B) {
                    set_all_cells(color_blue);
                }
                break;
            }

            case ButtonPress: {
                /* Определяем, по какому дочернему окну был клик */
                Window clicked = ev.xbutton.window;
                Pixel new_color;

                /* Определяем нажатую кнопку */
                if (ev.xbutton.button == Button1)
                    new_color = color_red;
                else if (ev.xbutton.button == Button2)
                    new_color = color_green;
                else if (ev.xbutton.button == Button3)
                    new_color = color_blue;
                else
                    break; /* другая кнопка */

                /* Ищем окно в матрице и меняем его цвет */
                int found = 0;
                for (int i = 0; i < rows && !found; i++) {
                    for (int j = 0; j < cols; j++) {
                        if (cells[i][j] == clicked) {
                            set_cell_color(clicked, new_color);
                            found = 1;
                            break;
                        }
                    }
                }
                break;
            }

            default:
                break;
        }
    }

    /* Освобождение ресурсов */
    destroy_cells();
    XDestroyWindow(dpy, main_win);
    XCloseDisplay(dpy);
    return 0;
}