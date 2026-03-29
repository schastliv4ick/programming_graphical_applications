#include "head.h"

/* Определения глобальных переменных (без extern) */
Display *dpy;
Window main_win;
Window cell_windows[BOARD_SIZE][BOARD_SIZE];
Piece pieces[BOARD_SIZE];
int num_pieces = 0;
int occupied[BOARD_SIZE][BOARD_SIZE];
int threats[BOARD_SIZE][BOARD_SIZE];
Pixel color_light, color_dark, color_threat, color_piece_bg;
GC text_gc;
XFontStruct *font_info;

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

void create_piece_windows(void) {
    const int start_positions[8][2] = {
        {0,0},{0,1},{0,2},{0,3},{0,4},{0,5},{0,6},{0,7}
    };
    const PieceType start_types[8] = {
        PIECE_ROOK, PIECE_KNIGHT, PIECE_BISHOP, PIECE_QUEEN,
        PIECE_KING, PIECE_BISHOP, PIECE_KNIGHT, PIECE_ROOK
    };

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
                                              x, y, CELL_SIZE, CELL_SIZE, 0,
                                              BlackPixel(dpy, DefaultScreen(dpy)),
                                              color_piece_bg);
        XSelectInput(dpy, pieces[idx].win, ButtonPressMask | ExposureMask);
        XMapWindow(dpy, pieces[idx].win);
        draw_piece_text(pieces[idx].win, pieces[idx].type);
        occupied[row][col] = idx;
    }
    num_pieces = 8;
}

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

void move_piece(int piece_idx, int new_row, int new_col) {
    if (!in_board(new_row, new_col)) return;
    if (occupied[new_row][new_col] != -1) return;

    int old_row = pieces[piece_idx].row;
    int old_col = pieces[piece_idx].col;
    occupied[old_row][old_col] = -1;
    pieces[piece_idx].row = new_row;
    pieces[piece_idx].col = new_col;
    occupied[new_row][new_col] = piece_idx;
    XMoveWindow(dpy, pieces[piece_idx].win, new_col * CELL_SIZE, new_row * CELL_SIZE);
    XFlush(dpy);
    compute_threats();
    update_cell_colors();
}

void reset_positions(void) {
    for (int i = 0; i < BOARD_SIZE; i++)
        for (int j = 0; j < BOARD_SIZE; j++)
            occupied[i][j] = -1;

    const int start_positions[8][2] = {
        {0,0},{0,1},{0,2},{0,3},{0,4},{0,5},{0,6},{0,7}
    };
    /* start_types не используется в reset_positions, но нужна для restore */
    /* Используем существующие типы фигур из массива pieces */
    for (int idx = 0; idx < 8; idx++) {
        int row = start_positions[idx][0];
        int col = start_positions[idx][1];
        pieces[idx].row = row;
        pieces[idx].col = col;
        occupied[row][col] = idx;
        XMoveWindow(dpy, pieces[idx].win, col * CELL_SIZE, row * CELL_SIZE);
    }
    XFlush(dpy);
    compute_threats();
    update_cell_colors();
}

void free_resources(void) {
    for (int i = 0; i < BOARD_SIZE; i++)
        for (int j = 0; j < BOARD_SIZE; j++)
            XDestroyWindow(dpy, cell_windows[i][j]);
    for (int i = 0; i < num_pieces; i++)
        XDestroyWindow(dpy, pieces[i].win);
    if (font_info) XFreeFont(dpy, font_info);
    if (text_gc) XFreeGC(dpy, text_gc);
    XDestroyWindow(dpy, main_win);
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

    main_win = XCreateSimpleWindow(dpy, RootWindow(dpy, screen),
                                   0, 0, WIN_WIDTH, WIN_HEIGHT, 1,
                                   BlackPixel(dpy, screen), WhitePixel(dpy, screen));
    XSelectInput(dpy, main_win, KeyPressMask);
    XMapWindow(dpy, main_win);

    init_colors();

    font_info = XLoadQueryFont(dpy, "fixed");
    if (!font_info) {
        font_info = XLoadQueryFont(dpy, "6x13");
        if (!font_info) {
            fprintf(stderr, "Cannot load font\n");
            return 1;
        }
    }
    text_gc = XCreateGC(dpy, main_win, 0, NULL);
    XSetFont(dpy, text_gc, font_info->fid);

    for (int i = 0; i < BOARD_SIZE; i++)
        for (int j = 0; j < BOARD_SIZE; j++)
            occupied[i][j] = -1;

    create_cell_windows();
    create_piece_windows();
    compute_threats();
    update_cell_colors();

    int dragging = 0, drag_piece = -1, drag_x_start = 0, drag_y_start = 0;
    XEvent ev;
    int running = 1;

    while (running) {
        XNextEvent(dpy, &ev);
        switch (ev.type) {
            case KeyPress: {
                KeySym ks = XLookupKeysym(&ev.xkey, 0);
                if (ks == XK_Escape) reset_positions();
                break;
            }
            case ButtonPress: {
                Window clicked = ev.xbutton.window;
                int piece_idx = -1;
                for (int i = 0; i < num_pieces; i++)
                    if (pieces[i].win == clicked) { piece_idx = i; break; }
                if (piece_idx != -1) {
                    dragging = 1;
                    drag_piece = piece_idx;
                    drag_x_start = ev.xbutton.x;
                    drag_y_start = ev.xbutton.y;
                    XGrabPointer(dpy, clicked, True,
                                 ButtonPressMask | ButtonReleaseMask | PointerMotionMask,
                                 GrabModeAsync, GrabModeAsync, None, None, CurrentTime);
                } else {
                    /* Проверка клика по свободной клетке для выхода */
                    for (int i = 0; i < BOARD_SIZE && running; i++) {
                        for (int j = 0; j < BOARD_SIZE; j++) {
                            if (cell_windows[i][j] == clicked && occupied[i][j] == -1) {
                                running = 0;
                                break;
                            }
                        }
                    }
                }
                break;
            }
            case MotionNotify: {
                if (dragging && drag_piece != -1) {
                    int new_x = ev.xmotion.x_root - drag_x_start;
                    int new_y = ev.xmotion.y_root - drag_y_start;
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
                    XWindowAttributes attrs;
                    XGetWindowAttributes(dpy, pieces[drag_piece].win, &attrs);
                    int center_x = attrs.x + CELL_SIZE/2;
                    int center_y = attrs.y + CELL_SIZE/2;
                    int new_col = center_x / CELL_SIZE;
                    int new_row = center_y / CELL_SIZE;
                    if (in_board(new_row, new_col) && occupied[new_row][new_col] == -1) {
                        move_piece(drag_piece, new_row, new_col);
                    } else {
                        int old_row = pieces[drag_piece].row;
                        int old_col = pieces[drag_piece].col;
                        XMoveWindow(dpy, pieces[drag_piece].win,
                                    old_col * CELL_SIZE, old_row * CELL_SIZE);
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
                    for (int i = 0; i < num_pieces; i++)
                        if (pieces[i].win == ev.xexpose.window) {
                            draw_piece_text(pieces[i].win, pieces[i].type);
                            break;
                        }
                }
                break;
            }
        }
    }

    free_resources();
    XCloseDisplay(dpy);
    return 0;
}