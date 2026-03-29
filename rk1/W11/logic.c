#include "head.h"

/* Определения логических данных (без extern) */
int *horz_vals = NULL;
int *vert_vals = NULL;
int **mat_vals = NULL;

/* Инициализация логических массивов (все нули) */
void init_logic(void) {
    horz_vals = (int *)calloc(N, sizeof(int));
    vert_vals = (int *)calloc(N, sizeof(int));
    mat_vals = (int **)malloc(N * sizeof(int *));
    for (int i = 0; i < N; i++)
        mat_vals[i] = (int *)calloc(N, sizeof(int));
}

/* Освобождение памяти логических массивов */
void free_logic(void) {
    if (horz_vals) free(horz_vals);
    if (vert_vals) free(vert_vals);
    if (mat_vals) {
        for (int i = 0; i < N; i++)
            free(mat_vals[i]);
        free(mat_vals);
    }
}

/* Пересчёт матрицы внешнего произведения */
void compute_outer_product(void) {
    for (int i = 0; i < N; i++)
        for (int j = 0; j < N; j++)
            mat_vals[i][j] = vert_vals[i] & horz_vals[j];
}

/* Инверсия одной ячейки горизонтального вектора */
void invert_horz_cell(int idx) {
    horz_vals[idx] ^= 1;
    compute_outer_product();
}

/* Инверсия одной ячейки вертикального вектора */
void invert_vert_cell(int idx) {
    vert_vals[idx] ^= 1;
    compute_outer_product();
}

/* Инверсия всего горизонтального вектора */
void invert_all_horz(void) {
    for (int j = 0; j < N; j++)
        horz_vals[j] ^= 1;
    compute_outer_product();
}

/* Инверсия всего вертикального вектора */
void invert_all_vert(void) {
    for (int i = 0; i < N; i++)
        vert_vals[i] ^= 1;
    compute_outer_product();
}

/* Сброс всех векторов в 0 */
void reset_all(void) {
    for (int j = 0; j < N; j++)
        horz_vals[j] = 0;
    for (int i = 0; i < N; i++)
        vert_vals[i] = 0;
    compute_outer_product();
}