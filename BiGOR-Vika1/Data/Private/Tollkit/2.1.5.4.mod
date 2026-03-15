<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="COZRBXZ1CG7FG22KWEJZ" Author="Волосатова Т.М." Level="0" ADate="F8H0V186">
<Title>Уничтожение окон</Title>
<P>Функции: <Term Type="Link">XDestroyWindow</Term>(), <Term Type="Out" Sp="Cintro;XRHN6ZLN1XWOVGQ3I3VL;U6BYA6CQ2EZ8KVW8IA4M;GNV7ZB1PXH9TJCKWQ04X;8J2HI82P95AO672PPQ2O;ru.bmstu.rk6-BD;9J0HNYNMQDVXW24XBBO3-E;ru.bmstu.rk6-051312-08;rk6.bmstu.ru-CALS;rk6.bmstu.ru-Computers;rk6.bmstu.ru-ERP;rk6.bmstu.ru-Graphics;ru.bmstu.rk6-MU;ru.bmstu.rk6-nn;RXFJ6XXUKETK1QBZNIBA-E;ru.bmstu.rk6-051313-09;rk6.bmstu.ru-Optimization;SAP;ru.bmstu.rk6-051315-10;rk6.bmstu.ru-Web-Education;simulation;ru.bmstu.rk6-051316-05;ru.bmstu.rk6-051319-11;ru.bmstu.rk6-070010-13;ru.bmstu.rk6-051311-03">XDestroySubwindows</Term>().</P>
<P /><P><Font B="Y">XDestroyWindow (display,   w)</Font></P>
<P> <Font B="Y">XDestroySubwindows (display,   w)</Font></P>
<P><Font B="Y">Display  *display;</Font></P>
<P><Font B="Y">Window       w;</Font></P>
<P /><P>display           Задает соединение с Х-сервером.</P>
<P>w                   Задает окно.</P>
<P /><P>Функция XDestroyWindow() уничтожает указанное окно, а также (<Term Type="Link" Sp="*">рекурсивно</Term>) все его дочерние окна. При этом Х-сервер для каждого окна генерирует событие типа DestroyNotify. В дальнейшем на окно ссылаться нельзя. Если окно, заданное аргументом w, высвечено, то оно автоматически гасится. При уничтожении окна вначале генерируются события типа DestroyNotify для каждого из его дочерних окон, и лишь затем для него самого. В остальном порядок поступления событий типа DestroyNotify от родственных окон и окон различного иерархического подчинения не регламентируется. Если затребовано уничтожение корневого окна, то ни одно из окон не будет уничтожено. Уничтожение высвеченного окна вызывает генерацию событий типа Expose для тех окон, которые были загорожены уничтожаемым окном.</P>
<P>При отработке функции XDestroyWindow() может возникать ошибка BadWindow.</P>
<P>Функция XDestroySubwindows() рекурсивно уничтожает все дочерние окна указанного окна, снизу вверх в порядке следования их в <Term Type="Link" Sp="*">стеке</Term>. При этом для каждого окна Х-сервер генерирует событие типа DestroyNotify. Если любое из высвеченных дочерних окон фактически уничтожается, то для указанного окна <Term Type="Link" Sp="*">Х-сервер</Term> генерирует события типа Expose. Такой способ намного эффективнее, чем удаление большого числа окон по одному, т.к. большинство действий выполняется один раз для всех окон, а не для каждого окна в отдельности. На дочерние окна в дальнейшем ссылаться нельзя.</P>
<P /><P>При отработке функции XDestroySubwindows() может возникать ошибка BadWindow.</P>
</Modul>
