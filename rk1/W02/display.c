#include "head.h"

/* Определения глобальных переменных (без extern) */
Display *dpy;
Window main_win;
Window **cells;
int screen;
int rows, cols, cell_size;
Pixel color_red, color_green, color_blue;

/* Создание главного окна-контейнера */
void create_main_window(void) {
    int width = cols * cell_size;
    int height = rows * cell_size;
    main_win = XCreateSimpleWindow(dpy, RootWindow(dpy, screen),
                                   0, 0, width, height, 1,
                                   BlackPixel(dpy, screen), WhitePixel(dpy, screen));
    XSelectInput(dpy, main_win, KeyPressMask);
    XMapWindow(dpy, main_win);
}

/* Создание матрицы дочерних окон (ячеек) */
void create_cells(void) {
    cells = (Window **)malloc(rows * sizeof(Window *));
    for (int i = 0; i < rows; i++) {
        cells[i] = (Window *)malloc(cols * sizeof(Window));
        for (int j = 0; j < cols; j++) {
            int x = j * cell_size;
            int y = i * cell_size;
            cells[i][j] = XCreateSimpleWindow(dpy, main_win,
                                              x, y, cell_size, cell_size, 0,
                                              BlackPixel(dpy, screen),
                                              color_red);
            XSelectInput(dpy, cells[i][j], ButtonPressMask);
            XMapWindow(dpy, cells[i][j]);
        }
    }
}

/* Изменение цвета фона конкретного окна */
void set_cell_color(Window win, Pixel color) {
    XSetWindowBackground(dpy, win, color);
    XClearWindow(dpy, win);
    XFlush(dpy);
}

/* Главный цикл обработки событий */
void run_event_loop(void) {
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
                Window clicked = ev.xbutton.window;
                Pixel new_color;
                if (ev.xbutton.button == Button1)
                    new_color = color_red;
                else if (ev.xbutton.button == Button2)
                    new_color = color_green;
                else if (ev.xbutton.button == Button3)
                    new_color = color_blue;
                else
                    break;
                /* Поиск окна в матрице */
                for (int i = 0; i < rows; i++) {
                    for (int j = 0; j < cols; j++) {
                        if (cells[i][j] == clicked) {
                            set_cell_color(clicked, new_color);
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

    dpy = XOpenDisplay(NULL);
    if (!dpy) {
        fprintf(stderr, "Cannot open display.\n");
        return 1;
    }
    screen = DefaultScreen(dpy);

    init_colors();
    create_main_window();
    create_cells();

    run_event_loop();

    free_cells();
    XDestroyWindow(dpy, main_win);
    XCloseDisplay(dpy);
    return 0;
}