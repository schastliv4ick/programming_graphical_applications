#include <X11/Xlib.h>
#include <X11/Xutil.h>
#include "lab2.h"

static XVertex vertex[NVERT];
static XFace face[(NFACE + 1)];
static XEdge edge[NEDGE];

static XPoint face4[NF4][(4 + 1)];
static XPoint face7[NF4][(7 + 1)];
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
	  {2, 5}, {6, 7}, {7, 6}, {5,2}, {2, 11}, {6, 9}, {8, 14}, {8,10}, {10, 9}, {14, 11}, {14,5},{10,7}, {9, 6},{11,2}
	};

	static int fconf4[NF4][(4 + 1)]={
		{0,1,2,3,0},
		{0, 1, 5, 4, 0},
		{5, 4, 6, 7, 5},
		{6, 7, 8, 9, 6},
		{8, 9, 10, 11, 8},
		{10, 11, 12, 13, 10},
		{2,3,13,12,2}
	};


	static int fconf7[NF7][(7 + 1)]={
		{1, 2, 12, 11, 8, 7, 5, 1}
	};


	static int econf[NEDGE][2] = {
		{0,1}, {0, 4},
		{1,2}, {1, 5}, 
		{2,3}, {2, 12},
		{3,0},{3,13},
		{4, 5}, {4, 6},
		{5, 7},
		{6, 7},{6,9},
		{7,8},
		{8,9}, {8, 11},
		{9,10}, {10, 13},
		{10,11},
		{11,12},
		{12,13}
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
	for (i = 0; i < NF7; i++)             
		for (j = 0; j < (7 + 1); j++) {   
			face7[i][j].x = vertex[fconf7[i][j]].x;
			face7[i][j].y = vertex[fconf7[i][j]].y;
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
	for (j = 0; j < NF7; j++, i++) {
		face[i].top = face7[j];
		face[i].Cn = 7;
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