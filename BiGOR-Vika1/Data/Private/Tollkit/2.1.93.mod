<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="9RXIJS3JV2I48CLR7BLA" Author="Волосатова Т.М." Level="0" ADate="F90YEI4E">
<Title>Вывод текстовой строки</Title>
<P>Функции: <Term Type="Link">XDrawString</Term>(), <Term Type="Link">XDrawImageString</Term>(), <Term Type="Link">XDrawString16</Term>(), <Term Type="Link">XDrawImageString16</Term>()</P>
<P /><P><Font B="Y">XDrawString (display,   d,   gc,   x,   y,   string,   length);</Font></P>
<P> <Font B="Y">XDrawImageString (display,   d,   gc,   x,  y,   string,   length);</Font></P>
<P><Font B="Y">XDrawString16 (display,   d,   gc,   x,   y,   string2b,   length);</Font></P>
<P> <Font B="Y">XDrawImageString16 (display,   d,   gc,   x,   y,   string2b,   length);</Font></P>
<P><Font B="Y">Display *display;</Font></P>
<P><Font B="Y"><Font>Drawable d</Font>;</Font></P>
<P><Font B="Y">GC gc;</Font></P>
<P><Font B="Y">int x, y;</Font></P>
<P><Font B="Y">char *string;</Font></P>
<P><Font B="Y">XChar2b  *string2b;</Font></P>
<P><Font B="Y">int   length;</Font></P>
<P /><P>display           Задает соединение с Х-сервером.</P>
<P>d                   Задает конечный объект графической операции (<Term Type="Link" Sp="*">окно</Term> или пиксельную карту).</P>
<P>gc                  Задает графический контекст (GC).</P>
<P>х,у                 Координаты точки вывода текста в системе координат окна (или пиксельной карты); в эту точку выводится первый символ строки.</P>
<P>string             Строка символов.</P>
<P>length            Число символов в строке.</P>
<P /><P>Функция XDrawString() выводит заданную строку в заданное окно (или пиксельную карту) цветом рисования и шрифтом, указанными в графическом контексте, причем используются только те биты образа литер, которые установлены в 1 (т.е. строка символов выводится без фоновой подложки).</P>
<P>Координата y задает базовую горизонталь, вдоль которой выводится строка, а координата х задает точку, от которой отсчитываются левая и правая границы литер {Wearing, rbearing) и ее ширина (width).</P>
<P>Функция XDrawString16() выполняет те же действия, но для строк 16-битных литер. Для шрифтов с двухбайтной матричной <Term Type="Link" Sp="*">кодировкой</Term> (2-byte matrix indexing) используется второй байт (byte2), а первый (bytel) считается равным нулю.</P>
<P>Обе функции используют следующие компоненты графического шктекста:. function, plane_mask, <Term Type="In">fill_style</Term>, <Term Type="In">font</Term>, subwindow_node, clip_x_origin, clip_y_trigin и dipmask. Эти функции используют также компоненты графического контекста, применимые лишь в некоторых режимах рисования: foreground, background, tile, stipple, ts_x_origin и ts_y_origin.</P>
<P>Функция XDrawImageString() аналогична XDrawString(), но отличается тем, что выводит литеры с подложкой; функция XDrawImageString() сначала заполняет прямоугольники, ограничивающие литеру, фоновым цветом (заданным в графическом контексте), а затем выводит изображение самих литер (цветом рисования). Верхний левый угол прямоугольника, ограничивающего первую литеру, имеет координаты х, у -  font_ascent</P>
<P>его ширина равна width ,где width, ascent и descent &#x2014; поля структуры XCharStruct, которые можно упросить <Term Type="Link" Sp="*">вызовом функции</Term> XQueryTextExtents(), задав в качестве аргументов gc и string.</P>
<P>Функция XDrawImageString16() выполняет те же действия, но для строк 16-битных литер; параметры width, ascent и descent можно опросить вызовом функции XQueryTextExtents16()-задав в качестве аргументов gc и string2b.</P>
<P>Обе функции используют следующие компоненты графического контекста: plane mask, foreground, background, <Term Type="In">font</Term>, subwindowjnode, clip_x_origin, clip_y_origin и clipjnask. Компоненты function nfillstyle игнорируются; всегда действует логическая функция GXcopy и стиль закрашивания FiHSolid.</P>
<P>Для шрифтов с двухбайтной матричной кодировкой, переданных на обработку функции XDrawImageStringO, выбирается byte2, a bytel считается равным нулю.</P>
<P>При отработке функций XDrawString(), XDrawImageString(), XDrawString16() и XDrawImageString16() могут возникать ошибки BadDrawable, BadGC, BadFont и BadMatch.</P>
</Modul>
