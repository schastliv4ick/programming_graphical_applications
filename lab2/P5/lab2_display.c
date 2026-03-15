#include <X11/Xlib.h>
#include <X11/Xutil.h>
#include <X11/keysymdef.h>
#include "lab2.h"

static XVertex* vertex; 
static XFace* face;     
static XEdge* edge;     

static unsigned long palette[(NCOLOR + 1)];

int relink(XPolyGraph* pg) {
	vertex = pg->vertex;
	edge = pg->edge;
	face = pg->face;
	return(0);
}

int colorite(Display* dpy) {
	Colormap cmap;
	XColor rgb;   
	int i;        
	static char* spector[] = {
							  "#ffffff",
							  "#ff0000",
							  "#00ff00",
							  "#0000ff",
							  "#000000" 
	};
	cmap = DefaultColormap(dpy, DefaultScreen(dpy));
	for (i = 0; i < (NCOLOR + 1); i++) {
		XParseColor(dpy, cmap, spector[i], &rgb);
		XAllocColor(dpy, cmap, &rgb);
		palette[i] = rgb.pixel;
	}
	return(0);
}

GC congraph(Display* dpy) {
	XGCValues gcval;        
	GC gc;                      
	gcval.line_width = EWIDTH;
	gcval.background = palette[DEFTONE];
	gc = DefaultGC(dpy, DefaultScreen(dpy));
	XChangeGC(dpy, gc, (GCLineWidth | GCBackground), &gcval);
	return(gc);
}

Window canvas(Display* dpy) {
	Window win;                
	XSetWindowAttributes attr; 
	XSizeHints hint;           
	int x, y;                  
	unsigned w, h;             
	int scr;                   
	attr.override_redirect = False;           
	attr.background_pixel = palette[DEFTONE]; 
	attr.event_mask = (ButtonPressMask | KeyPressMask | ExposureMask |
		StructureNotifyMask | FocusChangeMask);
	scr = DefaultScreen(dpy);
	w = DisplayWidth(dpy, scr) / 2;
	h = DisplayHeight(dpy, scr) / 2;
	x = w / 2; y = h / 2;
	win = XCreateWindow(dpy, DefaultRootWindow(dpy), x, y, w, h, 1,
		DefaultDepth(dpy, scr), InputOutput, CopyFromParent,
		(CWOverrideRedirect | CWBackPixel | CWEventMask),
		&attr);
	hint.flags = (PMinSize | PPosition | PMaxSize);
	hint.min_width = hint.min_height = (8 * VDOT);    
	hint.max_width = 2 * w; hint.max_height = 2 * h;  
	hint.x = x; hint.y = y;
	XSetNormalHints(dpy, win, &hint);
	XMapWindow(dpy, win);
	return(win);
} 


int regraph(Display* dpy, Window win, GC gc, int NoFillFace) {
	int i;                              
	for (i = NoFillFace; i < NFACE; i++) {    
		XSetForeground(dpy, gc, palette[face[i].tone]);
		XFillPolygon(dpy, win, gc, face[i].top, face[i].Cn,
			Convex, CoordModeOrigin);
	}
	XSetForeground(dpy, gc, palette[NCOLOR]); 
	XDrawSegments(dpy, win, gc, edge, NEDGE); 
	for (i = 0; i < NVERT; i++)               
		XFillArc(dpy, win, gc, vertex[i].x - (VDOT >> 1),
			vertex[i].y - (VDOT >> 1), VDOT, VDOT, 0, (64 * 360));
	return(0);
}

int reset(Display* dpy, Window win, int FillFace) {
	int f = FillFace;              
	for (; f < NFACE; f++)      
		face[f].tone = DEFTONE;
	XSetWindowBackground(dpy, win, palette[face[f].tone]);
	XClearArea(dpy, win, 0, 0, 0, 0, True); 
	return(f);
} 

int reface(Display* dpy, Window win, GC gc, int f) {
	int i;                                  
	if (f == NFACE)                         
		return(reset(dpy, win, f));
	XSetForeground(dpy, gc, palette[face[f].tone]); 
	XFillPolygon(dpy, win, gc, face[f].top, face[f].Cn,
		Convex, CoordModeOrigin);               
	XFlush(dpy);
	XSetForeground(dpy, gc, palette[NCOLOR]);
	XDrawLines(dpy, win, gc, face[f].top, face[f].Cn + 1,
		CoordModeOrigin);                      
	for (i = 0; i < face[f].Cn; i++)           
		XFillArc(dpy, win, gc, face[f].top[i].x - (VDOT / 2),
			face[f].top[i].y - (VDOT / 2), VDOT, VDOT, 0, (64 * 360));
	return(0);
}