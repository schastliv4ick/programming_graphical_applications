#include <X11/Xlib.h>
#define  WIDTH  128

int  main(){
	Display*  dpy;
	int  src;
	GC  gc;
	int  depth;
	Window  root;
	Pixmap  pix;
	Window  win;
	XSetWindowAttributes  attr;
	unsigned  long mask;
	XEvent  event;
	unsigned  int  done  =  0;

	//Graphic init
	dpy = XOpenDisplay(NULL);
	src = DefaultScreen(dpy);
	depth = DefaultDepth(dpy,  src);
	root = DefaultRootWindow(dpy);
	gc = DefaultGC(dpy,  src);

	//Create pixel map
	pix = XCreatePixmap(dpy, root, WIDTH, WIDTH, depth);
	XSetForeground(dpy, gc, WhitePixel(dpy, src));
	XFillRectangle(dpy, pix, gc, 0, 0, WIDTH, WIDTH);
	XSetForeground(dpy, gc, BlackPixel(dpy, src));
	XSetBackground(dpy, gc, WhitePixel(dpy, src));

	//draw figure
	XDrawLine(dpy, pix, gc, 0, 0, WIDTH*2/3, 0);
	XDrawLine(dpy, pix, gc, 0, 0, 0, WIDTH*2/3);
	XDrawLine(dpy, pix, gc, 0, WIDTH*2/3, WIDTH*2/3, WIDTH*2/3);
	XDrawLine(dpy, pix, gc, WIDTH*2/3, 0, WIDTH*2/3, WIDTH*2/3);
	XDrawLine(dpy, pix, gc, WIDTH*2/3, WIDTH/3, WIDTH, WIDTH/3);
	XDrawLine(dpy, pix, gc, WIDTH/3, WIDTH*2/3, WIDTH/3, WIDTH);

	//Set attribute window
	mask = CWBackPixmap;
	attr.override_redirect = False;
	attr.background_pixmap = pix;
	win = XCreateWindow(dpy, root, 0, 0, 800, 600, 1, depth, InputOutput, CopyFromParent, mask, &attr); 
	mask = (ButtonPressMask | ButtonReleaseMask | KeyPressMask);
	XSelectInput(dpy, win, mask);
	XMapRaised(dpy, win);
	XSetFunction(dpy, gc, GXinvert);


	//check button
	while(done == 0){
		XNextEvent(dpy, &event);
		switch(event.type){
			case ButtonPress:
			case ButtonRelease:
				XCopyArea(dpy,pix,pix,gc,0,0,WIDTH,WIDTH,0,0);
				XSetWindowBackgroundPixmap(dpy, win, pix);
				XClearWindow(dpy, win); 
				break;
			case KeyPress:
				done = event.xkey.keycode; 
				break;
			default:
				break;
		}
	}

	//closed window and clear memory
	XFreePixmap(dpy,  pix);
	XDestroyWindow(dpy,  win);
	XCloseDisplay(dpy);
	return 0;  
}