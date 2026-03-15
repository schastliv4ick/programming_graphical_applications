#define MB0 7
#define NF3 0
#define NF4 7
#define NF7 1
#define NFACE (NF3+NF4+NF7)
#define NEDGE ((3*NF3+NF4*4+NF7*7+MB0)/2)
#define NVERT (NEDGE-(NFACE+1)+2)
#define NCOLOR 4
#define NUNIT 16
#define EWIDTH 2
#define VDOT 8
#define DEFTONE 0

typedef XPoint XVertex;
typedef XSegment XEdge;

typedef struct {
	XVertex* top; 
	int Cn;
	int tone;
	Region regi;
} XFace;

typedef struct {
	XVertex* vertex;
	XFace* face;
	XEdge* edge;
} XPolyGraph;

int relink(XPolyGraph*);
GC congraph(Display*);
Window canvas(Display*);
int colorite(Display*);
int regraph(Display*, Window, GC, int);
int reset(Display*, Window, int);
int reface(Display*, Window, GC, int);

int assoc(XPolyGraph*);
int resize(unsigned, unsigned);
int rescale(unsigned, unsigned);
int rebuild();
int retrace();
int reconf(unsigned, unsigned);
int zotone(int, int);

int rekey(XEvent*);
int dispatch(Display*, Window, GC);