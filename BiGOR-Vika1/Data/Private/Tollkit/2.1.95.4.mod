<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="MZ4OKKN3RRFNZE58SN0L" Author="Волосатова Т.М." Level="0" ADate="F9H55CJQ">
<Title>События EnterNotify и LeaveNotify</Title>
<P>Структура <Term Type="Out">XCrossingEvent</Term>, относящаяся к событиям<Term Type="Link"> EnterNotify</Term> и <Term Type="Link">LeaveNotify</Term>, определена следующим образом:</P>
<P /><P><Font B="Y">typedef struct {</Font></P>
<P><Font B="Y"> int type;</Font></P>
<P><Font B="Y">unsigned long serial;</Font></P>
<P><Font B="Y"><Font> Bool send_event;</Font></Font></P>
<P><Font B="Y">Display *display;</Font> </P>
<P><Font B="Y">Window window,</Font><Font B="Y"> Window root;</Font></P>
<P><Font B="Y">Window subwindow;</Font></P>
<P><Font B="Y">Time time;</Font></P>
<P><Font B="Y">int x,y;</Font></P>
<P><Font B="Y">int x_root,  y_root;</Font></P>
<P><Font B="Y">int mode; </Font></P>
<P><Font B="Y">int detail;</Font></P>
<P><Font B="Y">Bool same__screen;</Font></P>
<P><Font B="Y">Bool focus;</Font></P>
<P><Font B="Y">unsigned int state;</Font></P>
<P><Font B="Y"> }XCrossingEvent; </Font></P>
<P><Font B="Y">typedef XCrossingEvent  XEnterWindowEvent;</Font></P>
<P><Font B="Y">typedef XCrossingEvent  XLeaveWindowEvent;</Font></P>
<P /><P>События EnterNotify и LeaveNotify сигнализируют о пересечении графическим <Term Type="Link" Sp="*">курсором</Term> границы <Term Type="Link" Sp="*">окна</Term>. Событие EnterNotify означает вход курсора в зону окна, а событие LeaveNotify - выход за границы окна. При пересечении курсором границы окна эти события адресуются не только окнам, которое покинул курсор и в которое он попал, но и всем предкам этих окон вплоть до их общего предка (или корневых окон разных экранов, если курсор перешел с экрана на экран). Информация об этом записывается в поле detail.</P>
<P>Информирование о событиях EnterNotify и LeaveNotify можно заказать установкой флагов EnterWindowMask и LeaveWindowMask соответственно.</P>
<P>При наступлении этих событий в поля соответствующих структур записываются значения, смысл которых описан ниже.</P>
<P>В поле window записывается <Term Type="Link" Sp="*">идентификатор</Term> окна, в котором произошло событие EnterNotify или LeaveNotify.</P>
<P>В поле root записывается идентификатор корневого окна окна-источника события.</P>
<P>Если окну адресовано событие LeaveNotify, а курсор на самом деле покинул зону его дочернего окна (для. которого не заказано информирование об этом событии), то в поле subwindow записывается идентификатор дочернего окна. В противном случае в поле subwindow записывается значение None.</P>
<P>Аналогично, если окну адресовано событие EnterNotify, а курсор на самом деле вошел в зону его дочернего окна (для которого не заказано информирование об этом событии), то в поле</P>
<P>subwindow записывается идентификатор дочернего окна. В противном случае в поле subwindow записывается значение None.</P>
<P>В поля х и у записываются координаты курсора в момент наступления события в системе координат окна-получателя. Если корневое окно окна-получателя и корневое окно источника события различны (находятся на разных экранах), то в эти поля записываются нулевые значения.</P>
<P>В поля xroot и yjoot записываются координаты курсора в момент наступления события в системе координат корневого окна.</P>
<P>В поле samescreen записывается значение True или False в зависимости от того, находится ли окно, которому адресовано событие, на одном экране с корневым окном окна-источника события.</P>
<P>В поле focus записывается значение True или False в зависимости от того, сфокусирован ли ввод клавиатуры в окно, которому адресовано событие или в одно из окон-потомков, или нет.</P>
<P>В поле state записывается информация о нажатых кнопках графического указателя и клавишах-модификаторах в момент наступления события. Значение state образуется с помощью операции побитового ИЛИ над следующими битовыми флагами, определенными в файле &lt;Х.h&gt;. Button1Mask, Button2Mask, Button3Mask, Button4Mask. ButtonSMask, ShiftMask. LockMask, ControlMask, Mod1Mask, Mod2Mask, Mod3Mask, Mod4Mask и ModSMask.</P>
<P>Поле mode служит для описания вида события: является ли оно &quot;истинным&quot;, было имитировано при активном захвате указьшающего устройства, или было имитировано при отмене активного захвата. <Term Type="Link">X-сервер</Term>, записывает в это поле одно из следующих значений, обозначающих, соответственно, все перечисленные ситуации: NotifyNormal, NotiiyGrab или NotiiyUngrab.</P>
<P>Поле detail описывает взаимное расположение в иерархии окна-получателя события, окна, которое покинул курсор, и окна, в которое попал курсор. В этом поле может быть записано одно из значений NotiiyAncestor, NotifyVirtual, Notifylnferior, Nolift Nonlinear или NotifyNonlinearVirtual.</P>
<P /></Modul>
