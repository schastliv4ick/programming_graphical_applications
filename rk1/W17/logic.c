#include "head.h"

void init_colors(void) {
    Colormap cmap = DefaultColormap(dpy, DefaultScreen(dpy));
    XColor xcol;

    XParseColor(dpy, cmap, "bisque2", &xcol);
    XAllocColor(dpy, cmap, &xcol);
    color_light = xcol.pixel;

    XParseColor(dpy, cmap, "burlywood4", &xcol);
    XAllocColor(dpy, cmap, &xcol);
    color_dark = xcol.pixel;

    XParseColor(dpy, cmap, "lightcoral", &xcol);
    XAllocColor(dpy, cmap, &xcol);
    color_threat = xcol.pixel;

    XParseColor(dpy, cmap, "white", &xcol);
    XAllocColor(dpy, cmap, &xcol);
    color_piece_bg = xcol.pixel;
}

int in_board(int r, int c) {
    return r >= 0 && r < BOARD_SIZE && c >= 0 && c < BOARD_SIZE;
}

void compute_threats(void) {
    for (int i = 0; i < BOARD_SIZE; i++)
        for (int j = 0; j < BOARD_SIZE; j++)
            threats[i][j] = 0;

    for (int idx = 0; idx < num_pieces; idx++) {
        int r = pieces[idx].row;
        int c = pieces[idx].col;
        PieceType type = pieces[idx].type;

        switch (type) {
            case PIECE_KING:
                for (int dr = -1; dr <= 1; dr++)
                    for (int dc = -1; dc <= 1; dc++) {
                        if (dr == 0 && dc == 0) continue;
                        int nr = r + dr, nc = c + dc;
                        if (in_board(nr, nc) && occupied[nr][nc] == -1)
                            threats[nr][nc] = 1;
                    }
                break;

            case PIECE_QUEEN:
                for (int dr = -1; dr <= 1; dr++)
                    for (int dc = -1; dc <= 1; dc++) {
                        if (dr == 0 && dc == 0) continue;
                        int nr = r + dr, nc = c + dc;
                        while (in_board(nr, nc)) {
                            if (occupied[nr][nc] != -1) break;
                            threats[nr][nc] = 1;
                            nr += dr; nc += dc;
                        }
                    }
                break;

            case PIECE_ROOK:
                for (int dr = -1; dr <= 1; dr++)
                    for (int dc = -1; dc <= 1; dc++) {
                        if ((dr == 0) == (dc == 0)) continue;
                        int nr = r + dr, nc = c + dc;
                        while (in_board(nr, nc)) {
                            if (occupied[nr][nc] != -1) break;
                            threats[nr][nc] = 1;
                            nr += dr; nc += dc;
                        }
                    }
                break;

            case PIECE_BISHOP:
                for (int dr = -1; dr <= 1; dr++)
                    for (int dc = -1; dc <= 1; dc++) {
                        if (dr == 0 || dc == 0) continue;
                        int nr = r + dr, nc = c + dc;
                        while (in_board(nr, nc)) {
                            if (occupied[nr][nc] != -1) break;
                            threats[nr][nc] = 1;
                            nr += dr; nc += dc;
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
}