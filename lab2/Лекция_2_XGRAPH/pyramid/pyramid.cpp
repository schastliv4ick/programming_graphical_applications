/* Paint polytop pyramid graph main & dispatch */

#include <X11/Xlib.h>
#include <X11/Xutil.h>
#include <stdio.h>
#include "pyramid.h"

/* Event Dispatcher */

int dispatch(Display* dpy, Window win, GC gc) {
int NoFillFace = 0; /* nopaint faces number */
XEvent event;       /* event structure */
int end=0;          /* exit from event loop flag */
while(end == 0) {   /* event dispatch loop */
  XNextEvent(dpy, &event); /* read from event queue */
  switch(event.type) {     /* event processing */
     case Expose: /* Redraw graph in visible  window space */
                  if(event.xexpose.count > 0)
                    break;
                  putchar('E'); fflush(stdout);
                  /* NoFillFace = 0; */ /* Uncomment for frame WM (olwm) */
                  regraph(dpy, win, gc, NoFillFace);
                  break;
    case ConfigureNotify: /* Reconfigure graph when resize window */
                          putchar('C'); fflush(stdout);
                          NoFillFace = reconf(event.xconfigure.width,
                                              event.xconfigure.height);
                          break;
    case ButtonPress: /* Repaint pointed face */
                      reface(dpy, win, gc, 
                             inface(event.xbutton.x, event.xbutton.y));
                      break;
    case FocusIn:  /* Sense resizing final for repaint WM (kde, gnome) */
                   NoFillFace = 0;
                   putchar('F'); fflush(stdout);
                   regraph(dpy, win, gc, NoFillFace);
                   /* reset(dpy, win, NFACE); */ /* uncomment for WMaker */
                   break;
    case KeyPress: /* Check KB key pressed */
                   end = rekey(dpy, win, gc, &event);
                   break;
     default: break;
  } /* switch */ 
} /* while */
return(end);
} /* dispath */

/* Main function */

int main(int argc, char* argv[]) {
XGraph graph;               /* polytop graph structure */
Display* dpy;               /* X display structure */
Window win;                 /* window id */
GC gc;                      /* Graphic Context */
int t = (argc > 1) ? 1 : 0;     /* title index */ 
dpy = XOpenDisplay(NULL); /* Connect with X-server */
assoc(&graph);            /* Associate graph for display functions */ 
relink(&graph);           /* Link graph for configure functions */
retrace();             /* trace face  to assembly in graph */
colorite(dpy);         /* allocate WRGB(B) color palette */
gc = MakeGC(dpy);      /* Create & custom Graphic Context */ 
win = WinMain(dpy);    /* Create & custom programm window */
XStoreName(dpy, win, argv[t]); /* print window tittle */
dispatch(dpy, win, gc);        /* dispatch event queue */
XDestroyWindow(dpy, win);      /* Close programm window */
XCloseDisplay(dpy);            /* disconnect from X-server */
return(0);                     /* return to shell */
} /* main */
