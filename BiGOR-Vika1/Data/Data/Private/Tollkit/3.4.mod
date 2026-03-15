<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="9SI47D9YSXBAPKWGU7DE" Author="Полякова В.Г." Level="0" ADate="EUH0GYXN">
<Title>Xt и ресурсы программ.</Title>
<SubTitle>Формат файла описания ресурсов.</SubTitle>
<P>Kогда программист работает с Xt, то возникает вопрос, как конкретно определяется значение того или иного параметра widget. Делается это следующим образом. Пусть объект с именем WnameN и класса WclassN имеет родителей с именами WnameN-1, . . . , Wname1 и принадлежащих классу WclassN-1&quot;, . . . , Wclass1 соответственно, причем Wname1 &#x2014; корень дерева widget программы. Тогда, чтобы задать значение его атрибута XtNA в ресурсном файле должна быть строка:</P>

<Listing>
<L>&lt;имя программы&gt;. &quot;Wname1&quot;.  . . .  . &quot;WnameN&quot;.A : &lt;значение&gt;</L>
</Listing>
<P>Например, пусть в программе с именем &quot;justas&quot; объект &quot;dialogBox&quot; принадлежит классу <Term Type="In">TopLevelShell</Term> и имеет два родительских widget core класса Core и appShell класса <Term Type="In">ApplicationShell</Term>. Тогда значение его атрибута XtNheight (высота окна) равное 100 можно задать так:</P>

<Listing>
<L>justas.appShell.core.dialogBox.height : 100</L>
</Listing>
<P>Вместо имени любого объекта иерархии можно указать его класс. В этом случае значение ресурса будет распространяться на все объекты, у которых в иерархии на соответствующем месте стоит widget указанного класса . Так, например, если структура иерархии объектов программы такая, как указано на рисунке 1, то строки</P>

<Listing>
<L>justas.appShell.core1.dialogBox.height : 100</L>
<L>justas.appShell.core2.dialogBox.height : 200</L>
</Listing>
<P>означают, что widget с именем dialogBox и родителем core1 имеет высоту 100. А widget с именем dialogBox и родительским widget core2 имеет высоту 200. Строка же</P>

