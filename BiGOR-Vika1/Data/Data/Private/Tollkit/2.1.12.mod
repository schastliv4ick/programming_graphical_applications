<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="VGMKG3MTO74G5AZFQT3I" Author="Полякова В.Г." Level="0" ADate="ETJQGZSG">
<Title>Разрыв связи с Х-сервером</Title>
<P>Для корректного завершения клиентской программы в среде <Term Type="In">X Windows System</Term> рекомендуют освободить ресурсы, связанные с созданием окон, пиксельных карт, загрузкой шрифтов и прервать взаимодействие с Х-сервером для <Term Sp="rk6.bmstu.ru-Computers" Type="Link">дисплея</Term>, специфицированного структурой Display в клиентской программе. Для реализации указанных действий рекомендуется применять функции XDestroyWindow, XFreePixMap, XFreeFont,XCloseDisplay.</P>
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
