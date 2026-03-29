#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <X11/Xlib.h>
#include <X11/Xutil.h>
#include <X11/keysym.h>

#define BOARD_SIZE 8
#define CELL_SIZE 60            /* пикселей */
#define WIN_WIDTH (BOARD_SIZE * CELL_SIZE)
#define WIN_HEIGHT (BOARD_SIZE * CELL_SIZE)

/* Типы фигур (буквы) */
typedef enum {
    PIECE_KING = 'K',
    PIECE_QUEEN = 'Q',
    PIECE_ROOK = 'R',
    PIECE_BISHOP = 'B',
    PIECE_KNIGHT = 'N'
} PieceType;

/* Структура для хранения информации о фигуре */
typedef struct {
    Window win;                 /* окно фигуры */
    PieceType type;             /* тип (буква) */
    int row, col;               /* текущая позиция (0-7) */
    int start_row, start_col;   /* начальная позиция (для сброса) */
} Piece;

/* Глобальные переменные */
Display *dpy;
Window main_win;
Window cell_windows[BOARD_SIZE][BOARD_SIZE];
Piece pieces[BOARD_SIZE];       /* всего 8 фигур, но у нас BOARD_SIZE=8 */
int num_pieces = 0;             /* реальное количество фигур (8) */
int occupied[BOARD_SIZE][BOARD_SIZE];  /* индекс фигуры или -1 */
int threats[BOARD_SIZE][BOARD_SIZE];   /* 1 если поле под ударом */

/* Цвета */
Pixel color_light, color_dark;   /* шахматные цвета */
Pixel color_threat;              /* цвет для атакованных полей */
Pixel color_piece_bg;            /* фон окна фигуры (белый) */
GC text_gc;                      /* контекст для рисования текста */
XFontStruct *font_info;          /* шрифт */

/* Начальные позиции фигур (для белых на 0-й горизонтали) */
const int start_positions[8][2] = {
    {0, 0}, {0, 1}, {0, 2}, {0, 3}, {0, 4}, {0, 5}, {0, 6}, {0, 7}
};
const PieceType start_types[8] = {
    PIECE_ROOK, PIECE_KNIGHT, PIECE_BISHOP, PIECE_QUEEN,
    PIECE_KING, PIECE_BISHOP, PIECE_KNIGHT, PIECE_ROOK
};

/* Прототипы функций */
void init_colors(void);
void create_cell_windows(void);
void create_piece_windows(void);
void draw_piece_text(Window win, PieceType type);
void update_cell_colors(void);
void compute_threats(void);
void move_piece(int piece_idx, int new_row, int new_col);
void reset_positions(void);
void free_resources(void);

/* Инициализация цветов через XColor */
void init_colors(void) {
    Colormap cmap = DefaultColormap(dpy, DefaultScreen(dpy));
    XColor xcol;

    /* Светлая клетка (бежевый) */
    XParseColor(dpy, cmap, "bisque2", &xcol);
    XAllocColor(dpy, cmap, &xcol);
    color_light = xcol.pixel;

    /* Тёмная клетка (коричневый) */
    XParseColor(dpy, cmap, "burlywood4", &xcol);
    XAllocColor(dpy, cmap, &xcol);
    color_dark = xcol.pixel;

    /* Цвет угрозы (красноватый) */
    XParseColor(dpy, cmap, "lightcoral", &xcol);
    XAllocColor(dpy, cmap, &xcol);
    color_threat = xcol.pixel;

    /* Фон окна фигуры (белый) */
    XParseColor(dpy, cmap, "white", &xcol);
    XAllocColor(dpy, cmap, &xcol);
    color_piece_bg = xcol.pixel;
}

/* Создание окон для клеток доски */
void create_cell_windows(void) {
    for (int i = 0; i < BOARD_SIZE; i++) {
        for (int j = 0; j < BOARD_SIZE; j++) {
            int x = j * CELL_SIZE;
            int y = i * CELL_SIZE;
            Pixel bg = ((i + j) % 2 == 0) ? color_light : color_dark;
            cell_windows[i][j] = XCreateSimpleWindow(dpy, main_win,
                                                      x, y, CELL_SIZE, CELL_SIZE, 0,
                                                      BlackPixel(dpy, DefaultScreen(dpy)),
                                                      bg);
            XSelectInput(dpy, cell_windows[i][j], ButtonPressMask);
            XMapWindow(dpy, cell_windows[i][j]);
        }
    }
}

