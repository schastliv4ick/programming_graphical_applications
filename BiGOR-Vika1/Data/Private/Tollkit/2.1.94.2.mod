<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="6Y069N3Z7V6G5ROZGYTI" Author="Волосатова Т.М." Level="0" ADate="F90Z1E1F">
<Title>Работа с внешними устройствами - клавиатура</Title>
<P>Клавиатура используется в большинстве программ, которые пишутся пользователями и для пользователей. В X Window, когда пользователь нажимает(отпускает) клавишу, <Term Type="Link" Sp="*">сервер</Term> получает соответствующий <Term Type="Link" Sp="*">сигнал</Term>, который преобразуется в событие и отправляется в <Term Type="Link" Sp="*">очередь</Term> программы, имеющей фокус ввода (input focus). </P>
<P /><P>Так как клавиатура обычно у машины одна, она разделяется между всеми одновременно выполняющимися программами. Сигнал поступающий от устройства доступен лишь одной из них, обычно, той, которой принадлежит активное окно. Под этим и стоит понимать, что программа и е&#x451; окно имеют фокус ввода. Последний может переходить от окна к окну и от программы к программе. </P>
<P /><P>Когда окно получает фокус, соответствующей программе посылается событие FocusIn, при потере - приходит событие FocusOut. </P>
<P /><P>Когда пользователь нажимает клавишу клавиатуры, программа получает событие KeyPress. Сервер также может послать событие KeyRelease, когда клавиша отпускается, но это справедливо не для всех типов компьютеров. </P>
<P /><P>Оба этих события сопровождаются структурой типа XKeyEvent. Ее поле keycode содержит код нажатой клавиши, а поле state - состояние клавиш-модификаторов и кнопок мыши. Модификаторами называются такие клавиши, как Shift, Ctrl, Caps Lock. Кроме этого, X предусматривает наличие дополнительных модификаторов, которые обозначаются Mod1, ..., Mod5. Каждой нажатой клавише-модификатору и кнопке мыши соответствует флаг в поле state. </P>
<P /><P>Коды, передаваемые через поле keycode структуры XKeyEvent, однозначно идентифицируют клавиши. Их конкретные значения зависят от типа машины и клавиатуры. Эти коды можно назвать физическими. Чтобы обеспечить <Term Type="Link" Sp="*">переносимость</Term> программ, сервер устанавливает соответствие между физическими кодами клавиш, которые могут меняться от компьютера к компьютеру, и <Term Type="Link" Sp="*">целочисленными константами</Term> - логическими кодами (символами). Они имеют предопределенные значения, которые приведены в файле /usr/include/X11/keysymdef.h и начинаются с префикса &quot;XK_&quot;. Так, букве &quot;a&quot; соответствует символ XK_a, клавише &lt;<Term Type="Link" Sp="*">Return</Term>&gt; (&lt;Enter&gt;) - символ XK_Return и т.д. </P>
<P /><P>Для разных алфавитов X поддерживает разные множества логических кодов. Возможные типы алфавитов перечисляются в файле /usr/include/X11/keysym.h. </P>
<P /><P>Одному коду клавиши может соответствовать несколько символов в зависимости от состояния клавиш-модификаторов. Функция </P>
<P /><P><Font B="Y">KeySym XKeycodeToKeysym (Display* display, KeyCode keycode, int index);</Font></P>
<P /><P>позволяет по коду keycode получить соответствующий ему символ с номером index. Если index равен 0, то полученный символ соответствует просто нажатой клавише. Если index равен 1, то возвращается символ,соответствующий ситуации, когда клавиша нажата одновременно с Shift. </P>
<P /><P>Функция XKeysymToKeycode() осуществляет обратное преобразование.</P>
<P /><P>Программа может получить карту соответствия кодов и символов, обратившись к функции XGetKeyboardMapping(). </P>
<P /><P>Изменяется соответствие физических и логических кодов функцией XChangeKeyboardMapping(). Следующая последовательность <Term Type="Link" Sp="*">операторов</Term> ставит клавише &lt;F2&gt; в соответствие символ XK_F3. </P>
<P /><P><Font B="Y">Keysym</Font></P>
<P><Font B="Y">F2sym, F3symbol;</Font></P>
<P><Font B="Y">int nF2Keycode;</Font></P>
<P><Font B="Y">Display <Font B="Y">*display;</Font></Font></P>
<P /><P><Font B="Y">F2symbol = XStringToKeysym (&quot;F2&quot;);</Font></P>
<P><Font B="Y">F3symbol = XStringToKeysym (&quot;F3&quot;);</Font></P>
<P><Font B="Y">nF2Keycode = XKeysymToKeycode (display, F2symbol);</Font></P>
<P><Font B="Y">XChangeKeyboardMapping (display, F2keycode, 1, &amp;F3symbol, 1);</Font></P>
<P /><P>Здесь использована функция XStringToKeysym(), которая по строке &quot;str&quot; возвращает соответствующий символ XK_str. </P>
<P /><P>Когда соответствие кодов меняется, всем работающим в настоящее время <Term Type="Link" Sp="*">клиентам</Term> посылается событие MappingNotify.</P>
<P /><P>Клавиши-модификаторы также имеют логические коды. Клавишам Shift сопоставлены символы XK_Shift_L и XK_Shift_R; Caps Lock соответствует XK_CapsLock; Control - XK_Control_L; Mod1 - XK_Meta_L и XK_Meta_R. Символы остальных модификаторов (Mod2 - Mod5) не определены. X содержит набор специальных функций, которые позволяют получить и установить соответствие код-символ для модификаторов. Эти функции следующие: XGetModifierMapping(), XInsertModifiermapEntry(), XDeleteModifiermapEntry(), XSetModifierMapping(). </P>
<P /><P>X не останавливается на задании соответствия код клавиши - символы, а идет дальше. Система позволяет программе сопоставить любой комбинации модификаторов и клавиш (например,&lt;Shift+Ctrl+A&gt;) ASCII строку (например, &quot;EXIT&quot;). Для некоторых клавиш соответствующие строки задаются сервером по умолчанию. Так, символу XK_A соответствует строка &quot;A&quot;. </P>
<P /><P>Макрос XRebindKeysym() берет символ, список модификаторов и сопоставляет им строку. </P>
<P /><P>Функция XLookupString(), наоборот, берет событие о нажатии (отпускании) клавиши и возвращает соответствующие ему символ и строку. Последний ее параметр - <Term Type="Link" Sp="*">указатель</Term> на структуру типа XComposeStatus. Дело в том, что некоторые клавиатуры имеют специальную клавишу Compose, которая позволяет печатать символы, которым нет соответствия среди клавиш. Специальная таблица указывает, какой символ должен быть создан, если обычна клавиша нажимается одновременно с Compose. Ссылка на эту информацию и возвращается в структуре XComposeStatus. </P>
<P /><P>Ниже приводится фрагмент программы, которая распознает функциональные клавиши &lt;F1&gt;-&lt;F5&gt;, и при их нажатии печатает соответствующую строку. Программа также сопоставляет комбинации &lt;Shift+Control+A&gt; строку &quot;EXIT&quot;. Эта комбинация используется для завершения программы. </P>
<P /><P><Font B="Y">Display *display;</Font></P>
<P><Font B="Y">int screenNumber;</Font></P>
<P><Font B="Y">GC gc;</Font></P>
<P><Font B="Y">XEvent report;</Font></P>
<P><Font B="Y">Window window;</Font></P>
<P><Font B="Y">char keyStr[20];</Font></P>
<P><Font B="Y">KeySym keySym, modList[2];</Font></P>
<P><Font B="Y">int n;</Font></P>
<P /><P>/* Устанавливаем связь с сервером, получаем номер экрана . . . */</P>
<P>.........</P>
<P>/* Задаем соответствие символ-строка */</P>
<P><Font B="Y">modList[0] = XK_Control_L;</Font></P>
<P><Font B="Y">modList[1] = XK_Shift_L;</Font></P>
<P><Font B="Y">XRebindKeysym (display, XK_F6, modList, 2, &quot;EXIT&quot;, strlen (&quot;EXIT&quot;));</Font></P>
<P>  /* Цикл получения и обработки событий */</P>
<P /><P><Font B="Y">while (1) {</Font></P>
<P>  <Font B="Y">XNextEvent (display, &amp;report);</Font></P>
<P>  <Font B="Y">switch (report.type) {</Font></P>
<P>   ......</P>
<P>   <Font B="Y">case KeyPress :</Font></P>
<P>     /* Очищаем строку */</P>
<P>     <Font B="Y">memset (keyStr, 0, sizeof (keyStr));</Font></P>
<P /><P>     /* Получаем строку, соответствующую событию */</P>
<P>     <Font B="Y">XLookupString (&amp;report.xkey, keyStr),</Font></P>
<P>       <Font B="Y">sizeof (keyStr), &amp;keySym, NULL);</Font></P>
<P>     <Font B="Y">if ( !strcmp (keyStr, &quot;EXIT&quot;))</Font></P>
<P>     <Font B="Y">{</Font></P>
<P>      <Font B="Y">XFreeGC (display, gc);</Font></P>
<P>      <Font B="Y">XCloseDisplay (display);</Font></P>
<P>      <Font B="Y">exit (0);</Font></P>
<P>     <Font B="Y">}</Font></P>
<P /><P>    <Font B="Y"> n = keySym == XK_F1 ? 1 :</Font></P>
<P>       <Font B="Y">keySym == XK_F2 ? 2 :</Font></P>
<P>         <Font B="Y">keySym == XK_F3 ? 3 :</Font></P>
<P>     <Font B="Y"> keySym == XK_F4 ? 4 :</Font></P>
<P>      <Font B="Y"> keySym == XK_F5 ? 5 : 0;</Font></P>
<P /><P>    <Font B="Y"> if (n) {</Font></P>
<P>      <Font B="Y">sprintf (keyStr, &quot;F%d pressed.&quot;, n);</Font></P>
<P>      <Font B="Y">XClearWindow (display, window);</Font></P>
<P>      <Font B="Y">XDrawString (display, window, gc, 10, 50, keyStr, strlen (keyStr));</Font></P>
<P>     <Font B="Y">}</Font></P>
<P>     <Font B="Y">break;</Font></P>
<P> <Font B="Y"> }</Font></P>
<P><Font B="Y">}</Font></P>
<P>........</P>
<P /><P>Сервер имеет ряд атрибутов, воздействующих на обработку сигналов клавиатуры. Получить их можно с помощью функции XGetKeyboardControl(). Она возвращает указанные параметры в переменной, имеющей тип XKeyboardState, определенный следующим образом: </P>
<P /><P>t<Font B="Y">ypedef struct {</Font></P>
<P><Font B="Y"> i<Font>nt key_click_percent;</Font></Font></P>
<P> <Font B="Y">int bell_percent;</Font></P>
<P><Font B="Y"> unsigned int bell_pitch, bell_duration;</Font></P>
<P> <Font B="Y">unsigned long led_mask;</Font></P>
<P> <Font B="Y">int global_auto_repeat;</Font></P>
<P> <Font B="Y">char auto_repeats[32];</Font></P>
<P><Font B="Y">} XKeyboardsState;</Font></P>
<P /><P>Поле key_click_percent указывает, имеет ли нажатие клавиши звуковое сопровождение; значения поля задаются в %; 0 - звукового сопровождения нет, 100 - громкий звук. Поле bell_percent, bell_pitch и bell_duration указывают, какую силу, частоту и продолжительность имеет предупреждающий сигнал, возникающий при нажатии некоторых клавиш. </P>
<P /><P>Некоторые клавиатуры используют для клавиш-модификаторов световую подсветку. Поле led_mask представляет собой комбинацию флагов, показывающую, для каких клавиш эта подсветка используется. </P>
<P /><P>Когда клавиша нажата и удерживается, то сервер может автоматически имитировать ее повторное нажатие. Поле global_auto_repeat определяет, делает это сервер или нет. Особенностью X является то, что автоматическую генерацию событий о нажатии можно разрешать или запрещать для отдельных клавиш. Массив auto_repeats содержит информацию о том, для каких клавиш автоповтор включен, а для каких нет. Каждый бит массива соответствует клавише с определенным физическим кодом. Если бит установлен, то генерация разрешена, если сброшен, то запрещена. Каждый байт N массива содержит биты для клавиш с кодами от 8N до 8N+7. </P>
<P /><P>Изменить параметры клавиатуры можно с помощью XChangeKeyboardControl(). </P>
<P /><P>Желаемые установки передаются через переменную, которая указывает на структуру типа XKeyboardControl, определяемую следующим образом: </P>
<P /><P><Font B="Y">typedef struct {</Font></P>
<P><Font B="Y"> i<Font>nt key_click_percnet;</Font></Font></P>
<P><Font B="Y"> int bell_percent;</Font></P>
<P> <Font B="Y">int bell_pitch;</Font></P>
<P><Font B="Y"> int bell_duration;</Font></P>
<P><Font B="Y"> int led;</Font></P>
<P> <Font B="Y">int led_mode;</Font></P>
<P><Font B="Y"> int key;</Font></P>
<P> <Font B="Y">int auto_repeat_mode;</Font></P>
<P><Font B="Y">} XKeyboardControl;</Font></P>
<P /><P>Первые четыре поля совпадают с аналогичными полями структуры XKeyboardState. Поля led и led_mode позволяют сообщить серверу, какие из клавиш-модификаторов должны сопровождаться подсветкой. Если поле led не задано, и led_mode равно LedModeOn, то изменяется состояние всех клавиш, для которых поддерживается световое сопровождение. Если led_mode равно LedModeOff, то состояние клавиш не меняется. Если поле led задано, то это есть комбинация флагов, указывающих, для каких клавиш подсветку включить (led_mode равно LedModeOn) или выключить (led_mode равно LedModeOff). </P>
<P /><P>Поля key и auto_repeat_mode определяют, для какой клавиши (клавиш) включить (auto_repeat_mode равно AutoRepeatModeOn) или выключить (auto_repeat_mode равно AutoRepeatModeOff) режим автоматического повтора. Если поле key задано, то автоматический повтор включается или выключается только для клавиши с кодом key. </P>
</Modul>
