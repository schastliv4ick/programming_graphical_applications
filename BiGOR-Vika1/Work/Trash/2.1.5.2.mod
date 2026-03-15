<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="CGUP143Q654W0F5D1EPI" Author="Волосатова Т.М." Level="0" ADate="F8H103AG">
<Title>Опрос текущих атрибутов окна и его геометрических параметров</Title>
<P>Функции: XGetWindowAttributes(), XGetGeometry(); структура XWindowAttributes.</P>
<P>1). Синтаксис</P>
<P><Font B="Y">Status  XGetWindowAttributes (display,   w,   <Font>window_attributes_return</Font>) </Font></P>
<P><Font B="Y">Display  * display; </Font></P>
<P><Font B="Y">Window w;</Font></P>
<P><Font B="Y">XWindowAttributes   * window_attributes_return;</Font></P>
<P> <Font B="Y">Status  XGetGeometry (display,   d,   root_return,   x_return,  y_return,   <Font><Font U="Y"><Font>widthj-eturn</Font></Font></Font>, height return,   <Font U="Y">borderjwidthreturn</Font>,   depth return)</Font></P>
<P><Font B="Y">Display   * display;</Font> </P>
<P><Font B="Y">Drawable  d; </Font></P>
<P><Font B="Y">Window  *root_return; int   *x return,    *y_return; unsigned int   *width return,   * height return; unsigned int   * border_width_return; unsigned   int   *deptk_return;</Font></P>
<P /><P>2). Аргументы</P>
<P>display           Задает соединение с Х-сервером.</P>
<P>w                   Окно, текущие атрибуты которого опрашиваются.</P>
<P>window attributes return - Возвращаемые атрибуты указанного окна в структуре типа XWindowAttributes.</P>
<P>d                    Задает область рисования (drawable), т.е. окно или пиксельную карту.</P>
<P>rootreturn     Возвращаемый идентификатор корневого окна.</P>
<P>xreturn, у return Возвращаемые координаты х и у, задающие положение области рисования. В случае окна эти координаты задают положение его левого верхнего внешнего угла относительно начала координат родительского окна. В случае пиксельной карты эти координаты всегда нулевые.</P>
<P>width_return, heightreturn Возвращаемые размеры (ширина и высота) области рисования.</P>
<P>border width return Возвращаемая толщина рамки в пикселах.</P>
<P>depth return   Возвращаемая глубина области рисования (число бит на пиксел).</P>
<P /><P>3). Описание</P>
<P>Функция XGetWindowAttributesO возвращает текущие атрибуты указанного окна в структуре типа XWindow Attributes.</P>
<P>При отработке функции XGetWindowAttributesQ могут возникать ошибки BadDrawable и Bad Window</P>
<P>Функция XGetGeometryO возвращает идентификатор корневого окна и текущие геометрические параметры области рисования. Геометрические параметры области рисования включают координаты х и у, ширину и высоту, толщину рамки и глубину. Все они задаются в списке аргументов. Допустимо передавать этой функции идентификатор окна класса InputOnly.</P>
<P>При отработке функции XGetGeometryO может возникать ошибка BadDrawable.</P>
<P /><P>4). Структуры</P>
<P>Структура типа XWindow Attributes определена следующим образом:</P>
<P><Font B="Y">typedef  struct   { int  x,   у;</Font></P>
<P><Font B="Y">int  width,   height; int  border_width; int  depth;</Font></P>
<P><Font B="Y">Window  root;</Font></P>
<P><Font B="Y">int  class;</Font></P>
<P><Font B="Y">int   bit_gravity;</Font></P>
<P><Font B="Y">int  win_gravity;</Font></P>
<P><Font B="Y">int backingstore;</Font></P>
<P><Font B="Y">unsigned  long backing pi;</Font></P>
<P><Font B="Y">unsigned long backing_pi;</Font></P>
<P><Font B="Y">Bool   save_under;</Font></P>
<P><Font B="Y">Colormap   colormap;</Font>      /*   т. Bool map_installed;</P>
<P>/*  положение  о. /*  ширина и  BI /*  толщина  pa /*  глубина  ок /*   кодировка /*  идентифика /*  класс  окна   (InputOutput  или  InputOnly)</P>
<P>гравитация окна  в родительски NotUseful,   WhenMapped,   Always</P>
<P>Сохранять  ли  подложку? тов,   ассоциированная  с  окном Загружена ли  таблица  цветов?</P>
<P>long  do  not propagate ma Bool  override  redirect;</P>
<P>(XWindowAttribute</P>
<P>Поля width и height содержат внутренние размеры окна (без рамки). Поле border width содержит толщину рамки в пикселах. Поле depth содержит глубину окна (в битах на пиксел).</P>
<P> маска  событий енная маска  событий редаваемых  событий  менеджер  оконФункций библиотеки Xlib системы X Window</P>
<P>Поле visual является указателем на структуру типа Visual, ассоциированную с экраном.</P>
<P>Поле root содержит идентификатор корневого окна экрана, на котором располагается указанное окно.</P>
<P>Поле class содержит класс окна и может иметь значение InputOutput или InputOnly.</P>
<P>В поле bit_gravity задается гравитация окна (т.е. характер смещения содержимого окна после изменения его размера); в это поле может быть записана одна из следующих величин:</P>
<P>ForgetGravity           NorthEastGravity     EastGravity              SouthEastGravity</P>
<P>NorthWestGravity    WestGravity             SouthWestGravity    StaticGravity</P>
<P>NorthGravity            CenterGravity          SouthGravity</P>
<P>В поле <Font U="Y">winjp-avity</Font> задается гравитация окна в родительском (т.е. характер смещения окна после изменения размера родительского окна); в это поле может быть записана одна из следующих величин:</P>
<P>UnmapGravity         NorthEastGravity     EastGravity              SouthEastGravity</P>
<P>NorthWestGravity   WestGravity             SouthWestGravity    StaticGravity</P>
<P>NorthGravity            CenterGravity          SouthGravity</P>
<P>В поле backingstore записаны условия, при которых Х-сервер должен сохранять содержимое окна; в это поле может быть записана одна из следующих величин: WhenMapped, Always или NotUseful.</P>
<P>Поле backing_planes имеет значение, показывающее (в виде взведенных битов), какие битовые плоскости окна следует учитывать при сохранении содержимого окна (при использовании режимов, определяемых атрибутами backingstore и saveunder).</P>
<P>Поле backing_pixel содержит значение пиксела, используемого при восстановлении содержимого окна; сначала восстанавливаются биты, заданные в backing_planes, а недостающие извлекаются из backing_pixel.</P>
<P>В поле save under записано значение True или False.</P>
<P>Поле colormap содержит идентификатор таблицы цветов для указанного окна либо None.</P>
<P>Поле тар installed показывает, загружена ли в текущий момент таблица цветов, и может иметь значение True или False.</P>
<P>Поле mapstate показывает состояние окна и может иметь значение IsUnmapped, IsUnviewable или IsViewable. Значение IsUnviewable означает, что окно высвечено, но какое-то из его окон-предков не высвечено.</P>
<P>Поле all event masks содержит результат побитовой операции ИЛИ над всеми масками событий, заданными всеми клиентами для данного окна.</P>
<P>Поле your event mask содержит результат побитовой операции ИЛИ над всеми масками событий, заданными запрашивающим клиентом.</P>
<P>Поле do_not_propagate_mask содержит результат побитовой операции ИЛИ над множеством событий, которые не должны передаваться родительскому окну.</P>
<P>В поле override redirect может храниться значение False (по умолчанию) или True. Значение False означает, что запросы на высвечивание, перемещение и изменение размеров окна могут отрабатываться менеджером окон, значение True означает, что такие запросы менеджер окон отрабатывать не должен.</P>
<P>Поле screen содержит указатель на структуру типа Screen, описывающую экран, на котором располагается данное окно. Это облегчает получение экранной информации без циклического прохода по полям корневого окна с целью поиска подходящего поля.</P>
<P /><P>5). Сообщения об ошибках</P>
<P>BadDrawable</P>
<P>Значение аргумента типа Drawable не является идентификатором существующего окна или пиксельной карты.</P>
<P>BadWindow  Значение аргумента типа Window не является идентификатором существующего</P>
</Modul>
