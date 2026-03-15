<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="QG5Z7J64OA1APK2GEX39" Author="Полякова В.Г." Level="0" ADate="EV15R2A7">
<Title>Модификация и чтение ресурсов объекта</Title>
<P>Для модификации ресурсов уже созданного <Term Type="In">widget</Term> приложение может использовать процедуру</P>

<Listing>
<L>void XtSetValues (Widget prWidget, ArgList prArgs, Cardinal nNumArgs);</L>
</Listing>
<P>Здесь prWidget &#x2014; объект, ресурсы которого устанавливаются, второй и третий аргументы содержат список пар: &quot;имя ресурса/его значение&quot; и число таких пар соответственно. Например, следующий фрагмент кода позволяет установить ширину и высоту widget класса <Term Type="In">Core</Term>:</P>

<Listing>
<L>. . . . . . .</L>
<L>Arg   aReserv[5];</L>
<L>/* Используется для задания ресурсов */</L>
<L>int   i = 0;</L>
<L>Widget prShellParent;    /* Родительский объект */</L>
<L>Widget prCoreWidget;     /* Идентификатор объекта */</L>
<L>. . . . . . .</L>
<L>prCoreWidget = XtCreateWidget (&quot;core&quot;, widgetClass, prShellParent, NULL, 0);</L>
<L>XtSetArg (aReserv[i], XtNwidth, 100);</L>
<L>i++;</L>
<L>XtSetArg (aReserv[i], XtNheight, 150);</L>
<L>i++;</L>
<L>XtSetValues (prCoreWidget, aReserv, i);</L>
<L>. . . . . . .</L>
<L /></Listing>
<P>X11R4 и выше поддерживает также <Term Sp="GNV7ZB1PXH9TJCKWQ04X" Type="Link">функцию</Term></P>

<Listing>
<L>void XtVaSetValues (Widget prWidget, . . . );</L>
</Listing>
<P>При ее вызове вместо многоточия должен стоять завершающийся нулем список пар: &quot;имя ресурса, его значение&quot;. Приведенный выше пример с использованием XtVaSetValues( ) выглядит следующим образом:</P>

<Listing>
<L>. . . . . . .</L>
<L>Widget prShellParent;        /* Родительский объект */</L>
<L>Widget prCoreWidget;         /* Идентификатор объекта */</L>
<L>. . . . . . .</L>
<L>prCoreWidget = XtCreateWidget (&quot;core&quot;, widgetClass, prShellParent, NULL, 0);</L>
<L>XtVaSetValues (prCoreWidget, XtNwidth, 100, XtNheight, 150, NULL);</L>
<L>. . . . . . .</L>
</Listing>
<P>Xt позволяет получить текущее значение ресурса widget, используя процедуру</P>

<Listing>
<L>void XtGetValues (Widget prWidget, ArgList prArgs,Cardinal nNumArgs);</L>
</Listing>
<P>Здесь prWidget &#x2014; это объект, значения ресурсов которого будут получены. Второй аргумент содержит список пар, каждая из которых задает имя ресурса и адрес, по которому будет сохранено его значение. Третий аргумент есть число таких пар. Например, приводимый ниже фрагмент кода позволяет получить текущее значение высоты созданного объекта.</P>

<Listing>
<L>. . . . . . .</L>
<L>Arg     aReserv[5];</L>
<L>Dimension  nHeight;</L>
<L>Widget   prWidget;</L>
<L>. . . . . . .</L>
<L>XtSetArg (aReserv[0], XtNheight, &amp;nHeight);</L>
<L>XtGetValues (prWidget, aReserv, 1);</L>
<L>. . . . . . .</L>
</Listing>
<P>В результате в переменную nHeight будет скопировано текущее значение высоты для созданного widget. Переменная, в которую копируется значение ресурса должна иметь соответствующий ему тип.</P>
<P>Начиная с X11R4 можно использовать процедуру</P>

<Listing>
<L>void XtVaGetValues (Widget prWidget, . . .);</L>
</Listing>
<P>При ее вызове вместо многоточия должен стоять завершающийся нулем список пар, задающих имена ресурсов и адреса, по которым будут сохранены их значения. Приведенный выше пример с использованием XtVaGetValues() выглядит следующим образом:</P>

<Listing>
<L>. . . . . . .</L>
<L>Dimension  nHeight;</L>
<L>Widget     prWidget;</L>
<L>. . . . . . .</L>
<L>XtVaGetValues (prWidget, XtNheight, &amp;nHeight, NULL);</L>
<L>. . . . . . .</L>
</Listing>
</Modul>
