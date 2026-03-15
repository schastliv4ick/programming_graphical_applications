<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="VGMKG3MTO74G5AZFQT3I" Author="Полякова В.Г." Level="0" ADate="ETJQGZSG">
<Title>Разрыв связи с Х-сервером</Title>
<P>Для корректного завершения клиентской программы в среде <Term Type="In">X Windows System</Term> рекомендуют освободить ресурсы, связанные с созданием окон, пиксельных карт, загрузкой шрифтов и прервать взаимодействие с Х-сервером для <Term Sp="rk6.bmstu.ru-Computers" Type="Link">дисплея</Term>, специфицированного структурой Display в клиентской программе. Для реализации указанных действий рекомендуется применять функции <Term Type="Out" Sp="Cintro;XRHN6ZLN1XWOVGQ3I3VL;U6BYA6CQ2EZ8KVW8IA4M;GNV7ZB1PXH9TJCKWQ04X;8J2HI82P95AO672PPQ2O;ru.bmstu.rk6-BD;9J0HNYNMQDVXW24XBBO3-E;ru.bmstu.rk6-051312-08;rk6.bmstu.ru-CALS;rk6.bmstu.ru-Computers;rk6.bmstu.ru-ERP;rk6.bmstu.ru-Graphics;ru.bmstu.rk6-MU;ru.bmstu.rk6-nn;RXFJ6XXUKETK1QBZNIBA-E;ru.bmstu.rk6-051313-09;rk6.bmstu.ru-Optimization;SAP;ru.bmstu.rk6-051315-10;rk6.bmstu.ru-Web-Education;simulation;ru.bmstu.rk6-051316-05;ru.bmstu.rk6-051319-11;ru.bmstu.rk6-070010-13;ru.bmstu.rk6-051311-03">XDestroyWindow</Term>, <Term Type="Out" Sp="Cintro;XRHN6ZLN1XWOVGQ3I3VL;U6BYA6CQ2EZ8KVW8IA4M;GNV7ZB1PXH9TJCKWQ04X;8J2HI82P95AO672PPQ2O;ru.bmstu.rk6-BD;9J0HNYNMQDVXW24XBBO3-E;ru.bmstu.rk6-051312-08;rk6.bmstu.ru-CALS;rk6.bmstu.ru-Computers;rk6.bmstu.ru-ERP;rk6.bmstu.ru-Graphics;ru.bmstu.rk6-MU;ru.bmstu.rk6-nn;RXFJ6XXUKETK1QBZNIBA-E;ru.bmstu.rk6-051313-09;rk6.bmstu.ru-Optimization;SAP;ru.bmstu.rk6-051315-10;rk6.bmstu.ru-Web-Education;simulation;ru.bmstu.rk6-051316-05;ru.bmstu.rk6-051319-11;ru.bmstu.rk6-070010-13;ru.bmstu.rk6-051311-03">XFreePixMap</Term>, <Term Type="Out" Sp="Cintro;XRHN6ZLN1XWOVGQ3I3VL;U6BYA6CQ2EZ8KVW8IA4M;GNV7ZB1PXH9TJCKWQ04X;8J2HI82P95AO672PPQ2O;ru.bmstu.rk6-BD;9J0HNYNMQDVXW24XBBO3-E;ru.bmstu.rk6-051312-08;rk6.bmstu.ru-CALS;rk6.bmstu.ru-Computers;rk6.bmstu.ru-ERP;rk6.bmstu.ru-Graphics;ru.bmstu.rk6-MU;ru.bmstu.rk6-nn;RXFJ6XXUKETK1QBZNIBA-E;ru.bmstu.rk6-051313-09;rk6.bmstu.ru-Optimization;SAP;ru.bmstu.rk6-051315-10;rk6.bmstu.ru-Web-Education;simulation;ru.bmstu.rk6-051316-05;ru.bmstu.rk6-051319-11;ru.bmstu.rk6-070010-13;ru.bmstu.rk6-051311-03">XFreeFont</Term>,<Term Type="Out" Sp="Cintro;XRHN6ZLN1XWOVGQ3I3VL;U6BYA6CQ2EZ8KVW8IA4M;GNV7ZB1PXH9TJCKWQ04X;8J2HI82P95AO672PPQ2O;ru.bmstu.rk6-BD;9J0HNYNMQDVXW24XBBO3-E;ru.bmstu.rk6-051312-08;rk6.bmstu.ru-CALS;rk6.bmstu.ru-Computers;rk6.bmstu.ru-ERP;rk6.bmstu.ru-Graphics;ru.bmstu.rk6-MU;ru.bmstu.rk6-nn;RXFJ6XXUKETK1QBZNIBA-E;ru.bmstu.rk6-051313-09;rk6.bmstu.ru-Optimization;SAP;ru.bmstu.rk6-051315-10;rk6.bmstu.ru-Web-Education;simulation;ru.bmstu.rk6-051316-05;ru.bmstu.rk6-051319-11;ru.bmstu.rk6-070010-13;ru.bmstu.rk6-051311-03">XCloseDisplay</Term>.</P>
<P>Следующий пример представляет типичную концовку клиентской программы:</P>

<Listing>
<L /><L>Display *dpy;</L>
<L>Window win;</L>
<L>Pixmap pix;</L>
<L>XFontStruct *font;</L>
<L>XFreeFont(dpy,font);</L>
<L>XFreePixmap(dpy,pix);</L>
<L>XDestroyWindow(dpy,win);</L>
<L>XCloseDisplay(dpy);</L>
</Listing>
</Modul>
