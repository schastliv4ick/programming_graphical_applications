#include <X11/Xlib.h>
#define CELL 45
#define WIDTH CELL*8     /* repeat element width */
#define HEIGHT CELL*4    /* repeat element height */

int main(int argc, char* argv[]) {
	Display* dpy;                   /* display structure */
	int src;                        /* screen number */
	GC gc;                          /* graphic context */
	int depth;                      /* bit per color pixel */
	Window root;                    /* screen root window */
	Pixmap pix;                     /* Pixel map for ring */
	Window win;                     /* Main window */
	XSetWindowAttributes attr;      /* window attributes */
	unsigned long mask;             /* event mask */
	XEvent event;                   /* Event structure */
	unsigned int done = 0;          /* exit code */

	/* X init */

	dpy = XOpenDisplay(NULL);
	src = DefaultScreen(dpy);
	depth = DefaultDepth(dpy, src);
	root = DefaultRootWindow(dpy);
	gc = DefaultGC(dpy, src);

	/* Pixmap block */

	pix = XCreatePixmap(dpy, root, WIDTH, HEIGHT, depth);
	XSetBackground(dpy, gc, WhitePixel(dpy, src));
	XSetForeground(dpy, gc, WhitePixel(dpy, src));
	XFillRectangle(dpy, pix, gc, 0, 0, WIDTH, HEIGHT);
	XSetForeground(dpy, gc, BlackPixel(dpy, src));


	XDrawLine(dpy, pix, gc, CELL * 0, CELL * 0, CELL * 0, CELL * 4);

	XDrawLine(dpy, pix, gc, CELL * 0, CELL * 1, CELL * 2, CELL * 0);
	XDrawLine(dpy, pix, gc, CELL * 0, CELL * 1, CELL * 2, CELL * 2);
	XDrawLine(dpy, pix, gc, CELL * 0, CELL * 3, CELL * 2, CELL * 2);
	XDrawLine(dpy, pix, gc, CELL * 0, CELL * 3, CELL * 2, CELL * 4);

	XDrawLine(dpy, pix, gc, CELL * 2, CELL * 0, CELL * 2, CELL * 4);

	XDrawLine(dpy, pix, gc, CELL * 2, CELL * 0, CELL * 4, CELL * 0);
	XDrawLine(dpy, pix, gc, CELL * 2, CELL * 2, CELL * 4, CELL * 2);

	XDrawLine(dpy, pix, gc, CELL * 4, CELL * 0, CELL * 4, CELL * 4);

	XDrawLine(dpy, pix, gc, CELL * 4, CELL * 0, CELL * 6, CELL * 1);
	XDrawLine(dpy, pix, gc, CELL * 6, CELL * 1, CELL * 4, CELL * 2);
	XDrawLine(dpy, pix, gc, CELL * 4, CELL * 2, CELL * 6, CELL * 3);
	XDrawLine(dpy, pix, gc, CELL * 6, CELL * 3, CELL * 4, CELL * 4);

	XDrawLine(dpy, pix, gc, CELL * 6, CELL * 0, CELL * 6, CELL * 4);

	XDrawLine(dpy, pix, gc, CELL * 6, CELL * 1, CELL * 8, CELL * 1);
	XDrawLine(dpy, pix, gc, CELL * 6, CELL * 3, CELL * 8, CELL * 3);

	XDrawPoint(dpy, pix, gc, CELL * 3, CELL * 1);
	XDrawPoint(dpy, pix, gc, CELL * 1, CELL * 3);
	XDrawPoint(dpy, pix, gc, CELL * 5, CELL * 3);
	XDrawPoint(dpy, pix, gc, CELL * 7, CELL * 2);


	/* Window block */

	mask = (CWOverrideRedirect | CWBackPixmap);
	attr.override_redirect = False;
	attr.background_pixmap = pix;
	win = XCreateWindow(dpy, root, 0, 0, 800, 600, 1, depth,
		InputOutput, CopyFromParent, mask, &attr);
	mask = (ButtonPressMask | ButtonReleaseMask |
		EnterWindowMask | LeaveWindowMask |
		KeyPressMask);
	XSelectInput(dpy, win, mask);
	XMapRaised(dpy, win);
	XSetFunction(dpy, gc, GXinvert);

	/* Dispatch block */

	while (done == 0) {
		XNextEvent(dpy, &event);
		switch (event.type) {
		case EnterNotify:
		case LeaveNotify:
		case ButtonPress:
		case ButtonRelease:
			XCopyArea(dpy, pix, pix, gc, 0, 0, WIDTH, HEIGHT, 0, 0);
			XSetWindowBackgroundPixmap(dpy, win, pix);
			XClearWindow(dpy, win);
			break;
		case KeyPress:
			done = event.xkey.keycode;
			break;
		default:            break;
		}
	}

	/* X-Exit block */

	XFreePixmap(dpy, pix);
	XDestroyWindow(dpy, win);
	XCloseDisplay(dpy);
	return(done);
}