<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="0RXALXFFBWRJZ9QGRDP1" Author="Волосатова Т.М." Level="0" ADate="F8H0BY2C">
<Title>Включение и отключение синхронизации обменов по Х-протоколу</Title>
<P /><P>Функции: <Term Type="Out" Sp="Cintro;XRHN6ZLN1XWOVGQ3I3VL;U6BYA6CQ2EZ8KVW8IA4M;GNV7ZB1PXH9TJCKWQ04X;8J2HI82P95AO672PPQ2O;ru.bmstu.rk6-BD;9J0HNYNMQDVXW24XBBO3-E;ru.bmstu.rk6-051312-08;rk6.bmstu.ru-CALS;rk6.bmstu.ru-Computers;rk6.bmstu.ru-ERP;rk6.bmstu.ru-Graphics;ru.bmstu.rk6-MU;ru.bmstu.rk6-nn;RXFJ6XXUKETK1QBZNIBA-E;ru.bmstu.rk6-051313-09;rk6.bmstu.ru-Optimization;SAP;ru.bmstu.rk6-051315-10;rk6.bmstu.ru-Web-Education;simulation;ru.bmstu.rk6-051316-05;ru.bmstu.rk6-051319-11;ru.bmstu.rk6-070010-13;ru.bmstu.rk6-051311-03">XSynchronize()</Term>, <Term Type="Out" Sp="Cintro;XRHN6ZLN1XWOVGQ3I3VL;U6BYA6CQ2EZ8KVW8IA4M;GNV7ZB1PXH9TJCKWQ04X;8J2HI82P95AO672PPQ2O;ru.bmstu.rk6-BD;9J0HNYNMQDVXW24XBBO3-E;ru.bmstu.rk6-051312-08;rk6.bmstu.ru-CALS;rk6.bmstu.ru-Computers;rk6.bmstu.ru-ERP;rk6.bmstu.ru-Graphics;ru.bmstu.rk6-MU;ru.bmstu.rk6-nn;RXFJ6XXUKETK1QBZNIBA-E;ru.bmstu.rk6-051313-09;rk6.bmstu.ru-Optimization;SAP;ru.bmstu.rk6-051315-10;rk6.bmstu.ru-Web-Education;simulation;ru.bmstu.rk6-051316-05;ru.bmstu.rk6-051319-11;ru.bmstu.rk6-070010-13;ru.bmstu.rk6-051311-03">XSetAfterFunction()</Term>.</P>
<P /><P><Font B="Y">int   ( *XSynchronize(display,   onoff)) ()</Font></P>
<P><Font B="Y">Display  * display ;</Font></P>
<P><Font B="Y">Bool  onoff; </Font></P>
<P><Font B="Y">int   (*XSetAfterFunction (display,  procedure)) ()</Font></P>
<P><Font B="Y">Display   * display;</Font></P>
<P><Font B="Y">int    ( *procedure ) () ;</Font></P>
<P /><P>display           Задает соединение с <Term Type="Link" Sp="*">Х-сервером</Term>.</P>
<P>onoff              Булевское значение, предписывающее включить (True) или отключить (False)</P>
<P>синхронизацию.</P>
<P>procedure       Задает процедуру последействия.</P>
<P /><P>Функция XSynchronize() включает или отключает синхронизацию обменов по Х-протоколу при проведении отладки. Если аргумент onoff имеет значение True, синхронизация включается, если False - восстанавливается штатный асинхронный обмен. В режиме синхронного обмена уведомления о событиях поступают немедленно, без каких-либо задержек (на буферизацию), хотя сервер работает во много раз медленнее. Такая возможность полезна при отладке сложных программ обработки событий. В UNIX-системах тот же самый эффект может быть достигнут без вызова этой функции, а просто присвоением <Term Type="Link" Sp="*">глобальной переменной</Term> Xdebug значения True из отладчика. Функция XSynchronizeQ возвращает предыдущую процедуру последействия.</P>
<P>Функция XSetAfterFunction() устанавливает процедуру последействия. Все функции библиотеки Хlib, выдающие запросы серверу по <Term Type="Link" Sp="Cintro;XRHN6ZLN1XWOVGQ3I3VL;U6BYA6CQ2EZ8KVW8IA4M;GNV7ZB1PXH9TJCKWQ04X;8J2HI82P95AO672PPQ2O;ru.bmstu.rk6-BD;9J0HNYNMQDVXW24XBBO3-E;ru.bmstu.rk6-051312-08;rk6.bmstu.ru-CALS;rk6.bmstu.ru-Computers;rk6.bmstu.ru-ERP;rk6.bmstu.ru-Graphics;ru.bmstu.rk6-MU;ru.bmstu.rk6-nn;RXFJ6XXUKETK1QBZNIBA-E;ru.bmstu.rk6-051313-09;rk6.bmstu.ru-Optimization;SAP;ru.bmstu.rk6-051315-10;rk6.bmstu.ru-Web-Education;simulation;ru.bmstu.rk6-051316-05;ru.bmstu.rk6-051319-11;ru.bmstu.rk6-070010-13;ru.bmstu.rk6-051311-03">Х-протоколу</Term>, вызывают (после выдачи запроса) процедуру последействия; по умолчанию, это пустая процедура. Функция XSetAfterFunction() возвращает предыдущую процедуру последействия.</P>
<P>Функция XSynchronize() устанавливает процедуру последействия, выполняющую сброс всех буферов запросов и ввода после каждого запроса к серверу.</P>
</Modul>