<Listing>
<L>justas.appShell.Core.dialogBox.height : 200</L>
</Listing>
<P>говорит, что для обоих объектов высота равна 200. В строке, задающей ресурс, можно употреблять символ `*&apos; .</P>
<SubTitle>Создание базы данных ресурсов программы.</SubTitle>
<P>Загрузка ресурсов производится инициализационными процедурами, например XtAppInitialize(), которые конструируют базу данных из различных ресурсных файлов, опций командной строки и других источников. Ниже описывается последовательность шагов Xt, выполняемая при поиске и загрузке ресурсов. Если встречаются две одинаковые спецификации какого-то ресурса widget, то будет использована первая встретившаяся (данная последовательность шагов принята в версии X11R5, в X11R4 поиск и загрузка ресурсов выполняется в обратном порядке).</P>
<P>Первый шаг. Загрузка ресурсов из командной строки. Xt поддерживает стандартное множество опций, комбинации которых могут указываться в командной строке при запуске программы. Они перечислены в таблице, приведенной ниже.</P>

<Table Col="4" ID="EULEKYTC" TTop="Y" Center="Y">
<P>Опция</P>
<P>Имя ресурса</P>
<P>Тип</P>
<P>Описание и примеры</P>
<P>-bg (-background)</P>
<P>*background</P>
<P>String</P>
<P>цвет фона (-bg blue, -background white )</P>
<P>-bd (-bordercolor)</P>
<P>*borderColor</P>
<P>String</P>
<P>цвет границы (-bg black, -bordercolor red )</P>
<P>-bw (-borderwidth)</P>
<P>.borderwidth</P>
<P>Integer</P>
<P>ширина края окна в пикселах (-bw2 )</P>
<P>-display</P>
<P>.display</P>
<P>String</P>
<P>дисплей для связи с сервером (-display odessa: 0 )</P>
<P>-fg (-foreground)</P>
<P>*foreground</P>
<P>String</P>
<P>цвет переднего плана (-fg red, -foreground black)</P>
<P>-fn (-font)</P>
<P>*font</P>
<P>String</P>
<P>имя шрифта (-fn 9x15, -font 9x15)</P>
<P>-geometry</P>
<P>.geometry</P>
<P>String</P>
<P>размер и положение окна (-geometry = 80x24)</P>
<P>-iconic</P>
<P>.iconic</P>
<P>None</P>
<P>если значение опции &quot;on&quot;, то окно программы будет показано в минимизированном виде.</P>
<P>-name</P>
<P>.name</P>
<P>String</P>
<P>имя программы (-name Justas)</P>
<P>-reverse (-rv)</P>
<P>*reverseVideo</P>
<P>None</P>
<P>если значение ресурса &quot;on&quot;, то выводимое изображение появится в инверсном виде</P>
<P>+rv</P>
<P>*reverseVideo</P>
<P>None</P>
<P>изображение будет нормальным</P>
<P>-title</P>
<P>.title</P>
<P>String</P>
<P>заголовок окна программы (-title Justas)</P>
<P>-xrm</P>
<P>значение аргумента</P>
<P>String</P>
<P>ресурс и его значение задаются аргументом опции -xrm &quot;*.height: 100&quot;</P>
</Table>
<P>В данной таблице точка, предшествующая имени ресурса, означает, что опции могут быть использованы для установки ресурса только в widget, принадлежащих классу TopLevelShell или его подклассу. В свою очередь, &quot;*&quot; означает, что ресурс может быть установлен для произвольного widget приложения.</P>
<P>Инициализационные процедуры понимают также любую уникальную аббревиатуру предопределенных опций, например:</P>

<Listing>
<L>justas  -back  green</L>
</Listing>
<P>Xt предоставляет также возможность передавать в командной строке нестандартные опции. Для того, чтобы определить их и получить соответствующие значения, используются третий и четвертый аргументы процедуры XtAppInitialize( ) (XtVaAppInitialize( ), <Term Type="In">XtInitialize</Term>( )).</P>
<P>Ниже приведен фрагмент кода и пример командной строки, иллюстрирующие описанный выше механизм получения значений ресурсов.</P>

<Listing>
<L /><L>. . . . . . .</L>
<L>static XrmOptionDescRec arCommandOptions [ ] = {</L>
<L>   { &quot;-delay&quot;, &quot;*delay&quot;,  XrmoptionSepArg, NULL },</L>
<L>   { &quot;-debug&quot;, &quot;*debug&quot;, XrmoptionNoArg, &quot;True&quot; },</L>
<L>} ;</L>
<L>. . . . . . .</L>
<L>main (int argc, char  **argv)</L>
<L>{</L>
<L>    Widget prWidget;</L>
<L>    . . . . . . .</L>
<L>    prWidget = XtInitialize (argv [0], &quot;Justas&quot;, arCommandOptions,XtNumber (arCommandOptions), &amp;argc, argv);</L>
<L>    . . . . . . .</L>
<L>}</L>
</Listing>
<P>Пример командной строки:</P>

<Listing>
<L>justas  -debug  -delay  15</L>
</Listing>
<P>Отметим также, что если имя опции, данное пользователем, совпадает с предопределенной стандартной опцией, то из значений, указанных в командной строке, будут использоваться лишь ресурсы, соответствующие стандартным опциям.</P>
<P>Второй шаг. Загружается файл, на который указывает переменная среды XENVIRONMENT (если таковая задана). Данная переменная содержит полный путь к файлу, включая и его имя. Если же переменная XENVIRONMENT не установлена, то менеджер ресурсов будет пытаться подгрузить файл .Xdefaults-&lt;hostname&gt;, находящийся в домашней (home) директории пользователя. Здесь &lt;hostname&gt; &#x2014; это имя компьютера, на котором происходит запуск программы.</P>
<P>Третий шаг. Если корневое окно (root window) экрана имеет ресурсы, загруженные в свойство RESOURSE_MANAGER (RESOURSE_MANAGER property) программой xrdb, то они также добавляются в базу данных ресурсов приложения. Если же &quot;корневое&quot; окно не имеет такого свойства, то подгружаются данные, определенные в файле .Xdefaults, находящемся в домашней (home) директории пользователя.</P>
<P>Четвертый шаг. Если задана переменная среды XAPPLRESDIR, то менеджер ресурсов будет пытаться загрузить ресурсный файл с именем &lt;$XAPPLRESDIR&gt; / &lt;classname&gt;, где &lt;classname&gt; имя класса программы. Если файла нет, Xt пытается прочитать другой файл с именем &lt;$APPLRESDIR&gt; / &lt;$LANG&gt; / &lt;classname&gt; ( здесь LANG &#x2014; переменная среды, задающая язык системы). Если переменная XAPPLRESDIR не установлена, то соответствующие файлы ищутся в домашней (home) директории. Отметим, что в системе могут быть предусмотрены и некоторые другие переменные среды, позволяющие задать путь к файлу ресурсов (например, XUSERFILESEARCHPATH и др.), но для целей данного издания приведенной информации достаточно.</P>
<P>Пятый шаг. Xt ищет следующий файл:</P>

<Listing>
<L>&quot;/usr/lib/X11/app-derfaults/&lt;classname&gt;&quot;</L>
</Listing>
<P>Если этот файл существует, он загружается в базу данных ресурсов .</P>
<P>Шестой шаг. Рассматриваются параметры, переданные с помощью пятого и шестого аргументов инициализационных процедур. Данная возможность может быть использована в случае, если значение какого-либо ресурса осталось неопределенным. Передаваемые через параметры процедур значения ресурсов представляются в виде массива указателей на строки. Каждая строка имеет вид: &lt;описание ресурса&gt; : &lt;значение ресурса&gt;. Здесь &lt;описание ресурса&gt; такое же, как и в ресурсном файле. Ниже приведен пример этого способа определения параметров программы.</P>

<Listing>
<L /><L>#include &lt;X11/Intrinsic.h&gt;</L>
<L>#include &lt;X11/StringDefs.h&gt;</L>
<L>extern void DrawHellowString( );</L>
<L>void main (int argc, char  **argv)</L>
<L>{</L>
<L>    Widget  topLevel, fallback;</L>
<L>     XtAppContext  prAppContext;</L>
<L>     static String Fallback [ ] = {</L>
<L>         &quot;fallback*background : blue&quot;,</L>
<L>         &quot;fallback.Core.width   : 200&quot;,</L>
<L>         &quot;fallback.Core.height  : 200&quot;,</L>
<L>         NULL,</L>
<L>     } ;</L>
<L>     topLevel = XtVaAppInitialize (&amp;prAppContext, &quot;Fallback&quot;, NULL, 0, &amp;argc, argv, Fallback, NULL);</L>
<L>     fallback = XtCreateManagedWidget (&quot;Core&quot;, widgetClass,topLevel, NULL, 0);</L>
<L>     XtAddEventHandler (fallback, ExposureMask, False, DrawHellowString, NULL);</L>
<L>     XtRealizeWidget (topLevel);</L>
<L>     XtAppmainLoop (prAppContext);</L>
<L>}</L>
<L>void DrawHellowString (Widget prWidget, XtPointer pData, XEvent  *prEvent, Boolean  *pbContinue)</L>
<L>{</L>
<L>    Display *prDisplay = XtDisplay (prWidget);</L>
<L>    Window  nWindow   = XtWindow (prWidget);</L>
<L>    GC  prGC;</L>
<L>    if (prEvent-&gt;type == Expose)</L>
<L>    {</L>
<L>        prGC = XCreateGC (prDisplay, nWindow, 0, NULL);</L>
<L>        XDrawString (prDisplay, nWindow, prGC, 10, 50,</L>
<L>         &quot;Hellow, world!&quot;, strlen (&quot;Hellow, world!&quot;) );</L>
<L>        XFreeGC (prDisplay, prGC);</L>
<L>     }</L>
<L>}</L>
</Listing>
<SubTitle>Получение ресурсов программы.</SubTitle>
<P>Для получения ресурсов приложения из базы данных, в Xt предусмотрена процедура</P>

<Listing>
<L>void XtGetApplicationResources (Widget, prWidget,XtPointer pBase, XtResourseList prResources,</L>
<L>    Cardinal nItem, ArgList prArgs, Cardinal nArgs);</L>
</Listing>
<P>Здесь prWidget задает некоторый объект приложения. По нему определяется имя и класс программы. Второй аргумент &#x2014; это адрес области памяти, где будут размещены получаемые значения ресурсов. Третий и четвертый аргументы задают <Term Sp="GNV7ZB1PXH9TJCKWQ04X" Type="Link">массив</Term> и число структур типа XtResource, определяющих нужные ресурсы. Последние аргументы prArgs и nArgs используются для того, чтобы запретить модификацию некоторых ресурсов пользователем. Если ресурс присутствует в <Term Sp="ru.bmstu.rk6-BD" Type="Link">базе данных</Term> программы и в списке prArgs, то его значение берется из списка.</P>
<P>Структура XtResource имеет следующее определение:</P>

<Listing>
<L /><L>typedef struct  {</L>
<L>     String    resource_name;</L>
<L>     String    resource_class;</L>
<L>     String    resource_type;</L>
<L>     Cardinal  resource_size;</L>
<L>     Cardinal  resource_offset;</L>
<L>     String    default_type;</L>
<L>     XtPointer default_addr;</L>
<L>}  XtResource, *XtResourceList;</L>
<L /></Listing>
<P>Здесь resource_name &#x2014; Имя ресурса. Где это возможно, для указания имени ресурса следует использовать константы, определенные в файле StringDefs.h. Например XtNforeground, XtNbackground и т.д.</P>
<P>resource_class &#x2014; Задает класс ресурса. Для многих классов его имя совпадает с именем ресурса, за исключением того, что используется префикс XtC, и первая буква имени класса &#x2014; заглавная (например для ресурса XtNforeground соответствующий класс XtCForeground).</P>
<P>resource_type &#x2014; Определяет тип ресурса. Можно задавать произвольный тип данных, включая и любой тип, определенный программой. Определения общих типов ресурсов даны в файле StringDefs.h. Для удобства тип ресурса состоит из имени с префиксом XtR. Если в системе зарегистрирована соответствующая процедура-конвертор , то при вызове XtGetApplicationResources( ) Xt преобразует значение ресурса из базы данных (строку) к типу, задаваемому полем resource_type.</P>
<P>resource_size &#x2014; Задает размер ресурса в байтах.</P>
<P>resource_offset &#x2014; Определяет смещение от адреса, задаваемого параметром pBase процедуры XtGetApplicationResources( ), начиная с которого размещается значение ресурса, вынимаемое из базы данных.</P>
<P>default_type &#x2014; Задает для ресурса тип значения, принимаемый по умолчанию.</P>
<P>default_addr &#x2014; Задает (или указывает на) значения ресурса по умолчанию. Оно используется Xt, если на ресурс нет ссылок в базе данных программы.</P>
<P>В Xt предусмотрены два специальных типа ресурсов, которые используют только значения по умолчанию, задаваемые полями default_type и default_addr. Первый &#x2014; XtRImmediate, который указывает, что значение ресурса не надо искать в базе, поскольку оно определяется непосредственно полем default_addr. Второй &#x2014; XtRCallProc, который указывает, что значение, заданное в поле default_addr, это указатель на процедуру, которая возвращает значение ресурса. Эта функция должна иметь прототип:</P>

<Listing>
<L>void ResourceDefaultProc (Widget prWidget,int nOffset, XrmValue *prValue);</L>
</Listing>
<P>Здесь prWidget задает объект, ресурс которого должен быть получен. nOffset задает местоположение ресурса в структуре <Term Type="In">widget</Term>. prValue определяет адрес для сохранения полученного значения. Xt автоматически определяет нужные параметры и вызывает данную процедуру, сохраняя в prValue полученное значение.</P>
<P>В следующей таблице приведены основные типы ресурсов, принятые в Xt, соответствующие им типы данных и/или пояснения.</P>

<Table Col="2" ID="EUH8DDEA" Center="Y" TTop="Y">
<P>Тип ресурса</P>
<P>Тип данных</P>
<P>XtRAcceleratorTable</P>
<P>XtRAccelerators (&quot;таблица&quot; акселератов)</P>
<P>XtRAtom</P>
<P>Atom</P>
<P>XtRBitmap</P>
<P>Pixmap</P>
<P>XtRBoolean</P>
<P>Boolean</P>
<P>XtRBool</P>
<P>Bool</P>
<P>XtRCallback</P>
<P>XtCallbackList (список callback-процедур)</P>
<P>XtRCallProc</P>
<P>- &#x2014; &#x2014; &quot; &#x2014; &#x2014; -</P>
<P>XtRCardinal</P>
<P>Cardinal</P>
<P>XtRColor</P>
<P>XColor</P>
<P>XtRColormap</P>
<P><Term Type="In">Colormap</Term></P>
<P>XtRCursor</P>
<P>Cursor</P>
<P>XtRDimension</P>
<P>Dimension</P>
<P>XtRDisplay</P>
<P>Display</P>
<P>XtREnum</P>
<P>XtEnum</P>
<P>XtRFile</P>
<P>File *</P>
<P>XtRFloat</P>
<P>float</P>
<P>XtRFont</P>
<P>Font</P>
<P>XtRFontStruct</P>
<P>XFontStruct *</P>
<P>XtRFunction</P>
<P>(*) ( )</P>
<P>XtRGeometry</P>
<P>String</P>
<P>XtRImmediate</P>
<P>см. выше</P>
<P>XtRInitialState</P>
<P>int</P>
<P>XtRInt</P>
<P>int</P>
<P>XtRLongBoolean</P>
<P>long</P>
<P>XtRObject</P>
<P>Object</P>
<P>XtRPixel</P>
<P>Pixel</P>
<P>XtRPixmap</P>
<P>Pixmap</P>
<P>XtRPointer</P>
<P>XtPointer</P>
<P>XtRPosition</P>
<P>Position</P>
<P>XtRScreen</P>
<P>Screen *</P>
<P>XtRShort</P>
<P>short</P>
<P>XtRString</P>
<P>char *</P>
<P>XtRStringArray</P>
<P>String *</P>
<P>XtRStringTable</P>
<P>char **</P>
<P>XtRTranslationTable</P>
<P>XtRTranslations (&quot;таблица соответствия&quot;)</P>
<P>XtRUnsignedChar</P>
<P>unsigned char</P>
<P>XtRVisual</P>
<P>Visual *</P>
<P>XtRWidget</P>
<P>Widget</P>
<P>XtRWidgetClass</P>
<P>WidgetClass</P>
<P>XtRWidgetList</P>
<P>WidgetList</P>
<P>XtRWindow</P>
<P>Window</P>
</Table>
<P>Ниже приводится пример использования описанного выше механизма получения ресурсов приложения.</P>

<Listing>
<L /><L>#include &lt;stdio.h&gt;</L>
<L>#include &lt;X11/Intrinsic.h&gt;</L>
<L>#include &lt;X11/StringDefs.h&gt;</L>
<L>typedef  struct</L>
<L>      Pixel    pColor;</L>
<L>      int      nLine;</L>
<L>      Boolean  bFlag;</L>
<L>} trAppData, *prAppData;</L>
<L>static XtResource prResources[ ] = {</L>
<L>   { XtNbackground, XtCBackground, XtRPixel, sizeof (Pixel), XtOffset (prAppData, pColor), XtRString, &quot;Green&quot;),</L>
<L>   { &quot;line&quot;, &quot;Line&quot;, XtRInt, sizeof (int), XtOffset (prAppData, nLine), XtRImmediate, (XtPointer) 20),</L>
<L>   { &quot;flag&quot;, &quot;Flag&quot;, XtRBoolean, sizeof (Boolean),XtOffset (prAppData, bFlag), XtRImmediate, (XtPointer) True)</L>
<L>} ;</L>
<L>void main (int argc, char **argv)</L>
<L>{</L>
<L>   Widget   topLevel, core;</L>
<L>   trAppData    rData;</L>
<L>   XtAppContext  prAppContext;</L>
<L>   memset (&amp;rData, 0, sizeof (trAppData));</L>
<L>   topLevel = XtVaAppInitialize (&amp;prAppContext, &quot;Justas&quot;, NULL, 0, &amp;argc, argv, NULL, NULL);</L>
<L>   XtGetApplicationResources (topLevel, &amp;rData, prResources, 3, NULL, 0);</L>
<L>   printf (&quot;background = %d, Line = %d, Flag = %d\n&quot;, rData.pColor, rData.nLine, rData.bFlag);</L>
<L>   core = XtVaCreateManagedWidget (&quot;core&quot;, widgetClass, topLevel, XtNwidth, 300, XtNheight, 300, NULL);</L>
<L>   XtRealizeWidget (topLevel);</L>
<L>   XtAppMainLoop (prAppContext);</L>
<L>}</L>
</Listing>
<P>В программе используется макрос XtOffset( ), который позволяет определить смещение в байтах от начала структуры до заданного поля. Определение макроса находится в файле &quot;Intrinsic.h&quot;. Формат его выглядит следующим образом:</P>

<Listing>
<L>Cardinal XtOffset (Type type, Field field);</L>
</Listing>
<P>Здесь первый аргумент &#x2014; тип указателя, специфицирующего структуру данных пользователя, второй аргумент &#x2014; имя устанавливаемого ресурса (поле) в данной структуре.</P>
<SubTitle>Процедуры, преобразующие значения ресурсов от одного типа к другому (&quot;конвертеры&quot;).</SubTitle>
<P>Значения параметров в файлах ресурсов представляются в виде строк. Перед использованием в программе, их надо преобразовать к требуемому типу. Так, например, значение атрибута XtNwidth задается строкой &quot;100&quot;, но должно быть превращено в целое число. Для этого Xt и программы регистрируют специальные процедуры, преобразующие значения из одной формы представления в другую (т.е. из одного типа в другой). Их называют конвертеры (converter) (также мы будем употреблять термины процедура-конверто и преобразователь).</P>
<P>Механизм использования конвертеров следующий. Когда программа получает ресурс с помощью XtGetApplicationResources() или создает widget, обращаясь к XtCreateWidget( ) или аналогичной процедуре, Xt достает значение ресурса из базы данных. Это значение представлено в виде строки. Xt знает тип атрибута (обозначим его T) и ищет зарегистрированный &quot;конвертер&quot; &quot;строка T&quot;. Если таковой есть, то он вызывается и значение ресурса переводится в требуемую форму. Если же конвертера нет, параметр получает значение по умолчанию.</P>
<P>Мы описали работу преобразователя строка произвольный тип. Однако можно создать и зарегистрировать конвертер произвольный тип произвольный тип и использовать его для своих нужд.</P>
<P>Ниже, в таблице, приведены преобразования типов данных, поддерживаемые самой Xt.</P>

<Table Col="3" ID="EUH8VEYU" Center="Y" TTop="Y">
<P>Откуда</P>
<P>Куда</P>
<P>Описание</P>
<P>XtRString</P>
<P>XtRAcceleratorTable</P>
<P>преобразует строку, задающую &quot;таблицу&quot; акселераторов во внутреннюю форму Xt</P>
<P>XtRString</P>
<P>XtRAtom</P>
<P>преобразует строку, содержащую имя &quot;свойства&quot;, в соответствующий атом</P>
<P>XtRString</P>
<P>XtRBoolean</P>
<P>конвертирует строки &quot;True&quot;, &quot;False&quot;, &quot;yes&quot;, &quot;no&quot;, &quot;on&quot;, &quot;off&quot; в соответствующее логическое значение</P>
<P>XtRString</P>
<P>XtRBool</P>
<P>аналогично предыдущему</P>
<P>XtRString</P>
<P>XtRCursor</P>
<P>преобразует стандартное название курсора для X WINDOW в соответствующий идентификатор</P>
<P>XtRString</P>
<P>XtRDimension</P>
<P>конвертирует ширину и высоту к типу Dimension</P>
<P>XtRString</P>
<P>XtRDisplay</P>
<P>преобразует имя дисплея и возвращает указатель на структуру типа Display</P>
<P>XtRString</P>
<P>XtRFile</P>
<P>преобразует имя файла и возвращает его дескриптор</P>
<P>XtRString</P>
<P>XtRFloat</P>
<P>конвертирует строку, задающую число, в формат float</P>
<P>XtRString</P>
<P>XtRFont</P>
<P>преобразует имя шрифта и возвращает его идентификатор</P>
<P>XtRString</P>
<P>XtRFontStruct</P>
<P>преобразует имя шрифта и возвращает указатель на структуру типа XFontStruct</P>
<P>XtRString</P>
<P>XtRInitialState</P>
<P>конвертирует строки &quot;Normal&quot; или &quot;Iconic&quot; в символы NormalState или IconicState соответственно</P>
<P>XtRString</P>
<P>XtRInt</P>
<P>конвертирует строку, содержащую число, в формат int</P>
<P>XtRString</P>
<P>XtRPixel</P>
<P>преобразует строку содержащую имя цвета (например, black или #FF0000), в значение пиксела</P>
<P>XtRString</P>
<P>XtRPosition</P>
<P>преобразует значения x и y координат к типу Position</P>
<P>XtRString</P>
<P>XtRShort</P>
<P>конвертирует строку, содержащую число, в форму short</P>
<P>XtRString</P>
<P>XtRTranslationTable</P>
<P>преобразует строку, задающую &quot;таблицу трансляции&quot;, во внутреннюю форму Xt</P>
<P>XtRString</P>
<P>tRUnsignedChar</P>
<P>конвертирует строку, содержащую число, в форму unsigned char</P>
<P>XtRString</P>
<P>XtRVisual</P>
<P>преобразует строку, задающую тип палитры, и возвращает указатель на структуру типа Visual</P>
<P>XtRPixel</P>
<P>XtRColor</P>
<P>конвертирует значение пиксела в указатель на структуру типа XColor</P>
<P>XtRInt</P>
<P>XtRBool</P>
<P>конвертирует целое в логическое</P>
<P>XtRInt</P>
<P>XtRColor</P>
<P>конвертирует целое в XColor</P>
<P>XtRInt</P>
<P>XtRDimension</P>
<P>конвертирует целое в Dimension</P>
<P>XtRInt</P>
<P>XtRFloat</P>
<P>конвертирует целое в плавающее</P>
<P>XtRInt</P>
<P>XtRFont</P>
<P>конвертирует целое в Font</P>
<P>XtRInt</P>
<P>XtRPixe</P>
<P>конвертирует целое в значение пиксела</P>
<P>XtRInt</P>
<P>XtRPixmap</P>
<P>конвертирует целое в Pixmap</P>
<P>XtRInt</P>
<P>XtRPosition</P>
<P>конвертирует целое в Position</P>
<P>XtRInt</P>
<P>XtRShort</P>
<P>конвертирует целое в short</P>
<P>XtRInt</P>
<P>XtRUnsignedChar</P>
<P>конвертирует целое в беззнаковое целое</P>
</Table>
<P>Процедура-конвертор должна иметь следующий прототип:</P>

<Listing>
<L /><L>void ConverterProc (XrmValue  *prArgs, Cardinal  *nArgs, XrmValue  *prFromVal, XrmValue  *prToVal);</L>
</Listing>
<P>Здесь аргументы prArgs, prFromVal, prToVal &#x2014; это указатели на структуры типа XrmValue .</P>
<P>Процедура-конвертор должна преобразовывать данные из структуры prFromVal и результат помещать в структуру prToVal. Любые дополнительные данные, требующиеся при конвертации, передаются через аргументы prArgs и nArgs.</P>
<P>До того, как менеджер ресурсов сможет использовать указанную процедуру-конвертор, последняя должна быть зарегистрирована. Для этого можно использовать одну из функций XtAddConverter( ), XtAppAddConverter( ) или XtSetTypeConverter( ). В коде программы &quot;конвертор&quot; должен быть зарегистрирован после инициализации Xt, но до обращения к XtGetApplicationResources( ).</P>
<P>Процедура XtAddConverter( ) имеет следующий прототип:</P>

<Listing>
<L /><L>void XtAddConverter (String prFromType, String psToType, XtConverter pConverter, XtConvertArgList prConvArgs,</L>
<L>                     Cardinal nNumArgs);</L>
</Listing>
<P>Первый и второй аргументы процедуры &#x2014; это строки, задающие соответственно типы, из которого и в который надо преобразовывать. Это должны быть стандартные имена типов данных, определенные в файле StringDefs.h, или имена, определенные в файле-заголовке программы. Третий аргумент задает непосредственно саму процедуру-конвертор. Четвертый и пятый аргументы задают дополнительные данные, которые передаются конвертору и используются им. При этом prConvArgs &#x2014; указатель на массив структур типа XtConvertArgRec, определяемых следующим образом:</P>

<Listing>
<L /><L>typedef struct  {</L>
<L>    XtAdddressMode  address_mode;</L>
<L>    XtPointer       address_id;</L>
<L>}  XtConvertArgRec,  *XtConvertArgList;</L>
</Listing>
<P>Здесь <Operator>address_mode</Operator> определяет, как следует интерпретировать поле address_id. Возможные значения для поля address_mode даются перечисляемым типом XtAdddressMode:</P>

<Listing>
<L /><L>typedef enum {</L>
<L>    XtAddress,          /*адрес                             */</L>
<L>    XtBaseOffset,       /* смещение                         */</L>
<L>    XtImmediate,        /* константа                        */</L>
<L>    XtResourceString,   /* строчное имя ресурса             */</L>
<L>    XtResourceQuark,    /* внутренняя форма задания ресурса */</L>
<L>    XtWidgetBaseOffset, /* смещение от &quot;родителя&quot;           */</L>
<L>    XtProcedureArg,     /* вызов процедуры                  */</L>
<L>} XtAddressMode;</L>
</Listing>
<P>Здесь</P>
<P>XtAddress указывает, что параметр address_id интерпретируется как адрес данных;</P>
<P>XtBaseOffset address_id интерпретируется как смещение относительно базового адреса widget;</P>
<P>XtImmediate  address_id &#x2014; константа;</P>
<P>XtResourceString  address_id интерпретируется как имя ресурса, которое будет преобразовано в смещение относительно базового адреса widget;</P>
<P>XtResourceQuark  address_id интерпретируется как имя ресурса, которое будет преобразовано во внутреннюю форму XtResourceString;</P>
<P>XtWidgetBaseOffset  аналогично XtBaseOffset, за исключением того, что смещение рассматривается относительно &quot;родителя&quot;, если последний не принадлежит подклассу класса <Term Type="In">Core</Term>;</P>
<P>XtProcedureArg  address_id интерпретируется как указатель на процедуру типа XtConvertArgProc, которая будет вызываться при завершении конвертации.</P>
<P>Процедура XtAppAddConverter( ) аналогична описанной выше процедуре, за исключением того, что добавлен еще один аргумент &#x2014; контекст приложения. Процедура XtSetTypeConverter( ) также аналогична описанной процедуре, давая при этом дополнительные возможности по более эффективному конвертированию значений ресурсов .</P>
<P>Ниже приведен пример процедуры-конвертора, позволяющий преобразовывать строку в длинное целое.</P>

<Listing>
<L /><L>Void CnvStringToLong (XrmValue  *prArgs, Cardinal  *pnNrgs, XrmValue  *prFromVal, XrmValue  *prToVal)</L>
<L>{</L>
<L>    static long nResult;      /* result variable */</L>
<L>    if (*pnArgs! = 0)</L>
<L>       XtWarning (&quot;String to Long conversion needs no extra arguments!&quot;);</L>
<L>    if (sscanf ( (char *) prFromVal-&gt;addr, &quot;%ld&quot;, &amp;nResult) = = 1)</L>
<L>    {</L>
<L>        prToVal-&gt;size = sizeof (long);</L>
<L>        prToVal-&gt;addr = (XtPointer) &amp;nResult;</L>
<L>    }</L>
<L>     else</L>
<L>         XtStringConversionWarning ( (char *) prFromVal-&gt;addr, XtRLong);</L>
<L>}</L>
</Listing>
<P>Данная процедура-конвертор использует функцию XtWarning( ) для печати предупреждающего сообщения, если число аргументов args больше нуля, для конвертирования строковой переменной в переменную типа long используется процедура sscanf( ). Результат работы данной процедуры сохраняется в структуре prToVal. Процедура XtStringConversionWarning( ) предназначена для выдачи предупреждающего сообщения при неуспешном завершении sscanf( ). Процедура имеет два аргумента типа String; первый &#x2014; строка, задающая данные конвертируемого типа, второй &#x2014; название типа данных, к которому не смогли быть преобразованы данные, определенные первым аргументом.</P>
<P>В заключении отметим следующее: в данном издании не освещаются некоторые аспекты работы с ресурсами, в частности, установка значений по умолчанию, описание подресурсов и методов работы с ними, и некоторые другие.</P>
</Modul>