/* Создание окон для фигур и инициализация данных */
void create_piece_windows(void) {
    for (int idx = 0; idx < 8; idx++) {
        int row = start_positions[idx][0];
        int col = start_positions[idx][1];
        int x = col * CELL_SIZE;
        int y = row * CELL_SIZE;
        pieces[idx].type = start_types[idx];
        pieces[idx].row = row;
        pieces[idx].col = col;
        pieces[idx].start_row = row;
        pieces[idx].start_col = col;
        pieces[idx].win = XCreateSimpleWindow(dpy, main_win,
                                              x, y, CELL_SIZE, CELL_SIZE, 1,
                                              BlackPixel(dpy, DefaultScreen(dpy)),
                                              color_piece_bg);
        XSelectInput(dpy, pieces[idx].win, ButtonPressMask | ExposureMask);
        XMapWindow(dpy, pieces[idx].win);
        draw_piece_text(pieces[idx].win, pieces[idx].type);
        occupied[row][col] = idx;
    }
    num_pieces = 8;
}

/* Рисование текста (буквы) в окне фигуры */
void draw_piece_text(Window win, PieceType type) {
    char str[2] = { (char)type, '\0' };
    int tw = XTextWidth(font_info, str, 1);
    int th = font_info->ascent + font_info->descent;
    int x = (CELL_SIZE - tw) / 2;
    int y = (CELL_SIZE - th) / 2 + font_info->ascent;
    XSetForeground(dpy, text_gc, BlackPixel(dpy, DefaultScreen(dpy)));
    XDrawString(dpy, win, text_gc, x, y, str, 1);
    XFlush(dpy);
}

/* Обновление цвета фона всех клеток в зависимости от угроз */
void update_cell_colors(void) {
    for (int i = 0; i < BOARD_SIZE; i++) {
        for (int j = 0; j < BOARD_SIZE; j++) {
            Window win = cell_windows[i][j];
            Pixel normal_bg = ((i + j) % 2 == 0) ? color_light : color_dark;
            Pixel new_bg = threats[i][j] ? color_threat : normal_bg;
            XSetWindowBackground(dpy, win, new_bg);
            XClearWindow(dpy, win);
        }
    }
    XFlush(dpy);
}

/* Проверка, находится ли клетка в пределах доски */
static int in_board(int r, int c) {
    return r >= 0 && r < BOARD_SIZE && c >= 0 && c < BOARD_SIZE;
}

/* Вычисление угроз для всех фигур (заполняет threats[][]) */
void compute_threats(void) {
    /* Обнуляем массив угроз */
    for (int i = 0; i < BOARD_SIZE; i++)
        for (int j = 0; j < BOARD_SIZE; j++)
            threats[i][j] = 0;

    /* Для каждой фигуры */
    for (int idx = 0; idx < num_pieces; idx++) {
        int r = pieces[idx].row;
        int c = pieces[idx].col;
        PieceType type = pieces[idx].type;

        switch (type) {
            case PIECE_KING:
                for (int dr = -1; dr <= 1; dr++) {
                    for (int dc = -1; dc <= 1; dc++) {
                        if (dr == 0 && dc == 0) continue;
                        int nr = r + dr, nc = c + dc;
                        if (in_board(nr, nc) && occupied[nr][nc] == -1)
                            threats[nr][nc] = 1;
                    }
                }
                break;

            case PIECE_QUEEN:
                /* Ладейные направления */
                for (int dr = -1; dr <= 1; dr++) {
                    for (int dc = -1; dc <= 1; dc++) {
                        if (dr == 0 && dc == 0) continue;
                        int nr = r + dr, nc = c + dc;
                        while (in_board(nr, nc)) {
                            if (occupied[nr][nc] != -1) {
                                /* На пути своя фигура – клетка с ней не угрожаема */
                                break;
                            }
                            threats[nr][nc] = 1;
                            nr += dr; nc += dc;
                        }
                    }
                }
                break;

            case PIECE_ROOK:
                for (int dr = -1; dr <= 1; dr++) {
                    for (int dc = -1; dc <= 1; dc++) {
                        if ((dr == 0) == (dc == 0)) continue; /* только ортогональ */
                        int nr = r + dr, nc = c + dc;
                        while (in_board(nr, nc)) {
                            if (occupied[nr][nc] != -1) break;
                            threats[nr][nc] = 1;
                            nr += dr; nc += dc;
                        }
                    }
                }
                break;

            case PIECE_BISHOP:
                for (int dr = -1; dr <= 1; dr++) {
                    for (int dc = -1; dc <= 1; dc++) {
                        if (dr == 0 || dc == 0) continue; /* только диагонали */
                        int nr = r + dr, nc = c + dc;
                        while (in_board(nr, nc)) {
                            if (occupied[nr][nc] != -1) break;
                            threats[nr][nc] = 1;
                            nr += dr; nc += dc;
                        }
                    }
                }
                break;

            case PIECE_KNIGHT:
                {
                    int moves[8][2] = {{-2,-1},{-2,1},{-1,-2},{-1,2},{1,-2},{1,2},{2,-1},{2,1}};
                    for (int k = 0; k < 8; k++) {
                        int nr = r + moves[k][0];
                        int nc = c + moves[k][1];
                        if (in_board(nr, nc) && occupied[nr][nc] == -1)
                            threats[nr][nc] = 1;
                    }
                }
                break;
        }
    }
    update_cell_colors();
}

