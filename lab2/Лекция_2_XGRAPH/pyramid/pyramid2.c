/* Pyramid Graph Display funcrion */

#include <X11/Xlib.h>
#include <X11/Xutil.h>
#include <X11/keysymdef.h>
#include "pyramid.h"

/* Polytop Graph address componentes */

static XVertex* vertex;        /* vertex location array address */
static XFace* face;                       /* face array address */
static XEdge* edge;                       /* edge array address */

/* Color palette pixel code array */

static unsigned long palette[(NCOLOR+1)];

/* Link with pass  Graph structure */

int relink(XPolyGraph *pg) {
vertex = pg->vertex;
edge = pg->edge;
face = pg->face;
return(0);
} /* relink */

/* Allocate color palette */

int colorite(Display* dpy) {
Colormap cmap; /* color map */   
XColor rgb;    /* Structure for color allocation */ 
int i;         /* color index */
static char* spector[] = {
                          "#ffffff", /* white */
                          "#ff0000", /* red */
                          "#00ff00", /* green */
                          "#0000ff", /* blue */
                          "#000000"  /* black */
                         }; /* color spector */
cmap = DefaultColormap(dpy, DefaultScreen(dpy));
for(i=0; i < (NCOLOR+1); i++ ) {
  XParseColor(dpy, cmap, spector[i], &rgb);
  XAllocColor(dpy, cmap, &rgb);
  palette[i] = rgb.pixel;
} /* for */
return(0);
} /* colorite */

/* Set Graphic Context */

GC congraph(Display* dpy) {
XGCValues gcval;                      /* Graphic Contex parameters */
GC gc;                                /* Graphic Context id */
gcval.line_width = EWIDTH;
gcval.background = palette[DEFTONE];
gc = DefaultGC(dpy, DefaultScreen(dpy)); 
XChangeGC(dpy, gc, (GCLineWidth | GCBackground), &gcval);
return(gc);
} /* congraph */

/* Create main window */

Window canvas(Display* dpy) {
Window win;                                         /* return Window id */
XSetWindowAttributes attr;                         /* window attributes */
XSizeHints hint;                         /* connect with Window Maneger */
int x, y;                                            /* window location */
unsigned w, h;                                           /* window size */
int scr;                                               /* screen number */
attr.override_redirect = False;           /* set window maneger control */
attr.background_pixel = palette[DEFTONE];           /* background color */
attr.event_mask = (ButtonPressMask | KeyPressMask | ExposureMask |
                   StructureNotifyMask | FocusChangeMask); /* Event mask */
scr =  DefaultScreen(dpy);
w = DisplayWidth(dpy, scr) / 2;
h = DisplayHeight(dpy, scr) / 2;
x = w / 2; y = h / 2;
win = XCreateWindow(dpy, DefaultRootWindow(dpy), x, y, w, h, 1,
                    DefaultDepth(dpy, scr), InputOutput, CopyFromParent,
                    (CWOverrideRedirect | CWBackPixel | CWEventMask),
                    &attr);
hint.flags = (PMinSize | PPosition | PMaxSize);
hint.min_width = hint.min_height = (8*VDOT);     /* window min size */
hint.max_width = 2*w; hint.max_height = 2*h;     /* window max size */
hint.x = x; hint.y = y;
XSetNormalHints(dpy, win, &hint);
XMapWindow(dpy, win);
return(win);
} /* canvas */

/* Redraw graph with paint face or contour only */

int regraph(Display* dpy, Window win, GC gc, int NoFillFace) {
int i;                                 /* face  or vertex count */
for(i=NoFillFace; i<NFACE; i++) {           /* redraw all faces */
  XSetForeground(dpy, gc, palette[face[i].tone]);
  XFillPolygon(dpy, win, gc, face[i].top, face[i].Cn,
               Convex, CoordModeOrigin);
} /* for face */ 
XSetForeground(dpy, gc, palette[NCOLOR]);    /* BlackPixel color*/
XDrawSegments(dpy, win, gc, edge, NEDGE);   /* rearaw all edges */
for(i=0; i<NVERT; i++)                    /* redraw even vertex */
  XFillArc(dpy, win, gc, vertex[i].x - (VDOT>>1), 
           vertex[i].y - (VDOT>>1), VDOT, VDOT, 0, (64*360));
return(0);
} /* regraph */

/* Reset graph with default or current face's color */

int reset(Display* dpy, Window win, int FillFace) {
int f=FillFace;                    /* face index */
for( ; f < NFACE; f++)             /* set extern tone for inner faces */
  face[f].tone = face[NFACE].tone; 
XSetWindowBackground(dpy, win, palette[face[f].tone]);  /* Repaint by */
XClearArea(dpy, win, 0, 0, 0, 0, True);  /*  auto invoke Expose Event */ 
return(f);
} /* reset */

/* Redraw one face */

int reface(Display* dpy, Window win, GC gc, int f) {
int i;                                        /* face's vertex count */
if(f == NFACE)                                 /* redraw extern face */
  return(reset(dpy, win, f));
XSetForeground(dpy, gc, palette[face[f].tone]);  /* inner face color */
XFillPolygon(dpy, win, gc, face[f].top, face[f].Cn,  /* redraw inner */
             Convex, CoordModeOrigin);                 /* face space */
XFlush(dpy);
XSetForeground(dpy, gc, palette[NCOLOR]); /* BlackPixel color */
XDrawLines(dpy, win, gc, face[f].top, face[f].Cn + 1, /* redraw inner */ 
           CoordModeOrigin);                          /* face contour */
for(i=0; i< face[f].Cn; i++)            /* redraw inner face's vertex */
  XFillArc(dpy, win, gc, face[f].top[i].x - (VDOT/2), 
           face[f].top[i].y - (VDOT/2), VDOT, VDOT, 0, (64*360));
return(0);
} /* reface */
