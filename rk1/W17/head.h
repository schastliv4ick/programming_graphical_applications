#ifndef HEAD_H
#define HEAD_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <X11/Xlib.h>
#include <X11/Xutil.h>
#include <X11/keysym.h>

/* Явное определение Pixel на случай, если Xlib его не предоставляет */
#ifndef Pixel
typedef unsigned long Pixel;
#endif

#define BOARD_SIZE 8
#define CELL_SIZE 60
#define WIN_WIDTH (BOARD_SIZE * CELL_SIZE)
#define WIN_HEIGHT (BOARD_SIZE * CELL_SIZE)

typedef enum {
    PIECE_KING = 'K',
    PIECE_QUEEN = 'Q',
    PIECE_ROOK = 'R',
    PIECE_BISHOP = 'B',
    PIECE_KNIGHT = 'N'
} PieceType;

typedef struct {
    Window win;
    PieceType type;
    int row, col;
    int start_row, start_col;
} Piece;

/* Глобальные переменные (extern) */
extern Display *dpy;
extern Window main_win;
extern Window cell_windows[BOARD_SIZE][BOARD_SIZE];
extern Piece pieces[BOARD_SIZE];
extern int num_pieces;
extern int occupied[BOARD_SIZE][BOARD_SIZE];
extern int threats[BOARD_SIZE][BOARD_SIZE];
extern Pixel color_light, color_dark, color_threat, color_piece_bg;
extern GC text_gc;
extern XFontStruct *font_info;

/* Прототипы функций из logic.c */
void init_colors(void);
void compute_threats(void);
int in_board(int r, int c);

/* Прототипы функций из display.c */
void create_cell_windows(void);
void create_piece_windows(void);
void draw_piece_text(Window win, PieceType type);
void update_cell_colors(void);
void move_piece(int piece_idx, int new_row, int new_col);
void reset_positions(void);
void free_resources(void);

#endif