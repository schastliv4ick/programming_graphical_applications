/* Graph Display funcrion */

#include <X11/Xlib.h>
#include <X11/Xutil.h>
#include <X11/keysymdef.h>
#include "xheap.h"

/* Polytop Graph space allocation */

static XPoint vertex[NVERT];
static XFace face[NFACE+1];
static XPath edge[NEDGE];
static unsigned long palette[(NCOLOR+1)];

/* Associate graph address with graph space */

int assoc(XGraph* ph) {
ph->vertex = vertex;
ph->edge = edge;
ph->face = face;
return(0);
} /* assoc */

/* Allocate color palette */

int colorite(Display* dpy) {
Colormap cmap; /* color map */   
XColor rgb;    /* Structure for color allocation */ 
int i=0;       /* color index */
static char* spector[] = {
                          "#ffffff", /* white */
                          "#ff0000", /* red */
                          "#00ff00", /* green */
                          "#0000ff", /* blue */
                          "#000000", /* black */
                          (char* ) 0
                         }; /* color spector */
cmap = DefaultColormap(dpy, DefaultScreen(dpy));
while(spector[i] != (char*) 0) {
  XParseColor(dpy, cmap, spector[i], &rgb);
  XAllocColor(dpy, cmap, &rgb);
  palette[i] = rgb.pixel;
  i++;
} /* while */
return(0);
} /* colorite */

/* Set Graphic Context */

GC MakeGC(Display* dpy) {
XGCValues gcval;                      /* Graphic Contex parameters */
GC gc;                                /* Graphic Context id */
gcval.line_width = LWIDTH;
gcval.background = palette[DEFTONE];
gc = DefaultGC(dpy, DefaultScreen(dpy)); 
XChangeGC(dpy, gc, (GCLineWidth | GCBackground), &gcval);
return(gc);
} /* MakeGC */

/* Create main window */

Window WinMain(Display* dpy) {
Window win;                 /* return Window id */
XSetWindowAttributes attr;  /* window attributes */
XSizeHints hint;            /* connect with Window Maneger */
int x, y;                   /* window location */
unsigned w, h;              /* window size */
int scr;                    /* screen number */
attr.override_redirect = False;  /* set window maneger control */
attr.background_pixel = palette[DEFTONE]; /* background color */
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
hint.min_width = hint.min_height = 8*DOT; /* window min size */
hint.max_width = 2*w; hint.max_height = 2*h; /* window max size */
hint.x = x; hint.y = y;
XSetNormalHints(dpy, win, &hint);
XMapWindow(dpy, win);
return(win);
} /* WinMain */

/* Redraw graph with paint face or contour only */

int regraph(Display* dpy, Window win, GC gc, int NoFillFace) {
int i;                       /* face, edge path or vertex count */
for(i=NoFillFace; i<NFACE; i++) {           /* redraw all faces */
  XSetForeground(dpy, gc, palette[face[i].tone]);
  XFillPolygon(dpy, win, gc, face[i].top, face[i].Cn,
               Convex, CoordModeOrigin);
} /* for face */ 
XSetForeground(dpy, gc, palette[NCOLOR]); /* BlackPixel color*/
for(i=0; i<NPATH; i++)                    /* redraw face contour */
    XDrawLines(dpy, win, gc, edge[i].node, 
               edge[i].Pn, CoordModeOrigin);
for(i=0; i<NVERT; i++)                     /* redraw even vertex */
  XFillArc(dpy, win, gc, vertex[i].x - (DOT>>1), 
           vertex[i].y - (DOT>>1), DOT, DOT, 0, (64*360));
return(0);
} /* regraph */

/* Reset graph with default or current face's color */

int reset(Display* dpy, Window win, int f) {
int i;                   /* face index */
for(i=f; i < NFACE; i++) /* set default tone for inner faces */
  face[i].tone = DEFTONE;
if(f == 0)               /* set default tone for extern face */
  face[i].tone = DEFTONE;
XSetWindowBackground(dpy, win, palette[face[f].tone]);
XClearArea(dpy, win, 0, 0, 0, 0, True); /* Expose Event */ 
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
  XFillArc(dpy, win, gc, face[f].top[i].x - (DOT/2), 
           face[f].top[i].y - (DOT/2), DOT, DOT, 0, (64*360));
return(0);
} /* reface */

/* Recognize & process key pressed */

int rekey(Display* dpy, Window win, GC gc, XEvent* ev) {
KeySym sym;                                      /* Key symbol code */
sym = XKeycodeToKeysym(dpy, ev->xkey.keycode, 0);
if(sym == XK_F10)                    /* Press F10 for programm exit */
  return(10);         /* exit return for event dispatcher in main() */
if((sym == XK_l) && (ev->xkey.state & ControlMask))    /* Press C-L */
  reset(dpy, win, NFACE);               /* to Refresh graph display */
if(sym == XK_Escape)    /* Press Escape to redraw default face tone */ 
  reset(dpy, win, 0);
return(0);        /* continue return for event dispatcher in main() */
} /* rekey */
