<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="BXQB1R1I4QU8H4ERVO3P" Author="Волосатова Т.М." Level="0" ADate="F90Y1CRL">
<Title>Рисование прямоугольников</Title>
<P>Функции: <Term Type="Out">XDrawRectangle</Term>(), <Term Type="Out">XDrawRectangles</Term>(), структура XRectangle.</P>
<P /><P><Font B="Y">XDrawRectangle (display,   d,   gc,   x,   y,   width,   height)</Font></P>
<P><Font B="Y"> XDrawRectangles (display,   d,   gc,   rectangles,   nrectangles)</Font></P>
<P><Font B="Y">Display *display;</Font></P>
<P><Font B="Y">Drawable d;</Font></P>
<P><Font B="Y">GC gc;</Font></P>
<P><Font B="Y">int x, y;</Font></P>
<P><Font B="Y">unsigned int  width,   height;</Font></P>
<P><Font B="Y">XRectangle  rectangles[];</Font></P>
<P><Font B="Y">int  nrectangles;</Font></P>
<P /><P> <Term Type="Link" Sp="*">Аргументы</Term></P>
<P>display           Задает соединение с Х-сервером.</P>
<P>gc                   Задает графический контекст (GC).</P>
<P>х, у                 Координаты левого верхнего угла прямоугольника (в системе координат окна или пиксельной карты).</P>
<P>width, height   Высота и ширина прямоугольника.</P>
<P> rectangles       <Term Type="Link" Sp="*">Указатель</Term> на <Term Type="Link" Sp="*">массив</Term> прямоугольников. </P>
<P>nrectangles     Число прямоугольников в массиве.</P>
<P /><P>Функции XDrawRectangle() и XDrawRectangles() предназначены для рисования прямоугольников, рассматриваемых как ломаные линии,&quot;определяемые пятью точками:</P>
<P /><P><Font B="Y">[х,у] [x+width,у] [x+width,y+height] [x,y+height] [x, у]</Font></P>
<P /><P>В процессе рисования прямоугольника этими функциями ни одна точка не рисуется дважды. Функция XDrawRectangles() рисует прямоугольники в том порядке, в котором они следуют в переданном <Term Type="Link" Sp="*">массиве</Term>. Если прямоугольники пересекаются, то точки пересечения выводятся многократно.</P>
<P>Обе функции используют следующие основные компоненты графического контекста: function, planemask, line_width, line_style, cap_style,join_style,fill_style, subwindow_node, clip_x_origin, clip_y_origin и clip_mask. Используются также следующие компоненты графического контекста, применимые лишь в некоторых операциях: foreground, background, tile, stipple, ts_x_origin, ts_y_origin, dash_offset и dash_list.</P>
<P>При отработке функций XDrawRectangle() и XDrawRectangles() могут возникать ошибки BadDrawable, BadGC и BadMatch.</P>
<P /><P>Структура XRectangle определена следующим образом:</P>
<P /><P><Font B="Y">typedef struct {</Font></P>
<P>                        <Font B="Y">short x, у;</Font></P>
<P><Font B="Y">unsigned  short  width,   height; </Font></P>
<P><Font B="Y">}</Font> <Font B="Y">XRectangle;</Font></P>
<P /><P>Компоненты х и у являются беззнаковыми целыми величинами. Не следует допускать значений координат или размеров, не помещающихся в 16-битовом представлении, так как по X-протоколу эти параметры передаются в 16-битовых полях.</P>
</Modul>
