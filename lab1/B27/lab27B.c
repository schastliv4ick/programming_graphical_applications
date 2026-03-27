#include <X11/Xlib.h> /* Заголовок  базовой  Х-графики */

#define WIDTH 96  /*  Ширина  повторяющегося  элемента */
#define HEIGHT 64    /*  Высота  повторяющегося  элемента */

/*  Основная  функция  программы */

int main(int argc, char* argv[]) {
Display* dpy;                   /*  Адрес  дисплейной  структуры */
int src;                        /*  Номер  экрана  дисплея */
GC gc;                          /*  Графический  контекст */
int depth;                      /*  Число  цветовых  плоскостей  экрана */
Window root;                    /*  Корневое  окно  экрана */
Pixmap pix;                     /*  Пиксельная  карта  элемента  фона */
Window win;                     /*  Основное  окно  программы */
XSetWindowAttributes attr;      /*  Атрибуты  окна  программы */
unsigned long amask;            /*  Маска  атрибутов  окна */ 
unsigned long emask;            /*  Маска  событий */
XEvent event;                   /*  Структура  оконных  событий */
unsigned int done = 0;          /*  Флаг  завершения  программы  */

dpy = XOpenDisplay(NULL);       /*  Контакт  с  Х-сервером  */
src = DefaultScreen(dpy);       /*  Номер  экрана  (0) */
depth = DefaultDepth(dpy, src); /*  Глубина  экрана */
root = DefaultRootWindow(dpy);  /*  Корневое  окно */
gc = DefaultGC(dpy, src);       /*  Графический  контекст  */

pix = XCreatePixmap(dpy, root, WIDTH, HEIGHT, depth);
XSetBackground(dpy, gc, WhitePixel(dpy, src));
XSetForeground(dpy, gc, WhitePixel(dpy, src));
XFillRectangle(dpy, pix, gc, 0, 0, WIDTH, HEIGHT);
XSetForeground(dpy, gc, BlackPixel(dpy, src));


XDrawLine(dpy, pix, gc, 0, 0, 0, 64);        
XDrawLine(dpy, pix, gc, 0, 0, 96, 64);
XDrawLine(dpy, pix, gc, 0, 64, 96, 0);
XDrawLine(dpy, pix, gc, 96, 64, 96, 0);

XDrawLine(dpy, pix, gc, 0, 32, 16, 32);
XDrawLine(dpy, pix, gc, 16, 32, 32, 64);
XDrawLine(dpy, pix, gc, 16, 32, 32, 0);
XDrawLine(dpy, pix, gc, 32, 64, 64, 64);
XDrawLine(dpy, pix, gc, 32, 0, 64, 0);
XDrawLine(dpy, pix, gc, 64, 64, 80, 32);
XDrawLine(dpy, pix, gc, 64, 0, 80, 32);
XDrawLine(dpy, pix, gc, 80, 32, 96, 32);
XDrawLine(dpy, pix, gc, 48, 64, 48, 0);

amask = (CWOverrideRedirect | CWBackPixmap);
attr.override_redirect = False;                               /*  Обрамление  окна */
attr.background_pixmap = pix;                                 /*  Фон  пиксельной  карты *
win = XCreateWindow(dpy, root, 0, 0, 800, 600, 1, depth, InputOutput, CopyFromParent, amask, &attr);
emask = (ButtonPressMask | ButtonReleaseMask | EnterWindowMask | LeaveWindowMask | KeyPressMask);                                         /*  Маска  событий */
XSelectInput(dpy, win, emask);                                 /*  Маскировка  событий */
XMapRaised(dpy, win);                                          /*  Отображение  окна */
XSetFunction(dpy, gc, GXinvert);                               /*  Инверсия  фона */

while(done == 0) {
  XNextEvent(dpy, &event);         /*  Чтение  событий */
  switch(event.type) {
    case EnterNotify:
    case LeaveNotify:
    case ButtonPress:
    case ButtonRelease:            /*  Инвертировать  фон  окна  */
      XCopyArea(dpy, pix, pix, gc, 0, 0, WIDTH, HEIGHT, 0, 0);  
      XSetWindowBackgroundPixmap(dpy, win, pix);
      XClearWindow(dpy, win);
      break;
    case KeyPress:                 /* Выход из цикла обработки событий */
      done = event.xkey.keycode;
      break;
    default:
      break;
  }
} 

XFreePixmap(dpy, pix);            /*  Освободить  память  карты */
XDestroyWindow(dpy, win);         /*  Закрыть  окно */
XCloseDisplay(dpy);               /*  Разрыв  связи  с  Х-сервером */
return(done);                     /*  exit-код*/
}
