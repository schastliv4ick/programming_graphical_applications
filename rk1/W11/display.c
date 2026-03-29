#include "head.h"

/* Определения графических переменных (без extern) */
Display *dpy;
Window main_win;
int screen;
int N;
Window *horz_cells = NULL;
Window *vert_cells = NULL;
Window **mat_cells = NULL;
Pixel color_0, color_1;

/* Инициализация цветов (серый для 0, зелёный для 1) */
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

/* Изменение цвета фона окна */
void set_cell_color(Window win, Pixel color) {
    XSetWindowBackground(dpy, win, color);
    XClearWindow(dpy, win);
}

/* Обновление всех окон в соответствии с текущими значениями векторов и матрицы */
void update_display(void) {
    /* Горизонтальный вектор */
    for (int j = 0; j < N; j++)
        set_cell_color(horz_cells[j], horz_vals[j] ? color_1 : color_0);
    /* Вертикальный вектор */
    for (int i = 0; i < N; i++)
        set_cell_color(vert_cells[i], vert_vals[i] ? color_1 : color_0);
    /* Матрица */
    for (int i = 0; i < N; i++)
        for (int j = 0; j < N; j++)
            set_cell_color(mat_cells[i][j], mat_vals[i][j] ? color_1 : color_0);
    XFlush(dpy);
}

/* Создание всех окон (главное, векторные, матричные) */
void create_windows(void) {
    int width = CELL_SIZE + N * CELL_SIZE;
    int height = CELL_SIZE + N * CELL_SIZE;

    /* Главное окно */
    main_win = XCreateSimpleWindow(dpy, RootWindow(dpy, screen),
                                   0, 0, width, height, 1,
                                   BlackPixel(dpy, screen), WhitePixel(dpy, screen));
    XSelectInput(dpy, main_win, KeyPressMask);
    XMapWindow(dpy, main_win);

    /* Выделение памяти для массивов окон */
    horz_cells = (Window *)malloc(N * sizeof(Window));
    vert_cells = (Window *)malloc(N * sizeof(Window));
    mat_cells = (Window **)malloc(N * sizeof(Window *));
    for (int i = 0; i < N; i++)
        mat_cells[i] = (Window *)malloc(N * sizeof(Window));

    /* Горизонтальный вектор (строка) – y=0, x начинается с CELL_SIZE */
    for (int j = 0; j < N; j++) {
        int x = CELL_SIZE + j * CELL_SIZE;
        horz_cells[j] = XCreateSimpleWindow(dpy, main_win,
                                            x, 0, CELL_SIZE, CELL_SIZE, 1,
                                            BlackPixel(dpy, screen), color_0);
        XSelectInput(dpy, horz_cells[j], ButtonPressMask);
        XMapWindow(dpy, horz_cells[j]);
    }

    /* Вертикальный вектор (столбец) – x=0, y начинается с CELL_SIZE */
    for (int i = 0; i < N; i++) {
        int y = CELL_SIZE + i * CELL_SIZE;
        vert_cells[i] = XCreateSimpleWindow(dpy, main_win,
                                            0, y, CELL_SIZE, CELL_SIZE, 1,
                                            BlackPixel(dpy, screen), color_0);
        XSelectInput(dpy, vert_cells[i], ButtonPressMask);
        XMapWindow(dpy, vert_cells[i]);
    }

    /* Матрица внешнего произведения */
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            int x = CELL_SIZE + j * CELL_SIZE;
            int y = CELL_SIZE + i * CELL_SIZE;
            mat_cells[i][j] = XCreateSimpleWindow(dpy, main_win,
                                                  x, y, CELL_SIZE, CELL_SIZE, 1,
                                                  BlackPixel(dpy, screen), color_0);
            XMapWindow(dpy, mat_cells[i][j]);
        }
    }
    XFlush(dpy);
}

/* Уничтожение всех окон и освобождение памяти */
void destroy_windows(void) {
    if (horz_cells) {
        for (int j = 0; j < N; j++) XDestroyWindow(dpy, horz_cells[j]);
        free(horz_cells);
    }
    if (vert_cells) {
        for (int i = 0; i < N; i++) XDestroyWindow(dpy, vert_cells[i]);
        free(vert_cells);
    }
    if (mat_cells) {
        for (int i = 0; i < N; i++) {
            for (int j = 0; j < N; j++) XDestroyWindow(dpy, mat_cells[i][j]);
            free(mat_cells[i]);
        }
        free(mat_cells);
    }
    XDestroyWindow(dpy, main_win);
}

/* Главный цикл обработки событий X11 */
void run_event_loop(void) {
    XEvent ev;
    int running = 1;
    while (running) {
        XNextEvent(dpy, &ev);
        if (ev.type == KeyPress) {
            KeySym ks = XLookupKeysym(&ev.xkey, 0);
            unsigned int mod = ev.xkey.state;
            if ((mod & ControlMask) && (ks == XK_c || ks == XK_C)) {
                running = 0;
            } else if (ks == XK_Escape) {
                reset_all();
                update_display();
            } else if ((mod & Mod1Mask) && (ks == XK_v || ks == XK_V)) {
                invert_all_vert();
                update_display();
            } else if ((mod & Mod1Mask) && (ks == XK_h || ks == XK_H)) {
                invert_all_horz();
                update_display();
            }
        } else if (ev.type == ButtonPress) {
            Window clicked = ev.xbutton.window;
            /* Поиск среди горизонтальных ячеек */
            for (int j = 0; j < N; j++) {
                if (horz_cells[j] == clicked) {
                    invert_horz_cell(j);
                    update_display();
                    break;
                }
            }
            /* Поиск среди вертикальных ячеек */
            for (int i = 0; i < N; i++) {
                if (vert_cells[i] == clicked) {
                    invert_vert_cell(i);
                    update_display();
                    break;
                }
            }
        }
    }
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
    init_logic();          /* инициализация массивов значений (все нули) */
    compute_outer_product(); /* начальное вычисление матрицы */
    update_display();      /* отображение начального состояния */

    run_event_loop();

    destroy_windows();
    free_logic();
    XCloseDisplay(dpy);
    return 0;
}