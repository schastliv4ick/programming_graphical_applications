#include <X11/Xlib.h>
#include <X11/Xutil.h>
#include <stdio.h>
#include "lab2.h"



int rekey(XEvent* ev) {
	Display* dpy = ev->xkey.display;
	Window win  = ev->xkey.window;
	KeySym ks;
	ks = XKeycodeToKeysym(dpy, ev->xkey.keycode, 0);
	if (ks == XK_F10)
		return(10);

	if (ks == XK_l && (ev->xkey.state & ControlMask))
		reset(dpy, win, NFACE);

	if (ks == XK_Escape)
		reset(dpy, win, 0);

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
			regraph(dpy, win, gc, NoFillFace);
			break;
		case ConfigureNotify:
			NoFillFace = reconf(event.xconfigure.width,
				event.xconfigure.height);
			break;
		case ButtonPress:
			reface(dpy, win, gc, zotone(event.xbutton.x, event.xbutton.y));
			break;
		case FocusIn:
			NoFillFace = 0;
			regraph(dpy, win, gc, NoFillFace);
			break;
		case KeyPress:
			done = rekey(&event);
			break;
		default: break;
		}
	}
	return(done);
}

int main(int argc, char* argv[]) {
	XPolyGraph heap;
	Display* dpy;
	Window win;
	GC gc;
	dpy = XOpenDisplay(NULL);
	assoc(&heap);
	relink(&heap);
	retrace();
	colorite(dpy);
	gc = congraph(dpy);
	win = canvas(dpy);
	dispatch(dpy, win, gc);
	XDestroyWindow(dpy, win);
	XCloseDisplay(dpy);
	return(0);
}