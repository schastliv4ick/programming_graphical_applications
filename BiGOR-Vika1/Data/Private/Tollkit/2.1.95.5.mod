<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="F0P0CDVUFDV4XSZ25AXW" Author="Волосатова Т.М." Level="0" ADate="F9QPDLUH">
<Title>События FocusIn и  FocusOut</Title>
<P /><P> События <Term Type="Out">Focusln</Term> и <Term Type="Out">FocusOut</Term>; <Term Type="Out">структура XFocusChangeEvent</Term></P>
<P /><P>Структура XFocusChangeEvent, относящаяся к событиям Focusln и FocusOut, определена следующим образом:</P>
<P /><P><Font B="Y">typedef  struct   {</Font></P>
<P><Font B="Y">int   type;</Font>                            /*   тип   события   -   Focusln  или   FocusOut</P>
<P><Font B="Y">unsigned  long  serial;</Font>        /*  номер последнего  обработанного  запрос,</P>
<P><Font B="Y">Bool send event;</Font></P>
<P><Font B="Y">Display   *display;</Font></P>
<P><Font B="Y">Window window;</Font></P>
<P><Font B="Y">int mode;</Font></P>
<P><Font B="Y">int detail;</Font></P>
<P /><P><Font B="Y">}XFocusChangeEvent ;</Font></P>
<P><Font B="Y">typedef XFocusChangeEvent XFocusInEvent;</Font></P>
<P><Font B="Y">typedef XFocusChangeEvent XFocusOutEvent;</Font></P>
<P /><P>События Focusln и FocusOut сигнализируют соответственно о том, что в <Term Type="Link" Sp="*">окно</Term> сфокусирован ввод клавиатуры или что фокусировка ввода снята. При изменении фокусировки ввода</P>
<P>клавиатуры в окно, куда фокусируется ввод, адресуется событие Focusln, а в окно, с которого фокусировка ввода снята - событие FocusOut. Кроме того, эти события адресуются также и всем окнам в иерархии от первого до второго из указанных. В этом случае в поле detail помещается соответствующая информация.</P>
<P>Адресация этих событий в окно выполняется при установленном флаге FocusChangeMask (устанавливается вызовом XSelectlnputQ); затребовать адресацию только одного из этих событий невозможно. При наступлении событий этих типов в поля структур записываются значения, смысл которых описан ниже.</P>
<P>Содержимое полей type, serial, sendevent и display описано в 17.1.</P>
<P>В поле window записывается <Term Type="Link" Sp="*">идентификатор</Term> окна, которому адресовано событие Focusln или FocusOut.</P>
<P>В поле mode записывается информация об условиях изменения фокусировки ввода: (1) фокусировка изменяется, когда клавиатура не захвачена; (2) фокусировка изменяется, когда клавиатура захвачена; (3) фокусировка изменяется в результате захвата клавиатуры; (4) фокусировка изменяется в результате освобождения клавиатуры. Перечисленным условиям соответствуют следующие значения в поле mode: NotifyNormal, NotifyWhileGrabbed, NotifyGrab и NotifyUngrab.</P>
<P>Уведомления о событиях FocusOut, вызванных гашением окна, поступают всегда после соответствующего уведомления о событии UnmapNotify; однако правильная последовательность уведомлений о событии FocusOut и послужившем его причиной событии EnterNotify, LeaveNotify, VisibilityNotify или Expose не гарантируется.</P>
<P>В поле detail записьшается информация о взаимном расположении в иерархии окна-получателя события, окна, которое покинул курсор, и окна, в которое попал курсор. В это поле может быть записано одно из значений NotifyAncestor, NotifyVirtual, Notifylnferior, NotifyNonlinear, NotifyNonlinearVirtual, NotifyPointer, NotifyPointerRoot или Notify DclailNonc.</P>
<P /></Modul>
