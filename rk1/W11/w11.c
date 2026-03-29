#include <stdio.h>
#include <stdlib.h>
#include <X11/Xlib.h>
#include <X11/Xutil.h>
#include <X11/keysym.h>

#define CELL_SIZE 40   /* размер одной ячейки в пикселях */

/* Глобальные переменные */
Display *dpy;
Window main_win;
int screen;
int N;                     /* размерность векторов */
Window *horz_cells;        /* горизонтальный вектор (строка) – N окон */
Window *vert_cells;        /* вертикальный вектор (столбец) – N окон */
Window **mat_cells;        /* матрица N x N */
int *horz_vals;            /* значения горизонтального вектора (0/1) */
int *vert_vals;            /* значения вертикального вектора (0/1) */
Pixel color_0, color_1;    /* цвета для 0 и 1 */

/* Прототипы функций */
void init_colors(void);
void create_windows(void);
void set_cell_color(Window win, Pixel color);
void update_matrix(void);
void invert_horz_cell(int idx);
void invert_vert_cell(int idx);
void invert_all_horz(void);
void invert_all_vert(void);
void reset_all(void);
void destroy_windows(void);

/* Инициализация цветов через XColor */
void init_colors(void) {
    Colormap cmap = DefaultColormap(dpy, screen);
    XColor xcol;

    XParseColor(dpy, cmap, "gray40", &xcol);
    XAllocColor(dpy, cmap, &xcol);
    color_0 = xcol.pixel;

    XParseColor(dpy, cmap, "green", &xcol);
    XAllocColor(dpy, cmap, &xcol);
    color_1 = xcol.pixel;
}

/* Создание всех окон (главное + дочерние) */
void create_windows(void) {
    int width = CELL_SIZE + N * CELL_SIZE;
    int height = CELL_SIZE + N * CELL_SIZE;

    /* Главное окно */
    main_win = XCreateSimpleWindow(dpy, RootWindow(dpy, screen),
                                   0, 0, width, height, 1,
                                   BlackPixel(dpy, screen),
                                   WhitePixel(dpy, screen));
    XSelectInput(dpy, main_win, KeyPressMask);
    XMapWindow(dpy, main_win);

    /* Выделение памяти для массивов */
    horz_cells = (Window *)malloc(N * sizeof(Window));
    vert_cells = (Window *)malloc(N * sizeof(Window));
    mat_cells = (Window **)malloc(N * sizeof(Window *));
    for (int i = 0; i < N; i++)
        mat_cells[i] = (Window *)malloc(N * sizeof(Window));

    horz_vals = (int *)calloc(N, sizeof(int));
    vert_vals = (int *)calloc(N, sizeof(int));

    /* Создание горизонтального вектора (строка) – y=0, x начинается с CELL_SIZE */
    for (int j = 0; j < N; j++) {
        int x = CELL_SIZE + j * CELL_SIZE;
        horz_cells[j] = XCreateSimpleWindow(dpy, main_win,
                                            x, 0, CELL_SIZE, CELL_SIZE, 0,
                                            BlackPixel(dpy, screen), color_0);
        XSelectInput(dpy, horz_cells[j], ButtonPressMask);
        XMapWindow(dpy, horz_cells[j]);
    }

    /* Создание вертикального вектора (столбец) – x=0, y начинается с CELL_SIZE */
    for (int i = 0; i < N; i++) {
        int y = CELL_SIZE + i * CELL_SIZE;
        vert_cells[i] = XCreateSimpleWindow(dpy, main_win,
                                            0, y, CELL_SIZE, CELL_SIZE, 0,
                                            BlackPixel(dpy, screen), color_0);
        XSelectInput(dpy, vert_cells[i], ButtonPressMask);
        XMapWindow(dpy, vert_cells[i]);
    }

    /* Создание матрицы внешнего произведения */
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            int x = CELL_SIZE + j * CELL_SIZE;
            int y = CELL_SIZE + i * CELL_SIZE;
            mat_cells[i][j] = XCreateSimpleWindow(dpy, main_win,
                                                  x, y, CELL_SIZE, CELL_SIZE, 0,
                                                  BlackPixel(dpy, screen), color_0);
            XMapWindow(dpy, mat_cells[i][j]);
            /* Матричные окна не обрабатывают события мыши */
        }
    }

    XFlush(dpy);
}

/* Установка цвета фона окна и его очистка */
void set_cell_color(Window win, Pixel color) {
    XSetWindowBackground(dpy, win, color);
    XClearWindow(dpy, win);
}

