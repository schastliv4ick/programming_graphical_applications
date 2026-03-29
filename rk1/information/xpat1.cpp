/* As 0-X game with computer pathner */
/* Game & Service Functions */

#include <stdlib.h>
#include <stdio.h>

static unsigned** pos;   /* Marker position (NYx2) array address */
static unsigned NX;      /* Default Boxes' number in each row */
static unsigned NY;      /* Default Row's number in game desk */

/* dynamic memory allocation for all game desk array */

int alloc(unsigned _nx, unsigned _ny) {
void** p;               /* position array pointer */
void* r;                /* row array pointer */
void** b;               /* box array pointer */
int i;                  /* row & position array index */
NX = _nx; NY = _ny; 
p = calloc(NY, sizeof(unsigned*));
r = calloc(NY, sizeof(unsigned long));
b = calloc(NY, sizeof(void*));
for(i=0; i < NY; i++) {
  b[i] = calloc(NX,  sizeof(unsigned long));
  p[i] = calloc(2, sizeof(unsigned));
} /* for */
relink(p, r, b);        /* link to xpat0 */
for(i=0, pos = (unsigned**) p; i < NY; i++) { /* init gamblers' */
  pos[i][0] = 0; pos[i][1] = NX - 1;          /* markers */
}                                             /* positions */
return(0);
} /* alloc */

/* free allocated memory */

int dealloc(void** p, void** b, void* r) {
int i;   /* row index */
for(i=0; i < NY; i++) {
  free(b[i]); free(p[i]);
} /* for */
free(p); free(b); free(r);
return(0);
} /* dealloc */

/* restore initial markers' positions */

int restore() {
int i;
for(i=0; i<NY; i++) {
  repos(i, 0, 0);
  repos(i, (NX - 1), 1);
} /* for */
return(0);
} /* restore */

/* Change marker & position by rule */

int remark(int i, int j, int* m) {
if(j < pos[i][0])   /* 0-marker to left */
  (*m) = 0;
if(j > pos[i][1])   /* X-marker to right */
  (*m) = 1;
if(j != pos[i][(*m)])  /* (0 or X)-marker to center */
  return(repos(i, j, *m));
return(NY);
} /* remark */

/* Check Pat for right (X computer) marker */

int rpat() {
int i;    /* row index */
for(i=0; i < NY; i++)
  if(pos[i][0] < (NX-1-1))
    break;
return(i);
} /* rightpat */

/* Chek Pat for left (0 Man) marker (not used) */

int lpat() {
int i;    /* row index */
for(i=0; i < NY; i++)
  if(pos[i][1] > 1)
    break;
return(i);
} /* leftpat */

/* Lose move for 'm', when no good move */
 
int lose(int m) {
int i;                     /* row index */
int d = (m == 0) ? 1 : -1; /* who click move */
for(i=0; i<NY; i++)        /* find toward move row */
  if((pos[i][1] - pos[i][0]) > 1)
    break;
if(i < NY)                 /* move toward parthner */
  return(repos(i, pos[i][m] + d, m));
/* Check pat for reply parthner or backward row */
i = (m == 0) ? lpat() : rpat();
if(i < NY)
  repos(i, pos[i][m] - d, m);
return(i);                /* lose row */
} /* lose */

/* Computer good move by NIMM's rule for 'm' */

int nim(int m) {
unsigned b = 8*sizeof(unsigned); /* 1 bit */
unsigned d=0;                    /* (X-0) distance */
unsigned s=0;                    /* NIMM summa */
int i;                           /* row index */
for(i=0; i<NY; i++) /* Compute NIMM-SUM */
  s ^= (pos[i][1] - pos[i][0] - 1);
if(s == 0)          /* even 1 number for each NIMM-SUM's digit */
  return(NY);
for( ; b > 0; b >>= 1)        /* NIMM-SUM's 1 MostSignficalBit */
  if(b & s)
    break;
for(i=0; i<NY; i++)    /* Find 1-st row with NIMM-SUM's 1 MSB  */
  if((d = (pos[i][1] - pos[i][0] - 1)) & b)
    break;
for( ; b > 0; b >>= 1) /* invert bit to even  NIMM-SUM's digit */
  if(b & s)
    d = (d & b) ? (d ^ b) : (d | b);
d = (m > 0) ? (d + 1) : -(d + 1);
repos(i, pos[i][(m+1)%2] + d, m);     /* good move */
return(i);                            /* good row */
} /* nim */
