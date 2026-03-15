<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="LAGL39QYWMERCN4B7YCD" Author="Волосатова Т.М." Level="0" ADate="F90WY4Y2">
<Title>Рисование точек</Title>
<P>Функции: <Term Type="Out">XDrawPoint</Term>(), <Term Type="Out">XDrawPoints</Term>(); структура XPoint.</P>
<P /><P><Font B="Y">XDrawPoint (display,   d,   gc,   x,  y)</Font></P>
<P><Font B="Y">XDrawPoints (display,   d,   gc,  points,   npoints,   mode)</Font></P>
<P><Font B="Y">Display   * display;</Font></P>
<P><Font B="Y">Drawable  d;</Font></P>
<P><Font B="Y">GC  gc;</Font></P>
<P><Font B="Y">int  x,   y;</Font></P>
<P><Font B="Y">XPoint   *points;</Font></P>
<P><Font B="Y">int   npoints;</Font></P>
<P><Font B="Y">int  mode;</Font></P>
<P /><P>display           Задает соединение с <Term Type="Link" Sp="*">Х-сервером</Term>.</P>
<P>d                    Задает конечный объект графической операции (<Term Type="Link" Sp="*">окно</Term> или пиксельную карту).</P>
<P>gc                   Задает графический контекст (GC).</P>
<P>х, у                 Координаты рисуемой точки.</P>
<P>points             Указатель на массив точек.</P>
<P>npoints           Число точек в массиве.</P>
<P>mode              Задает режим интерпретации координат. Можно указать CoordModeOrigin (режим   абсолютного  позиционирования)  или  CoordModePrevious  (режим относительного позиционирования).</P>
<P /><P>Функция XDrawPoint() выводит точку в указанное окно или пиксельную карту (внеэкранную области памяти); функция использует цвет изображения и функции рисования, определяемые заданным графическим контекстом gc. Функция XDrawPoints() выводит несколько точек. В режиме абсолютного позиционирования (CoordModeOrigin) все координаты отсчитываются от начала координат (окна или пиксельной карты), в режиме относительного позиционирования (CoordModePrevious) все координаты считаются координатами вектора смещения относительно предыдущей точки. Функция XDrawPoints() выводит точки в том порядке, в котором они перечислены в переданном ей <Term Type="Link" Sp="*">массиве структур</Term> XPoints.</P>
<P>Обе функции используют следующие компоненты графического контекста: function, plane mask, foreground, subwindow mode, clip_x_origin, clip_y__ohgin и clipmask.</P>
<P>При отработке функции XDrawPoint() могут возникать ошибки BadDrawable, BadGC и BadMatch. При отработке функции XDrawPoints() могут возникать ошибки BadDrawable, BadGC, BadMatch и BadValue.Функции библиотеки Xlib системы X Window.</P>
<P /><P> Структуры</P>
<P /><P>Структура описания точки XPoint определена следующим образом:</P>
<P /><P><Font B="Y"><Font B="Y">typedef  struct   (short  x,   у)</Font>;</Font></P>
<P><Font B="Y">XPoint;</Font></P>
<P /><P>Элементы структур, описывающие координаты (x, у, и т.д.), являются целочисленными величинами со знаком. Элементы структур, описывающие размеры объектов (width, height и т.д.), являются беззнаковыми целыми величинами. Не следует допускать величин координат или размеров, не помещающихся в 16-битовом представлении, так как по Х-протоколу такие параметры передаются в 16-битовых полях.</P>
</Modul>
