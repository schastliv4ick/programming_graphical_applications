#include <X11/Xlib.h>
#include <X11/Xutil.h>
#include <stdio.h>
#include "lab2.h"


int rekey(XEvent* ev) {
	Display* dpy = ev->xkey.display;
	Window win = ev->xkey.window;
	int FillFace;
	KeySym ks;
	ks = XKeycodeToKeysym(dpy, ev->xkey.keycode, 0);
	if (ks == XK_F10)
		return(10);
	FillFace = (ev->xkey.state & Mod1Mask) ? NFACE : 0;
	if (ks == XK_l && (ev->xkey.state & ControlMask))
	{
		reset(dpy, win, NFACE);
		putchar('d');
	}
	if (ks == XK_Escape)
		reset(dpy, win, FillFace);
		return(0);
	}
	int dispatch(Display* dpy, Window win, GC gc) {
	int NoFillFace = 0;
	XEvent event;
	int done = 0;
	while (done == 0) {
		XNextEvent(dpy, &event); 
		switch (event.type) {
		case Expose:
			if (event.xexpose.count > 0)
				break;
			putchar('E'); fflush(stdout);
			regraph(dpy, win, gc, NoFillFace);
			break;
		case ConfigureNotify:
			putchar('C'); fflush(stdout);
			NoFillFace = reconf(event.xconfigure.width,
			event.xconfigure.height);
			break;
		case ButtonPress:
			reface(dpy, win, gc, zotone(event.xbutton.x, event.xbutton.y));
			break;
		case FocusIn:
			NoFillFace = 0;
			putchar('F'); fflush(stdout);
			regraph(dpy, win, gc, NoFillFace);
			break;
		case KeyPress:
			done = rekey(&event);
			break;
		default: 
			break;
		}
	}
	return(done);
}

int main(int argc, char* argv[]) {
	XPolyGraph heap;
	Display* dpy;
	Window win;
	GC gc;
	int t = (argc > 1) ? 1 : 0;
	dpy = XOpenDisplay(NULL);
	assoc(&heap);
	relink(&heap);
	retrace(); 
	colorite(dpy);
	gc = congraph(dpy);
	win = canvas(dpy);
	XStoreName(dpy, win, argv[t]);
	dispatch(dpy, win, gc);
	XDestroyWindow(dpy, win);
	XCloseDisplay(dpy);
	return(0);
}