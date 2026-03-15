#include <X11/Xlib.h>
#include <X11/Xutil.h>

#define WIDTH 64  
#define HEIGHT 128  
int main(int argc, char* argv[]){
	Display* dpy;
	int src;  
	GC gc;  
	int depth;  
	Window root;  
	Pixmap pix;  
	Window win;  
	XSetWindowAttributes attr;  
	unsigned long mask;
	XEvent event;  
	unsigned int done = 0;  
	
	dpy = XOpenDisplay(NULL);  
	src = DefaultScreen(dpy);  
	depth = DefaultDepth(dpy, src);  
	root = DefaultRootWindow(dpy);  
	gc = DefaultGC(dpy, src);  
	
	pix = XCreatePixmap(dpy, root, WIDTH, HEIGHT, depth);
	XSetForeground(dpy, gc, WhitePixel(dpy, src));
	XFillRectangle(dpy, pix, gc, 0, 0, WIDTH, HEIGHT);
	XSetForeground(dpy, gc, BlackPixel(dpy, src));
	XSetBackground(dpy, gc, WhitePixel(dpy, src));
	XDrawLine(dpy, pix, gc, 0, 0, 0.5*WIDTH, HEIGHT/4);
	XDrawLine(dpy, pix, gc, 0.5*WIDTH, HEIGHT/4, HEIGHT/2, 0);
	XDrawLine(dpy, pix, gc, 0.5*WIDTH, HEIGHT/4, 0.5*WIDTH, HEIGHT/2 );
	XDrawLine(dpy, pix, gc, 0.5*WIDTH, HEIGHT/2, 0 , 0.75*HEIGHT );
	XDrawLine(dpy, pix, gc, 0 , 0.75*HEIGHT, 0, HEIGHT);

	XDrawLine(dpy, pix, gc, 0.5*WIDTH, HEIGHT/2, WIDTH, 0.75*HEIGHT);
	
	mask = (CWOverrideRedirect | CWBackPixmap);
	attr.override_redirect = False;  
	attr.background_pixmap = pix;  
	win = XCreateWindow(dpy, root, 0, 0, 800, 600, 1, depth, InputOutput,
	CopyFromParent, mask, &attr);
	mask = (ButtonPressMask | ButtonReleaseMask | EnterWindowMask | LeaveWindowMask | KeyPressMask); 
	//mask = (ButtonPressMask | ButtonReleaseMask | KeyPressMask);
	XSelectInput(dpy, win, mask);  
	XMapRaised(dpy, win);  
	XSetFunction(dpy, gc, GXinvert);  
	
	while(done == 0)
	{
		XNextEvent(dpy, &event);  
		switch(event.type){
			case EnterNotify: //
			case LeaveNotify: //
			case ButtonPress:
			case ButtonRelease:
				XCopyArea(dpy,pix,pix,gc,0,0,WIDTH,HEIGHT,0,0);
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
	
	XFreePixmap(dpy, pix);  
	XDestroyWindow(dpy, win);  
	XCloseDisplay(dpy);  
	return(done);
}