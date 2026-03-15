#include <X11/Xlib.h>
#include <X11/Xutil.h>
#include "lab2.h"


static XVertex vertex[NVERT];
static XFace face[(NFACE + 1)];
static XEdge edge[NEDGE];
static XPoint face3[NF3][(3 + 1)];
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
	{1, 15}, {17, 15}, {9, 1}, {9, 13}, {7, 12}, {9, 12}, {11, 12}, {8, 10}, {10, 10}, {7, 9}, {9, 8}, {11, 9}
	};

	static int fconf3[NF3][(3 + 1)] = {
		{0, 1, 3, 0},
		{1, 2, 11, 1},
		{0, 2, 9, 0},
		{0, 3, 4, 0},
		{0, 4, 9, 0},
		{1, 3, 6, 1},
		{1, 6, 11, 1},
		{2, 9, 10, 2},
		{2, 10, 11, 2},
		{3, 4, 5, 3},
		{3, 5, 6, 3},
		{4, 5, 7, 4},
		{4, 7, 9, 4},
		{5, 7, 8, 5},
		{5, 6, 8, 5},
		{6, 8, 11, 6},
		{10, 7, 9, 10},
		{10, 7, 8, 10},
		{10, 8, 11, 10}
	};

	static int econf[NEDGE][2] = {
		{0, 1}, {0, 3}, {0, 4}, {0, 9}, {0, 2},
		{1, 3}, {1, 6}, {1, 11}, {1, 2},
		{2, 9}, {2, 10}, {2, 11},
		{3, 4}, {3, 5}, {3, 6},
		{4, 5}, {4, 7}, {4, 9},
		{5, 6}, {5, 7}, {5, 8},
		{6, 8}, {6, 11},
		{7, 8}, {7, 9}, {7, 10},
		{8, 10}, {8, 11},
		{9, 10},
		{10, 11},
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