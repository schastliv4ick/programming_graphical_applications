<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="JQDU9435L30U3X21CWML" Author="Федорук Е.В." Level="0" ADate="EVNTSVM1">
<Title>Операция &quot;запятая&quot;</Title>
<P><Term Type="Out">Операция &quot;запятая&quot;</Term> &#x2014; бинарная операция <Term Type="Link">языка Си</Term>, значением которой является значение правого операнда.</P>
<P>Операция &quot;запятая&quot; используется следующим образом:</P>
<P><Operator>выражение_А, выражение_В</Operator></P>
<P>Сначала вычисляется <Operator>выражение_А</Operator>, затем <Operator>выражение_В</Operator>.</P>
<P>Значением всего <Term Type="Link">выражения</Term> является значение <Operator>выражение_В</Operator>.</P>
<P><Term Type="Link">Приоритет</Term> этой операции определен в <Term Type="Link">таблице приоритетов</Term> языка Си.</P>
<P>В общем случае эта операция используется тогда, когда <Term Type="Link">синтаксис</Term> языка требует одного <Term Type="Link">выражения</Term>, а программисту хочется выполнить два или более действия путем задания нескольких выражений. Операция &quot;запятая&quot; чаще всего используется для включения дополнительных выражений в заголовок <Term Type="Link">цикла for</Term>. Вспомним синтаксис цикла <Operator>for</Operator>:</P>

<Listing>
<L>for (выражение1; выражение2; выражение3)</L>
<L>    оператор</L>
</Listing>
<P>В прим. 1 приводится корректный цикл <Operator>for</Operator>, в котором инициализируются и увеличиваются две переменные.</P>

<Example ID="EVNTZHM8">

<Listing>
<L>for (i = 0, j = 10; i&lt;max; i++, j++)</L>
<L>    list[i] = name[j];</L>
</Listing>
</Example>
<P>В этом примере <Operator>выражением1</Operator> является следующее выражение : <Operator>i = 0, j = 10</Operator>, а <Operator>выражением3</Operator> является выражение <Operator>i++, j++</Operator>.</P>
<P>Выражение типа <Operator>(вырА, вырВ, вырС, вырD)</Operator> корректно. Поскольку операция &quot;запятая&quot; левоассоциативна, т.е. связывает свои операнды слева направо, значением всего выражения будет значение <Operator>вырD</Operator>.</P>

<Example ID="EVNU6SU5">

<Listing>
<L>x = 0;</L>
<L>while (printf(&quot;x is %d\n&quot;,x), x&lt;5000)</L>
<L>    tryit (x++);</L>
</Listing>
</Example>
<P>В <Term Type="Link">языке программирования Си</Term> любое <Term Type="Link">выражение</Term> имеет значение, например значение выражения <Operator>5+2</Operator> равно 7, значением выражения <Operator>х = 200</Operator> является 200, значением выражения <Operator>x &lt; y</Operator> есть 1 (<Term Type="Link">истина</Term>) или 0 (<Term Type="Link">ложь</Term>). В <Link To="EVNU6SU5" /> в <Term Type="Link">цикле while</Term> значение выражения в круглых скобках есть значение второго выражения <Operator>x &lt; 5000</Operator>, которое будет либо 0 (ложью) либо 1 (истиной). Функция <Operator>printf()</Operator> вычисляется каждый раз при вычислении выражения, определяющего условие продолжения цикла, однако не влияет на истинность значения проверки.</P>
</Modul>
