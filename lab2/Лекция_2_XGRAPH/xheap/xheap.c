#include <X11/Xlib.h>
#include <X11/Xutil.h>
#include <stdlib.h>
#include <stdio.h>

#define NFACE3 4
#define NFACE NFACE3
#define NPATH4 2
#define NPATH NPATH4
#define NEDGE 8
#define NVERT 5
#define NCOLOR 4
#define NCELL 8
#define LWIDTH 2
#define DOT 8


typedef struct {
  XPoint* top;
  int Cn;
  int tone;
  Region regi;
} XFace; 

typedef struct {
  XPoint* node;
  int Pn;
} XPath;

static XPoint vertex[NVERT];
static XPoint face3[NFACE3][(3+1)];
static XPoint path4[NPATH4][4];
static unsigned long palette[(NCOLOR+1)]; /* color palette */
static XPoint scale;
static XFace face[NFACE];
static XPath edge[NPATH];
Display* dpy;
Window win;
GC gc;
static int NoFillFace=0;
// static XRectangle bak = {0, 0, 0, 0 };

int reconf(XEvent* ev) {
static XPoint vconf[] = {
  {4, 4}, {1, 4}, {7, 4}, {4, 7}, {4, 1}
}; /* vconf */
static int fconf3[NFACE3][(3+1)] = {
  {0, 4, 2, 0},
  {0, 1, 4, 0},
  {0, 3, 1, 0},
  {0, 2, 3, 0}
}; /* fconf3 */
static int pconf4[NPATH4][4] = {
       {1, 4, 3, 2},
       {4, 2, 1, 3}
}; /* edge 4 path */
static XRectangle bak = {0, 0, 0, 0 };
int i;
int j;
int x;
int y;
if(ev->xconfigure.window != win)
  return(0);
if((bak.width == ev->xconfigure.width) &&
  (bak.height == ev->xconfigure.height))
	return(0);
bak.width = ev->xconfigure.width;
bak.height = ev->xconfigure.height; 
x = (ev->xconfigure.width) / NCELL;
y = (ev->xconfigure.height) / NCELL;
printf("C%d", QLength(dpy)); fflush(stdout);
  NoFillFace = NFACE;
if((scale.x == x) && (scale.y == y))
  return(0);
scale.x = x;
scale.y = y;
for(i=0; i < NVERT; i++) {
  vertex[i].x = scale.x * vconf[i].x;
  vertex[i].y = scale.y * vconf[i].y;
} /* for-vertex */
for(i=0; i < NPATH4; i++) /* for-edge4 path */ 
  for(j=0; j < 4; j++) {
     path4[i][j].x = vertex[pconf4[i][j]].x;
     path4[i][j].y = vertex[pconf4[i][j]].y;
  } /* for-j */
for(i=0; i < NFACE3; i++) /* for-face3 */
  for(j=0; j<(3+1); j++) {    
    face3[i][j].x = vertex[fconf3[i][j]].x;
    face3[i][j].y = vertex[fconf3[i][j]].y;
  } /* for-j */
/* for(i=0; i<NFACE; i++) {
    XDestroyRegion(face[i].regi);
    face[i].regi = XPolygonRegion(face[i].top, 
                        face[i].Cn, 0);
} */
return(0);
} /* reconf */

int refresh(int f) {
int i;              /* face's vertex count */
int n = face[f].Cn; /* face's vertex number */
XSetForeground(dpy, gc, palette[face[f].tone]);
XFillPolygon(dpy, win, gc, face[f].top, face[f].Cn,
             Convex, CoordModeOrigin);
XFlush(dpy);
XSetForeground(dpy, gc, palette[NCOLOR]); /* BlackPixel  */
XDrawLines(dpy, win, gc, face[f].top, face[f].Cn + 1, 
           CoordModeOrigin);
for(i=0; i<n; i++)
  XFillArc(dpy, win, gc, 
           face[f].top[i].x - (DOT/2), 
           face[f].top[i].y - (DOT/2), 
           DOT, DOT, 0, (64*360));
return(0);
} /* refresh */

int rereg() {
int i;  /* region index */
static XPoint prescale = {0, 0}; /* previos scale */
if((prescale.x == scale.x) && (prescale.y == scale.y))
  return(0);
for(i=0; i < NFACE; i++) {
    XDestroyRegion(face[i].regi);
    face[i].regi = XPolygonRegion(face[i].top, 
                        face[i].Cn, 0);
} /* for */
prescale.x = scale.x;
prescale.y = scale.y;
return(i);
} /* rereg */