/* Перемещение фигуры в новую клетку (если свободна) */
void move_piece(int piece_idx, int new_row, int new_col) {
    if (new_row < 0 || new_row >= BOARD_SIZE || new_col < 0 || new_col >= BOARD_SIZE)
        return;
    if (occupied[new_row][new_col] != -1)
        return; /* клетка занята */

    int old_row = pieces[piece_idx].row;
    int old_col = pieces[piece_idx].col;
    /* Освобождаем старую клетку */
    occupied[old_row][old_col] = -1;
    /* Обновляем позицию фигуры */
    pieces[piece_idx].row = new_row;
    pieces[piece_idx].col = new_col;
    occupied[new_row][new_col] = piece_idx;
    /* Перемещаем окно фигуры */
    int x = new_col * CELL_SIZE;
    int y = new_row * CELL_SIZE;
    XMoveWindow(dpy, pieces[piece_idx].win, x, y);
    XFlush(dpy);
    /* Пересчитываем угрозы */
    compute_threats();
}

/* Сброс в начальную расстановку */
void reset_positions(void) {
    /* Очищаем occupied */
    for (int i = 0; i < BOARD_SIZE; i++)
        for (int j = 0; j < BOARD_SIZE; j++)
            occupied[i][j] = -1;

    for (int idx = 0; idx < 8; idx++) {
        int new_row = start_positions[idx][0];
        int new_col = start_positions[idx][1];
        pieces[idx].row = new_row;
        pieces[idx].col = new_col;
        occupied[new_row][new_col] = idx;
        int x = new_col * CELL_SIZE;
        int y = new_row * CELL_SIZE;
        XMoveWindow(dpy, pieces[idx].win, x, y);
    }
    XFlush(dpy);
    compute_threats();
}

/* Освобождение ресурсов */
void free_resources(void) {
    for (int i = 0; i < BOARD_SIZE; i++)
        for (int j = 0; j < BOARD_SIZE; j++)
            XDestroyWindow(dpy, cell_windows[i][j]);
    for (int i = 0; i < num_pieces; i++)
        XDestroyWindow(dpy, pieces[i].win);
    XFreeFont(dpy, font_info);
    XFreeGC(dpy, text_gc);
    XDestroyWindow(dpy, main_win);
    XCloseDisplay(dpy);
}

