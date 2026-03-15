<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="WVX8Y3T1OHSJP3SOE706" Author="Волосатова Т.М." Level="0" ADate="F8H07IRY">
<Title>Захват и освобождение Х-сервера</Title>
<P /><P>Функции: <Term Type="Out" Sp="Cintro;XRHN6ZLN1XWOVGQ3I3VL;U6BYA6CQ2EZ8KVW8IA4M;GNV7ZB1PXH9TJCKWQ04X;8J2HI82P95AO672PPQ2O;ru.bmstu.rk6-BD;9J0HNYNMQDVXW24XBBO3-E;ru.bmstu.rk6-051312-08;rk6.bmstu.ru-CALS;rk6.bmstu.ru-Computers;rk6.bmstu.ru-ERP;rk6.bmstu.ru-Graphics;ru.bmstu.rk6-MU;ru.bmstu.rk6-nn;RXFJ6XXUKETK1QBZNIBA-E;ru.bmstu.rk6-051313-09;rk6.bmstu.ru-Optimization;SAP;ru.bmstu.rk6-051315-10;rk6.bmstu.ru-Web-Education;simulation;ru.bmstu.rk6-051316-05;ru.bmstu.rk6-051319-11;ru.bmstu.rk6-070010-13;ru.bmstu.rk6-051311-03">XGrabServer()</Term>, <Term Type="Out" Sp="Cintro;XRHN6ZLN1XWOVGQ3I3VL;U6BYA6CQ2EZ8KVW8IA4M;GNV7ZB1PXH9TJCKWQ04X;8J2HI82P95AO672PPQ2O;ru.bmstu.rk6-BD;9J0HNYNMQDVXW24XBBO3-E;ru.bmstu.rk6-051312-08;rk6.bmstu.ru-CALS;rk6.bmstu.ru-Computers;rk6.bmstu.ru-ERP;rk6.bmstu.ru-Graphics;ru.bmstu.rk6-MU;ru.bmstu.rk6-nn;RXFJ6XXUKETK1QBZNIBA-E;ru.bmstu.rk6-051313-09;rk6.bmstu.ru-Optimization;SAP;ru.bmstu.rk6-051315-10;rk6.bmstu.ru-Web-Education;simulation;ru.bmstu.rk6-051316-05;ru.bmstu.rk6-051319-11;ru.bmstu.rk6-070010-13;ru.bmstu.rk6-051311-03">XUngrabServer()</Term>.</P>
<P /><P><Font B="Y">XGrabServer (display)</Font> </P>
<P><Font B="Y">XUngrabServer (display)</Font></P>
<P><Font B="Y">Display  * display;</Font></P>
<P /><P>display           Задает соединение с <Term Type="Link" Sp="*">Х-сервером</Term>.</P>
<P /><P>Функция XGrabServer() приостанавливает обработку запросов и посылку ответных сообщений по всем соединениям Х-сервера, кроме указанного. Данную процедуру следует вызывать только в случаях крайней необходимости. Функция XUngrabServer() возобновляет работу Х-сервера по остальным соединениям (отменяет действие процедуры XGrabServer() )</P>
</Modul>