int reface(XEvent* ev) {
int i;    /* face index */
rereg();
for(i=0; i<NFACE; i++)
  if(XPointInRegion(face[i].regi, ev->xbutton.x, ev->xbutton.y) == True)
    break;
if(i == NFACE)
  return(NFACE);
recolor(i);
refresh(i);
return(i);
} /* reface */

int redraw() {
int i;
putchar('E'); fflush(stdout);
for(i=NoFillFace; i<NFACE; i++) {
  XSetForeground(dpy, gc, palette[face[i].tone]);
  XFillPolygon(dpy, win, gc, face[i].top, face[i].Cn,
               Convex, CoordModeOrigin);
} /* for face */ 
XSetForeground(dpy, gc, palette[NCOLOR]); /* BlackPixel */
for(i=0; i<NPATH; i++)
    XDrawLines(dpy, win, gc, edge[i].node, edge[i].Pn, CoordModeOrigin);
for(i=0; i<NVERT; i++)
  XFillArc(dpy, win, gc, vertex[i].x - (DOT>>1), 
           vertex[i].y - (DOT>>1), DOT, DOT, 0, (64*360));
return(0);
} /* redraw */

int colorite(int src) {
Colormap cmap;
XColor rgb;
int i=0;  /* color index */
static char* spec[] = {
                      "#ffffff", /* white */
                      "#ff0000", /* red */
                      "#00ff00", /* green */
                      "#0000ff", /* blue */
                      "#000000",  /* black */
                      NULL
                      }; /* spector */
cmap = DefaultColormap(dpy, src);
while(spec[i] != NULL) {
  XParseColor(dpy, cmap, spec[i], &rgb);
  XAllocColor(dpy, cmap, &rgb);
  palette[i] = rgb.pixel;
  i++;
} /* while */
return(0);
} /* colorite */

int recolor(int f) {
face[f].tone = (face[f].tone + 1) % NCOLOR;
return(f);
} /* recolor */

int trace() {
int f=0;  /* total face index */
int p=0;  /* total edge path index */
int i;    /* path n edges' index */
int j;    /* face n edges' index */
for(j=0; j<NFACE3; j++) {
  face[f].top = face3[j];
  face[f].Cn = 3;
  face[f].tone = 0; /* White tone index */
  face[f].regi = XCreateRegion();
  f++;
} /* face3 */
for(i=0; i<NPATH4; i++) {
  edge[p].node = path4[i];
  edge[p].Pn = 4;
  p++;
} /* path4 */
return(0);
} /* trace */

int xini(char* geom) {
Window root;
int depth;
int src;
XSetWindowAttributes attr;
unsigned long mask;
int x, y, w, h;
XGCValues gcval;

XParseGeometry(geom, &x, &y, &w, &h);
dpy = XOpenDisplay(NULL);
src = DefaultScreen(dpy);
depth = DefaultDepth(dpy, src);
root = DefaultRootWindow(dpy);
gc = DefaultGC(dpy, src);
XGetGCValues(dpy, gc, GCLineWidth, &gcval);
gcval.line_width = LWIDTH;
XChangeGC(dpy, gc, GCLineWidth, &gcval);
colorite(src);
trace();
mask = (CWOverrideRedirect | CWBackPixel | CWEventMask);
attr.override_redirect = False;
attr.background_pixel = palette[0]; /* WhitePixel */
attr.event_mask = (ButtonPressMask | KeyPressMask | 
                   ExposureMask | StructureNotifyMask |
                   FocusChangeMask);
win = XCreateWindow(dpy, root, x, y, w, h, 1, depth, InputOutput,
                                    CopyFromParent, mask, &attr);
XMapWindow(dpy, win);
return(0);
} /* xini */

int main(int argc, char* argv[]) {
XEvent event;
int flag = 0;
int r;
char sym[1];

xini(argv[1]);
while(flag == 0) {
  XNextEvent(dpy, &event);
  switch(event.type) {
     case Expose: if(event.xexpose.window != win)
                     break;
                  if(event.xexpose.count > 0)
                     break;
                  redraw();
                  break;
     case ConfigureNotify: reconf(&event);
                           break;
     case ButtonPress: reface(&event);
                       break;
     case FocusIn:     NoFillFace = 0;
                       putchar('F'); fflush(stdout);
                       redraw();
                       break;
     case KeyPress:    XLookupString((XKeyEvent *) &event, sym, 1, NULL, NULL);
                       flag = sym[0];
                       break;
     default:          break;
  } /* switch */ 
} /* while */
XDestroyWindow(dpy, win);
XCloseDisplay(dpy);
exit(flag);
} /* main */
