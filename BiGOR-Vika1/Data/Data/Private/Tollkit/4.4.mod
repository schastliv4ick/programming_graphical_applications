<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="0VXZBO9JJCY5Z59PLP1B" Author="Полякова" Level="0" ADate="EV85O9AF">
<Title>Управление событиями</Title>
<P>Функции:</P>

<List>
<P>XtAppNextEvent() &#x2014; для получения значения, которое является в настоящее время следующим во входной очереди.</P>
<P>XtDispatchEvent()- для пересылки событий соответствующей функции, обрабатывающей эти события.</P>
<P>XtAppMainLoop()-вызывается в качестве последней функции в прикладной программе, применяющей Toolkit. Она представляет из себя бесконечный цикл, который вызывает функцию <Term Type="Out">XtAppNextEvent</Term>() следуя за <Term Type="Out">XtDispatchEvent</Term>().</P>
</List>
<P>Пример исходного кода программы с использованием функций обработки событий:</P>

<Listing>
<L /><L>void XtAppNextEvent (app, event_return)</L>
</Listing>

<Listing>
<L>{</L>
<L>  XtAppContext        app;</L>
<L>  XEvent              *event_return;</L>
<L>  void XtDispatchEvent (event)</L>
<L>     XEvent              *event;</L>
<L>  void XtAppMainLoop (app)</L>
<L>     XtAppContext app;</L>
<L>     XEvent event;</L>
<L>     for (;;)  {</L>
<L>        XtAppNextEvent (app, &amp;event);</L>
<L>        XtDispatchEvent(&amp;event);</L>
<L>     }</L>
<L>}</L>
<L /></Listing>
</Modul>
