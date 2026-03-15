/* Paint heap graph face header file */

#define NFACE3 4        /* 3 top face number */
#define NFACE NFACE3    /* all face number */
#define NPATH4 2        /* 4 edge path number */
#define NPATH NPATH4    /* all edge path number */
#define NEDGE 8         /* edge number */
#define NVERT 5         /* vertex number */
#define NCOLOR 4        /* face color number */
#define NCELL 8         /* unit cell number by X & Y */
#define LWIDTH 2        /* contour line width */
#define DOT 8           /* vertex dot size */
#define DEFTONE 0       /* default face tone */

/* Face declaratiom */

typedef struct {
  XPoint* top;   /* face vertex location array */
  int Cn;        /* face vertex  number */
  int tone;      /* face tone color index */
  Region regi;   /* face space region */
} XFace; 

/* Edge path declaration */

typedef struct {
  XPoint* node;  /* edge path vertex location array */
  int Pn;        /* edge path vertex number */
} XPath;

/* Polytop graph  declaration */

typedef struct {
  XPoint* vertex; /* vertex array */
  XFace* face;    /* face array */
  XPath* edge;    /* edge path array */
} XGraph;

/* Graph display  function declaration (xheap2) */

GC MakeGC(Display*);
Window WinMain(Display*);
int colorite(Display*);
int regraph(Display*, Window, GC, int);
int reset(Display*, Window, int);
int reface(Display*, Window, GC, int);
int rekey(Display*, Window, GC, XEvent*);
int assoc(XGraph*);

/* Graph configure function declaration (xheap1) */

int relink(XGraph*);
int resize(unsigned, unsigned);
int rescale(unsigned, unsigned);
int rebuild();
int retrace();
int reconf(unsigned, unsigned);
int rereg();
int inface(int, int);

/* Dispatch function declaration (xheap0) */

int dispatch(Display*, Window, GC);
