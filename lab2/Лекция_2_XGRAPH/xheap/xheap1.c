/* Graph configure functions */
/* Change retrace() & rebuild() code for other graph! */

#include <X11/Xlib.h>
#include <X11/Xutil.h>
#include "xheap.h"

static XPoint face3[NFACE3][(3+1)]; /* 3-top faces top location */
static XPoint path4[NPATH4][4];    /* 4-edge path tops location */
static XPoint scale;            /* scale (pixel/cell) for x & y */ 
static XPoint* vertex;         /* vertex location array address */
static XFace* face;                       /* face array address */
static XPath* edge;                  /* edge path array address */

/* Link with pass  Graph structure */

int relink(XGraph *ph) {
vertex = ph->vertex;
edge = ph->edge;
face = ph->face;
return(0);
} /* relink */

/* Check Resize window when configure event */

int resize(unsigned w, unsigned h) {
static XRectangle bak = {0, 0, 0, 0 };
if((bak.width == w) && (bak.height == h))
	return(0);      /* remove window */
bak.width = w; bak.height = h; 
return(NFACE);          /* resize window */
} /* resize */

/* Check window scale when resize */

int rescale(unsigned w, unsigned h) {
int x, y;      /* pixel for cell by x & y */
x = w / NCELL; y = h / NCELL;
if((scale.x == x) && (scale.y == y))
  return(0);    /* small resize without change scale */
scale.x = x; scale.y = y;
return(NFACE);  /* change scale */
} /* rescale */

/* Rebuild graph configuration */

int rebuild() { /* depending on graph ! */
static XPoint vconf[] = { /* vertex location in x,y cells */
  {4, 4}, {1, 4}, {7, 4}, {4, 7}, {4, 1}
}; /* vconf */
static int fconf3[NFACE3][(3+1)] = { /* Vertex index */
  {0, 4, 2, 0},                      /* for 3-top faces */
  {0, 1, 4, 0},                      /* (begin = end vertex) */
  {0, 3, 1, 0},
  {0, 2, 3, 0}
}; /* fconf3 */
static int pconf4[NPATH4][4] = { /* Vertex index */
       {1, 4, 3, 2},             /* for 4-edge path */
       {4, 2, 1, 3}
}; /* edge 4 path */
int i, j;              /* vertex index */
for(i=0; i < NVERT; i++) {  /* compute vertex pixel location */
  vertex[i].x = scale.x * vconf[i].x;
  vertex[i].y = scale.y * vconf[i].y;
} /* for-vertex */
for(i=0; i < NPATH4; i++) /* store vertex pixel location */
  for(j=0; j < 4; j++) {  /* for 4-edge path */ 
     path4[i][j].x = vertex[pconf4[i][j]].x;
     path4[i][j].y = vertex[pconf4[i][j]].y;
  } /* for 4-edge path */
for(i=0; i < NFACE3; i++)  /* store vertex pixel location */ 
  for(j=0; j<(3+1); j++) { /* for 3-top faces */    
    face3[i][j].x = vertex[fconf3[i][j]].x;
    face3[i][j].y = vertex[fconf3[i][j]].y;
  } /* for 3-top face */
return(0);
} /* rebuild */

/* Trace face & edge path array */

int retrace() { /* depending on graph ! */
int f=0;  /* total face index */
int p=0;  /* total edge path index */
int i;    /* n-edge path index */
int j;    /* n-top face index */
for(j=0; j<NFACE3; j++) {      /* fix 3-top faces in face array */
  face[f].top = face3[j];       /* fix 3-top face array address */
  face[f].Cn = 3;                /* fix 3-top face top number=3 */
  face[f].tone = DEFTONE;        /* set face default tone color */
  face[f].regi = XCreateRegion();      /* Empty region for face */
  f++;
} /* face3 */
face[f].tone = DEFTONE;  /* store extern face default tone color */  
for(i=0; i<NPATH4; i++) {  /* fix 4-edge path in edge path array */
  edge[p].node = path4[i]; /* fix 4-edge path array address */
  edge[p].Pn = 4;          /* fix 4-edge path vertex number=4 */
  p++;
} /* path4 */
return(0);
} /* retrace */

/* Reconfigure graph when window resize & rescale */

int reconf(unsigned w, unsigned h) {
if(resize(w, h) == 0)
  return(0);
if(rescale(w, h) != 0)
  rebuild();
return(NFACE);
} /* reconf */

/* Change face region when window resize & rescale */

int rereg() {
int i;            /* region & face index */
static XPoint prescale = {0, 0}; /* previos scale */
if((prescale.x == scale.x) && (prescale.y == scale.y))
  return(0);      /* return, when no change scale */
for(i=0; i < NFACE; i++) { /* New region for face */
  XDestroyRegion(face[i].regi);
  face[i].regi = XPolygonRegion(face[i].top, face[i].Cn, 0);
} /* for */
prescale.x = scale.x; prescale.y = scale.y;
return(i);
} /* rereg */

/* Check pointed face */

int inface(int x, int y) {
int f;    /* face index */
rereg();  /* change face region if need */ 
for(f=0; f < NFACE; f++)   /* check region with (x,y) inside */
  if(XPointInRegion(face[f].regi, x, y) == True)
    break;
face[f].tone = (face[f].tone + 1) % NCOLOR; /* new face tone */
return(f); /* return pointed face for repaint */
} /* inface */