/* Пересчёт всей матрицы по текущим значениям векторов */
void update_matrix(void) {
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            int val = vert_vals[i] & horz_vals[j];
            set_cell_color(mat_cells[i][j], val ? color_1 : color_0);
        }
    }
    XFlush(dpy);
}

/* Инверсия одной ячейки горизонтального вектора */
void invert_horz_cell(int idx) {
    horz_vals[idx] ^= 1;
    set_cell_color(horz_cells[idx], horz_vals[idx] ? color_1 : color_0);
    update_matrix();
}

/* Инверсия одной ячейки вертикального вектора */
void invert_vert_cell(int idx) {
    vert_vals[idx] ^= 1;
    set_cell_color(vert_cells[idx], vert_vals[idx] ? color_1 : color_0);
    update_matrix();
}

/* Инверсия всего горизонтального вектора */
void invert_all_horz(void) {
    for (int j = 0; j < N; j++) {
        horz_vals[j] ^= 1;
        set_cell_color(horz_cells[j], horz_vals[j] ? color_1 : color_0);
    }
    update_matrix();
}

/* Инверсия всего вертикального вектора */
void invert_all_vert(void) {
    for (int i = 0; i < N; i++) {
        vert_vals[i] ^= 1;
        set_cell_color(vert_cells[i], vert_vals[i] ? color_1 : color_0);
    }
    update_matrix();
}

/* Сброс всех векторов в 0 */
void reset_all(void) {
    for (int j = 0; j < N; j++) {
        horz_vals[j] = 0;
        set_cell_color(horz_cells[j], color_0);
    }
    for (int i = 0; i < N; i++) {
        vert_vals[i] = 0;
        set_cell_color(vert_cells[i], color_0);
    }
    update_matrix();
}

/* Освобождение памяти и уничтожение окон */
void destroy_windows(void) {
    for (int j = 0; j < N; j++)
        XDestroyWindow(dpy, horz_cells[j]);
    for (int i = 0; i < N; i++)
        XDestroyWindow(dpy, vert_cells[i]);
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++)
            XDestroyWindow(dpy, mat_cells[i][j]);
        free(mat_cells[i]);
    }
    free(horz_cells);
    free(vert_cells);
    free(mat_cells);
    free(horz_vals);
    free(vert_vals);
    XDestroyWindow(dpy, main_win);
}

/* Точка входа */
int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <dimension>\n", argv[0]);
        return 1;
    }

    N = atoi(argv[1]);
    if (N <= 0) {
        fprintf(stderr, "Dimension must be positive.\n");
        return 1;
    }

    dpy = XOpenDisplay(NULL);
    if (!dpy) {
        fprintf(stderr, "Cannot open display.\n");
        return 1;
    }
    screen = DefaultScreen(dpy);

    init_colors();
    create_windows();

    XEvent ev;
    int running = 1;
    while (running) {
        XNextEvent(dpy, &ev);

        if (ev.type == KeyPress) {
            KeySym ks = XLookupKeysym(&ev.xkey, 0);
            unsigned int mod = ev.xkey.state;

            /* Ctrl+C: выход */
            if ((mod & ControlMask) && (ks == XK_c || ks == XK_C)) {
                running = 0;
            }
            /* Esc: сброс всех векторов в 0 */
            else if (ks == XK_Escape) {
                reset_all();
            }
            /* Alt+V (Mod1 = Alt) – инвертировать вертикальный вектор */
            else if ((mod & Mod1Mask) && (ks == XK_v || ks == XK_V)) {
                invert_all_vert();
            }
            /* Alt+H – инвертировать горизонтальный вектор */
            else if ((mod & Mod1Mask) && (ks == XK_h || ks == XK_H)) {
                invert_all_horz();
            }
        }
        else if (ev.type == ButtonPress) {
            Window clicked = ev.xbutton.window;
            /* Поиск среди горизонтальных ячеек */
            for (int j = 0; j < N; j++) {
                if (horz_cells[j] == clicked) {
                    invert_horz_cell(j);
                    break;
                }
            }
            /* Поиск среди вертикальных ячеек */
            for (int i = 0; i < N; i++) {
                if (vert_cells[i] == clicked) {
                    invert_vert_cell(i);
                    break;
                }
            }
        }
    }

    destroy_windows();
    XCloseDisplay(dpy);
    return 0;
}