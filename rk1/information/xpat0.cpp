/* As 0-X game with computer pathner */
/* Graphic Functions */

#include <X11/Xlib.h>
#include <X11/Xutil.h>
#include <X11/keysym.h>
#include <X11/keysymdef.h>
#include <stdio.h>

static Display* dpy;     /* X Display */
static GC gc[2];         /* Graphic Context */
static Window root;      /* Main root window */
static Window** box;     /* box (NYxNX) window array address */
static Window* row;      /* NY row window  box containe array  */ 
static unsigned** pos;   /* Marker position NYx2 array address */
static int X0=0;         /* main root wintow x-location */
static int Y0=0;         /* main root wintow y-location */
static unsigned NX=16;   /* Default Boxes' number in each row */
static unsigned NY=4;    /* Default Row's number in game desk */
static XRectangle cell;             /* Box cell */
static char* mark[] = { "0", "X" }; /* Marker symbols */

/* link address parameters */

int relink(void** p, void* r, void** b) {
pos = (unsigned**) p;
row = (Window* ) r;
box = (Window**) b;
return(0);
} /* relink */

/* redraw exposed markered box  */

int rebox(XEvent* ev) {
int i, j;
for(i=0; i < NY; i++)
  for(j=0; j < 2; j++)
    if(ev->xexpose.window == box[i][pos[i][j]])
      XDrawString(dpy, box[i][pos[i][j]], gc[0], cell.x, cell.y, mark[j], 1);
return(0);
} /* rebox */

/* Marker's position */

int repos(unsigned i, unsigned j, int m) {
XDrawString(dpy, box[i][pos[i][m]], gc[1], cell.x, cell.y, mark[m], 1);
pos[i][m] = j;
XDrawString(dpy, box[i][j], gc[0], cell.x, cell.y, mark[m], 1);
XFlush(dpy);
return(i);
} /* repos */

/* Change box marker location */

int reset(XEvent* ev) {
int m;                     /* marker index */
int i, j;                  /* window index */
for(i=0; i < NY; i++)                 /* check row  in desk */
  if(ev->xbutton.window == row[i])
    break;
if(i == NY) return(NY);
for(j=0; j < NX; j++)                   /* check box in row */
  if(ev->xbutton.subwindow == box[i][j])
     break;
if(j == NX) return(NY);
/* Check gambler who click move */
m = (ev->xbutton.button == Button1) ? 0 : 1;
if(remark(i, j, &m) == NY) /* click move */
  return(NY);
if(ev->xbutton.state & ControlMask)      /* Control move */
  return(i);                            /* without reply */
m = (m == 0) ? 1 : 0;         /* Partner marker move now */
if((i = nim(m)) == NY)        /* NIMM good reply */
  i = lose(m);                /* lose reply */
return(i);              /* to marker location */
} /* resetk */

/* Custom X parameters */

