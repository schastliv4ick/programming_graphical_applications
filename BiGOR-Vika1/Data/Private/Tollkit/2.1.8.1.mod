<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="J2Q30GKJK7G4IPDGU6HW" Author="Волосатова Т.М." Level="0" ADate="F8H2C424">
<Title>Процедуры изменения отдельных компонент графического контекста</Title>
<P>Функции: <Term Type="Out" Sp="Cintro">XSetState</Term>(), <Term Type="Out" Sp="Cintro;XRHN6ZLN1XWOVGQ3I3VL;U6BYA6CQ2EZ8KVW8IA4M;GNV7ZB1PXH9TJCKWQ04X;8J2HI82P95AO672PPQ2O;ru.bmstu.rk6-BD;9J0HNYNMQDVXW24XBBO3-E;ru.bmstu.rk6-051312-08;rk6.bmstu.ru-CALS;rk6.bmstu.ru-Computers;rk6.bmstu.ru-ERP;rk6.bmstu.ru-Graphics;ru.bmstu.rk6-MU;ru.bmstu.rk6-nn;RXFJ6XXUKETK1QBZNIBA-E;ru.bmstu.rk6-051313-09;rk6.bmstu.ru-Optimization;SAP;ru.bmstu.rk6-051315-10;rk6.bmstu.ru-Web-Education;simulation;ru.bmstu.rk6-051316-05;ru.bmstu.rk6-051319-11;ru.bmstu.rk6-070010-13;ru.bmstu.rk6-051311-03">XSetFunction</Term>(), <Term Type="Out" Sp="Cintro;XRHN6ZLN1XWOVGQ3I3VL;U6BYA6CQ2EZ8KVW8IA4M;GNV7ZB1PXH9TJCKWQ04X;8J2HI82P95AO672PPQ2O;ru.bmstu.rk6-BD;9J0HNYNMQDVXW24XBBO3-E;ru.bmstu.rk6-051312-08;rk6.bmstu.ru-CALS;rk6.bmstu.ru-Computers;rk6.bmstu.ru-ERP;rk6.bmstu.ru-Graphics;ru.bmstu.rk6-MU;ru.bmstu.rk6-nn;RXFJ6XXUKETK1QBZNIBA-E;ru.bmstu.rk6-051313-09;rk6.bmstu.ru-Optimization;SAP;ru.bmstu.rk6-051315-10;rk6.bmstu.ru-Web-Education;simulation;ru.bmstu.rk6-051316-05;ru.bmstu.rk6-051319-11;ru.bmstu.rk6-070010-13;ru.bmstu.rk6-051311-03">XSetForeground</Term>(), <Term Type="Out" Sp="Cintro">XSetBackground</Term>(), <Term Type="Out" Sp="Cintro">XFlushGC</Term>(), структура <Term Type="Out" Sp="Cintro">XSetPlanemask</Term>.</P>
<P>1). Синтаксис</P>
<P><Font B="Y">XSetState (display,   gc,  foreground,   background, function)</Font></P>
<P><Font B="Y">XSetFunction (display,   gc,  function)</Font></P>
<P><Font B="Y">XSetPlaneMask (display,   gc,  plane_mask)</Font></P>
<P><Font B="Y">XSetForeground (display,   gc, foreground)</Font></P>
<P><Font B="Y">XSet Background! (display,   gc,   background)</Font></P>
<P><Font B="Y">XFlushGC (display,   gc)</Font></P>
<P><Font B="Y">Display  *display;</Font></P>
<P><Font B="Y"><Font>GC gc;</Font></Font></P>
<P><Font B="Y">unsigned  long foreground,   background;</Font></P>
<P><Font B="Y">int function;</Font></P>
<P><Font B="Y">unsigned   long plane_mask</Font>;</P>
<P /><P>display           Задает соединение с Х-сервером.</P>
<P>gc                  Задает графический контекст.</P>
<P>foreground     Цвет рисования.</P>
<P>background    Фоновый цвет.</P>
<P>function          Задает логическую функцию.</P>
<P>plane_mask    Задает маску плоскостей.</P>
<P /><P>Функция XSetState() устанавливает следующие компоненты указанного графического контекста: цвет рисования, фоновый цвет, маску плоскостей и логическую функцию.</P>
<P>При отработке функции XSetStateO могут возникать ошибки Bad Allot. BadGC и BadValue.</P>
<P>Функция XSetFunction() устанавливает логическую функцию в указанном графическом контексте.</P>
<P>При отработке функции XSetFunction() могут возникать ошибки BadAIloc, BadGC и BadValue. Функция XSetPlaneMask() устанавливает маску плоскостей в указанном графическом контексте. При отработке функции XSetPlaneMask() могут возникать ошибки BadAlloc и BadGC. Функция XSetForeground() устанавливает цвет рисования в указанном графическом контексте. При отработке функции XSetForeground() могут возникать ошибки BadAIloc и BadGC. Функция XSetBackground() устанавливает фоновый цвет в указанном графическом контексте. При отработке функции XSetBackground() могут возникать ошибки BadAlloc и BadGC.</P>
<P>Обычно изменения, внесенные в графический контекст, накапливаются на клиентской стороне и не передаются <Term Type="Link" Sp="*">серверу</Term> до тех пор, пока не будет вызвана какая-либо функция, использующая этот графический контекст. Это позволяет отправлять изменения единым пакетом за один запрос. Однако при некоторых обстоятельствах бывает необходимо принудительно отправить информацию об изменениях серверу, например, когда используются расширения Х-протокола и графический контекст используется неявно (т.е. соответствующая интерфейсная функция не содержит аргумента, ссылающегося на графический контекст, но использует его). Для таких случаев и предусмотрена функция XFlushGC()</P>
<P /><P>BadAlloc        Серверу не удалось выделить требуемый ресурс или область памяти.</P>
<P>BadGC           Значение аргумента gc не соответствует инициализированному графическому</P>
<P>контексту.</P>
<P>BadValue Значения некоторых числовых параметров выходят за диапазон допустимых величин. Если для аргумента не описан диапазон значений, то допустимы все значения, представимые в данном типе. Если аргумент может принимать лишь несколько определенных значений, то любое другое значение вызовет данную ошибку.</P>
</Modul>
