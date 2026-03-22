#include <X11/Xlib.h>
#include <X11/Xutil.h>
#include "lab2.h"

static XVertex vertex[NVERT];
static XFace face[(NFACE + 1)];
static XEdge edge[NEDGE];

static XPoint face3[NF3][(3 + 1)];
static XPoint face4[NF4][(4 + 1)];
static XPoint scale;

int assoc(XPolyGraph* pg) {
	pg->vertex = vertex;
	pg->edge = edge;
	pg->face = face;
	return(0);
}

int resize(unsigned w, unsigned h) {
	static XRectangle bak = { 0, 0, 0, 0 };
	if ((bak.width == w) && (bak.height == h))
		return(0);
	bak.width = w; bak.height = h;
	return(NFACE);
}

int rescale(unsigned w, unsigned h) {
	int x, y;
	x = w / NUNIT; y = h / NUNIT;
	if ((scale.x == x) && (scale.y == y))
		return(0);
	scale.x = x; scale.y = y;
	return(NFACE);
}

int rebuild() {
	static XPoint vconf[] = {
		{0,0},   // 0
		{14,0},  // 1
		{6,2},   // 2
		{8,2},   // 3
		{6,4},   // 4
		{8,4},   // 5
		{2,6},   // 6
		{4,6},   // 7
		{6,6},   // 8
		{8,6},   // 9
		{10,6},  // 10
		{12,6},  // 11
		{2,8},   // 12
		{4,8},   // 13
		{6,8},   // 14
		{8,8},   // 15
		{10,8},  // 16
		{12,8},  // 17
		{6,10},  // 18
		{8,10},  // 19
		{6,12},  // 20
		{8,12},  // 21
		{0,14},  // 22
		{14,14}  // 23
	};
	static int fconf3[NF3][3] = {
		{0,6,2},     // 0
		{22,20,12},  // 1
		{23,21,17},  // 2
		{3,1,11},    // 3
		{7,8,4},     // 4
		{13,14,18},  // 5
		{19,15,16},  // 6
		{5,9,10}     // 7
	};

	static int fconf4[NF4][4] = {
		{2,3,5,4},       // 0
		{4,5,8,9},       // 1
		{9,10,16,15},    // 2
		{10,11,17,16},   // 3
		{14,15,19,18},   // 4
		{18,19,21,20},   // 5
		{7,8,14,13},     // 6
		{6,7,13,12},     // 7
		{0,1,3,2},       // 8
		{1,23,17,11},    // 9
		{22,23,21,20},   // 10
		{22,12,6,0},     // 11
		{6,7,4,2},       // 12
		{3,5,10,11},     // 13
		{16,17,21,19},   // 14
		{12,13,18,20},   // 15
		{8,9,15,14}      // 16   (центральный квадрат)
	};

	static int econf[NEDGE][2] = {
		{0,1}, {0,2}, {0,22}, {0,6},
		{1,3}, {1,11}, {1,23},
		{2,3}, {2,4}, {2,6},
		{3,5}, {3,11},
		{4,5}, {4,8}, {4,7},
		{5,9}, {5,10},
		{6,7}, {6,12},
		{7,8}, {7,13},
		{8,9}, {8,14},
		{9,15}, {9,10},
		{10,11}, {10,16},
		{11,17},
		{12,13}, {12,22},
		{13,18}, {13,14},
		{14,18}, {14,15},
		{15,16}, {15,19},
		{16,17}, {16,19},
		{17,21}, {17,23},
		{18,20}, {18,19},
		{19,21},
		{20,21}, {20,22}, {12,20},
		{21,23}, {22,23}
	};
	int i, j;                    
	for (i = 0; i < NVERT; i++) { 
		vertex[i].x = scale.x * vconf[i].x;
		vertex[i].y = scale.y * vconf[i].y;
	} 
	for (i = 0; i < NEDGE; i++) { 
		edge[i].x1 = vertex[econf[i][0]].x;
		edge[i].y1 = vertex[econf[i][0]].y;
		edge[i].x2 = vertex[econf[i][1]].x;
		edge[i].y2 = vertex[econf[i][1]].y;
	} 
	for (i = 0; i < NF3; i++)             
		for (j = 0; j < (3 + 1); j++) {   
			face3[i][j].x = vertex[fconf3[i][j]].x;
			face3[i][j].y = vertex[fconf3[i][j]].y;
		} 
	
	for (i = 0; i < NF4; i++)             
		for (j = 0; j < (4 + 1); j++) {   
			face4[i][j].x = vertex[fconf4[i][j]].x;
			face4[i][j].y = vertex[fconf4[i][j]].y;
		} 
	return(0);
}

int retrace() {
	int i = 0;
	int j;
	for (j = 0; j < NF3; j++, i++) {
		face[i].top = face3[j];
		face[i].Cn = 3;
		face[i].tone = DEFTONE;
		face[i].regi = XCreateRegion();
	}

	for (j = 0; j < NF4; j++, i++) {
		face[i].top = face4[j];
		face[i].Cn = 4;
		face[i].tone = DEFTONE;
		face[i].regi = XCreateRegion();
	}

	return(0);
}

int reconf(unsigned w, unsigned h) {
	if (resize(w, h) == 0)
		return(0);
	if (rescale(w, h) != 0)
		rebuild();
	return(NFACE);
}

int zotone(int x, int y) {
	static XPoint past = { 0, 0 }; 
	int f = 0;                  
	if ((past.x == scale.x) && (past.y == scale.y))
		f = NFACE;    
	for (; f < NFACE; f++) {    
		XDestroyRegion(face[f].regi);
		face[f].regi = XPolygonRegion(face[f].top, face[f].Cn, 0);
	} 
	past.x = scale.x;
	past.y = scale.y;          
	for (f = 0; f < NFACE; f++) 
		if (XPointInRegion(face[f].regi, x, y) == True)
			break;
	face[f].tone = (face[f].tone + 1) % NCOLOR;   
	return(f);                  
}