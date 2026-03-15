#include <X11/Xlib.h>
#include <X11/Xutil.h>
#include "lab2.h"


static XVertex vertex[NVERT];
static XFace face[(NFACE + 1)];
static XEdge edge[NEDGE];
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
		{1,1},{3,5},{5,5},{5,3},{9,3},{7,5},{7,7},{5,7},{3,9},{1,11},{11,11},{7,9},{9,7},{11,1}
	};

	static int fconf4[NF4][(4 + 1)] = {
		{0,1,2,3,0},
		{0,1,8,9,0},
		{0,3,4,13,0},
		{3,4,5,2,3},
		{1,2,7,8,1},
		{2,5,6,7,2},
		{6,7,8,11,6},
		{8,9,10,11,8},
		{6,11,10,12,6},
		{4,5,6,12,4},
		{4,12,10,13}
	};

	static int econf[NEDGE][2] = {
		{0,1},{0,3}, {0,9}, {0,13},
		{1,2}, {1,8},
		{2,3}, {2,5},{2,7},
		{3,4},
		{4,5},{4,12},{4,13},
		{5,6},
		{6,7},{6,11},{6,12},
		{7,8},
		{8,9}, {8,11},
		{9,10},
		{10,11},{10,12},{10,13}
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