int main(int argc, char *argv[]) {
    if (argc != 1) {
        fprintf(stderr, "Usage: %s\n", argv[0]);
        return 1;
    }

    dpy = XOpenDisplay(NULL);
    if (!dpy) {
        fprintf(stderr, "Cannot open display.\n");
        return 1;
    }
    int screen = DefaultScreen(dpy);

    /* Главное окно */
    main_win = XCreateSimpleWindow(dpy, RootWindow(dpy, screen),
                                   0, 0, WIN_WIDTH, WIN_HEIGHT, 1,
                                   BlackPixel(dpy, screen), WhitePixel(dpy, screen));
    XSelectInput(dpy, main_win, KeyPressMask);
    XMapWindow(dpy, main_win);

    /* Инициализация цветов */
    init_colors();

    /* Загрузка шрифта и создание GC для текста */
    font_info = XLoadQueryFont(dpy, "fixed");
    if (!font_info) {
        fprintf(stderr, "No fixed font, trying 6x13\n");
        font_info = XLoadQueryFont(dpy, "6x13");
        if (!font_info) {
            fprintf(stderr, "Cannot load font\n");
            return 1;
        }
    }
    text_gc = XCreateGC(dpy, main_win, 0, NULL);
    XSetFont(dpy, text_gc, font_info->fid);

    /* Инициализация occupied */
    for (int i = 0; i < BOARD_SIZE; i++)
        for (int j = 0; j < BOARD_SIZE; j++)
            occupied[i][j] = -1;

    /* Создание окон клеток и фигур */
    create_cell_windows();
    create_piece_windows();

    /* Начальный анализ угроз */
    compute_threats();

    /* Переменные для перетаскивания */
    int dragging = 0;
    int drag_piece = -1;
    int drag_x_start, drag_y_start;   /* смещение указателя относительно окна фигуры */

    XEvent ev;
    int running = 1;
    while (running) {
        XNextEvent(dpy, &ev);

        switch (ev.type) {
            case KeyPress: {
                KeySym ks = XLookupKeysym(&ev.xkey, 0);
                if (ks == XK_Escape) {
                    reset_positions();
                }
                break;
            }

            case ButtonPress: {
                Window clicked = ev.xbutton.window;
                /* Проверяем, не клик ли по фигуре */
                int piece_idx = -1;
                for (int i = 0; i < num_pieces; i++) {
                    if (pieces[i].win == clicked) {
                        piece_idx = i;
                        break;
                    }
                }
                if (piece_idx != -1) {
                    /* Начинаем перетаскивание */
                    dragging = 1;
                    drag_piece = piece_idx;
                    drag_x_start = ev.xbutton.x;
                    drag_y_start = ev.xbutton.y;
                    XGrabPointer(dpy, clicked, True,
                                 ButtonPressMask | ButtonReleaseMask | PointerMotionMask,
                                 GrabModeAsync, GrabModeAsync, None, None, CurrentTime);
                } else {
                    /* Проверяем, не клик ли по клетке (для выхода) */
                    for (int i = 0; i < BOARD_SIZE; i++) {
                        for (int j = 0; j < BOARD_SIZE; j++) {
                            if (cell_windows[i][j] == clicked) {
                                if (occupied[i][j] == -1) {
                                    running = 0; /* выход */
                                }
                                break;
                            }
                        }
                    }
                }
                break;
            }

            case MotionNotify: {
                if (dragging && drag_piece != -1) {
                    /* Вычисляем новую позицию окна фигуры */
                    int new_x = ev.xmotion.x_root - drag_x_start;
                    int new_y = ev.xmotion.y_root - drag_y_start;
                    /* Ограничиваем, чтобы окно не выходило за пределы доски */
                    if (new_x < 0) new_x = 0;
                    if (new_y < 0) new_y = 0;
                    if (new_x > WIN_WIDTH - CELL_SIZE) new_x = WIN_WIDTH - CELL_SIZE;
                    if (new_y > WIN_HEIGHT - CELL_SIZE) new_y = WIN_HEIGHT - CELL_SIZE;
                    XMoveWindow(dpy, pieces[drag_piece].win, new_x, new_y);
                    XFlush(dpy);
                }
                break;
            }

            case ButtonRelease: {
                if (dragging && drag_piece != -1) {
                    /* Определяем, над какой клеткой находится центр окна фигуры */
                    XWindowAttributes attrs;
                    XGetWindowAttributes(dpy, pieces[drag_piece].win, &attrs);
                    int center_x = attrs.x + CELL_SIZE / 2;
                    int center_y = attrs.y + CELL_SIZE / 2;
                    int new_col = center_x / CELL_SIZE;
                    int new_row = center_y / CELL_SIZE;
                    if (new_row >= 0 && new_row < BOARD_SIZE && new_col >= 0 && new_col < BOARD_SIZE) {
                        if (occupied[new_row][new_col] == -1) {
                            /* Перемещаем фигуру */
                            move_piece(drag_piece, new_row, new_col);
                        } else {
                            /* Возвращаем в исходную позицию */
                            int old_row = pieces[drag_piece].row;
                            int old_col = pieces[drag_piece].col;
                            int old_x = old_col * CELL_SIZE;
                            int old_y = old_row * CELL_SIZE;
                            XMoveWindow(dpy, pieces[drag_piece].win, old_x, old_y);
                            XFlush(dpy);
                        }
                    } else {
                        /* За пределами доски – возврат */
                        int old_row = pieces[drag_piece].row;
                        int old_col = pieces[drag_piece].col;
                        int old_x = old_col * CELL_SIZE;
                        int old_y = old_row * CELL_SIZE;
                        XMoveWindow(dpy, pieces[drag_piece].win, old_x, old_y);
                        XFlush(dpy);
                    }
                    XUngrabPointer(dpy, CurrentTime);
                    dragging = 0;
                    drag_piece = -1;
                }
                break;
            }

            case Expose: {
                if (ev.xexpose.window != main_win) {
                    /* Перерисовка текста в окне фигуры */
                    for (int i = 0; i < num_pieces; i++) {
                        if (pieces[i].win == ev.xexpose.window) {
                            draw_piece_text(pieces[i].win, pieces[i].type);
                            break;
                        }
                    }
                }
                break;
            }
        }
    }

    free_resources();
    return 0;
}