int xcustom() {
static unsigned XSP=4;     /* x-space between 2 boxes in any row */
static unsigned YSP=4;     /* y-space between 2 rows */
static unsigned BW=32;     /* Box width */
static unsigned BH=32;     /* Box height */
int x, y;                  /* windows' location */ 
unsigned w, h;             /* windows' size */
int dx, dy;                /* interwindow distance */ 
int src;                   /* screen number */
int depth;                 /* screen depth */
XSetWindowAttributes attr; /* created Window attributes */
XSizeHints hint;           /* WM connection structure */ 
XFontStruct* fn;           /* Font parameters structure */
char* fontname = "9x15";   /* default font name */
int i,j;                   /* windows' index */

/* get X defaults */

src = DefaultScreen(dpy);
depth = DefaultDepth(dpy, src);
gc[0] = DefaultGC(dpy, src);

/* Font custom */

if((fn = XLoadQueryFont(dpy, fontname)) == NULL)
  return(puts("Incorrect FontStruct id"));
XSetFont(dpy, gc[0], fn->fid);

/* box cell geometry */

cell.width = fn->max_bounds.width;
cell.height = fn->max_bounds.ascent + fn->max_bounds.descent;
cell.x = (BW -  fn->max_bounds.width)/2;
cell.y = BH/2 + (fn->max_bounds.ascent - fn->max_bounds.descent)/2;

/* Main root window */

w = NX*BW + (NX + 1)*XSP + 2*NX + 2;
h = NY*BH + (NY + 1)*YSP + 4*NY;
attr.override_redirect = False;
attr.background_pixel = WhitePixel(dpy, src);
x = X0; y = Y0;
root = XCreateWindow(dpy, DefaultRootWindow(dpy), x, y, w, h,
                     1, depth, InputOutput, CopyFromParent,
                     (CWOverrideRedirect | CWBackPixel),  &attr);
hint.flags = (PMinSize | PMaxSize | PPosition);
hint.min_width = hint.max_width = w;
hint.min_height = hint.max_height = h;
hint.x = x; hint.y = y;
XSetNormalHints(dpy, root, &hint);

/* box row  root's subwindow */

attr.override_redirect = True;
attr.background_pixel = WhitePixel(dpy, src);
attr.event_mask = (ButtonPressMask | KeyPressMask);
w = NX*BW + (NX - 1)*XSP + 2*NX + 2; 
h = BH + 2 + 2; x = XSP; dy = h + YSP;
for(i=0, y = YSP; i<NY; i++, y += dy)
  row[i] = XCreateWindow(dpy, root, x, y, w, h, 0, depth,
                         InputOutput, CopyFromParent,
           (CWOverrideRedirect | CWBackPixel | CWEventMask),  &attr);

/* Box row's subwindows */

attr.override_redirect = True;
attr.background_pixel = 0x00FFFF; /* WhitePixel(dpy, src); */
attr.event_mask = (KeyPressMask | ExposureMask);
w = BW; h = BH; dx = w + XSP + 2;
for(i=0, y=0; i < NY; i++)
  for(j=0, x=0 ; j < NX; j++, x += dx)
    box[i][j] = XCreateWindow(dpy, row[i], x, y, w, h, 1,
                              depth, InputOutput, CopyFromParent,
                (CWOverrideRedirect | CWBackPixel | CWEventMask), &attr);

/* Display windows */

XMapWindow(dpy, root);
XMapSubwindows(dpy, root);
for(i=0; i<NY; i++)
  XMapSubwindows(dpy, row[i]);
XStoreName(dpy, root, "xpat");

/* Create clear GC */

gc[1] = XCreateGC(dpy, root, 0, 0);
XCopyGC(dpy, gc[0], GCFont, gc[1]);
XSetForeground(dpy, gc[1], 0x00FFFF); /* WhitePixel(dpy, src)); */

return(0);
}

/* KeyBoard Driver */

int kbdrive(XEvent* ev) {
KeySym sym;
XLookupString((XKeyEvent*) ev, NULL, 0, &sym, NULL);
switch(sym) {
  case XK_Escape: restore();
                  break;
  case XK_q:
  case XK_Q: if(ev->xkey.state & ControlMask)   
               return(1);
             break;
  default:   break;
}
return(0);
}

/* Event dispatcher */

int dispatch() {
XEvent event;      /* Event structure */
int flag = 0;      /* exit flag */
while(flag == 0) {
  XNextEvent(dpy, &event);
  switch(event.type) {
    case Expose:      rebox(&event);
                      break;
    case ButtonPress: reset(&event);
                      break;
    case KeyPress: flag = kbdrive(&event);;
                   break;
    default: break;
  } /* switch */
} /* while */
return(0);
} /* dispatch */

/* Main function */

int main(int argc, char* argv[]) {
if(argc < 2)
  fprintf(stderr, "Default: xpat 16x4+0+0\n");  
XParseGeometry(argv[1], &X0, &Y0, &NX, &NY);
alloc(NX, NY);
dpy = XOpenDisplay(NULL);
if(xcustom() > 0)
  return(1);
dispatch();
XDestroySubwindows(dpy, root);
XDestroyWindow(dpy, root);
XCloseDisplay(dpy);
dealloc(pos, box, row);
return(0);
} /* main */
