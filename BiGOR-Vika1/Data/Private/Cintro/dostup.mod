<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="KP35D9EARBKWT406NB27" Author="Федорук Е.В." Level="0" ADate="EV0Z3XBL">
<Title>Доступ к элементам массива</Title>
<P>В <Term Type="Link">языке Си</Term> есть <Term Type="Out">операция доступа к элементу массива</Term> &#x2014; квадратные скобки, которая используется следующим образом:</P>
<P><Operator>имя_массива[индекс]</Operator></P>
<P>Эта операция относится к первичным и находится в самой высокой строке <Term Type="Link">таблицы приоритетов</Term> операций языка Си.</P>
<P><Term Type="Out">Имя массива</Term> &#x2014; <Term Type="Link">идентификатор</Term>, который определяет начальный адрес <Term Type="Link">массива</Term> (адрес первого элемента).</P>
<P>Для доступа к элементу массива (его изменения, печати, присваивания значения другой переменной и т.д.) надо использовать операцию &quot;квадратные скобки&quot;.</P>
<P>В скобках должно стоять целочисленное <Term Type="Link">выражение</Term>, значение которого должно находиться в диапазоне от 0 до (размер массива &#x2013; 1).</P>

<Example ID="EX7DKCI1">
<P><Operator>char id[8];</Operator></P>
<P><Operator>id[0] =&apos;j&apos;;</Operator></P>
<P>Элементу номер 0 массива <Operator>id </Operator>присваивается код символа<Operator> &apos;j&apos;</Operator>.</P>
</Example>
<P>Результат операции доступа к элементу массива &#x2014; значение, хранящееся по адресу необходимого элемента массива. Этот адрес определяется следующим образом:</P>
<P><Formula Br="Y">начальный адрес массива + смещение</Formula></P>
<P>Для одномерного массива <Term Type="Out">смещение</Term> определяется по формуле:</P>
<P><Formula Br="Y">смещение = индекс элемента &#x2219; длина элемента в байтах</Formula></P>

<Example ID="EV0ZL9PA">
<P><Operator>char id[8];</Operator></P>
<P><Operator>id[3] = id[0];</Operator></P>
<P>Байт из элемента <Operator>id[0]</Operator> копируется в элемент <Operator>id[3].</Operator></P>
<P>Адрес элемента id[3]:</P>
<P><Formula Br="Y">начальный адрес массива id + смещение = начальный адрес массива id + 3&#x2219;1</Formula></P>
</Example>

<Example ID="EV0ZNJFV">
<P><Operator>float price[3];</Operator></P>
<P><Operator>price[num] = price[num-1]*2;</Operator></P>
<P>Если значение <Operator>num</Operator> равно 2, то <Operator>price[2] = price[1]*2;</Operator></P>
<P>Адрес элемента price[2]:</P>
<P>начальный адрес массива price + смещение = начальный адрес массива price + 2&#x2219;4</P>
</Example>
<P>Для массива произвольной размерности <Term Type="Link">смещение</Term> определяется по формуле:</P>
<P><Formula Br="Y">смещение = количество предыдущих элементов &#x2219; длина элемента в байтах</Formula></P>

<Example ID="EV0ZPJET">
<P><Operator>int table[4][3];</Operator> <Operator>/*table[длина 2-го измерения][длина 1-го измерения]*/</Operator></P>
<P><Operator>printf (&quot;%d\n&quot;, table[2][1]);</Operator> <Operator>/*table[индекс2][индекс1]*/</Operator></P>
<P>Печатает целое число, хранящееся во 2-й строке 1-го столбца массива <Operator>table</Operator> .</P>
<P>Адрес элемента table[2][1]:</P>
<P>начальный адрес массива table + смещение =</P>
<P>начальный адрес массива table + (индекс2 &#x2219; (длина 1-го измерения ) + индекс1) &#x2219; длина элемента в байтах =</P>
<P>начальный адрес массива table + (2&#x2219;3 + 1)&#x2219;4</P>
</Example>

<Example ID="EV0ZUHKJ">
<P><Operator>/* Запоминает рост вклада по годам в массиве и печатает его */</Operator></P>

<Listing>
<L>#include &lt;stdio.h&gt;</L>
<L>int main()</L>
<L>{</L>
<L>const float investment = 6000, interest = .085;</L>
<L>float  rate;</L>
<L>double value[5];</L>
<L>int    year;</L>
<L /><L>rate = 1 + interest;                    /* 108.5% от предыдущей суммы */</L>
<L>value[0] = investment;</L>
<L>year = 1;</L>
<L>while (year &lt; 5)</L>
<L>  {</L>
<L>  value[year] = value[year-1] * rate;</L>
<L>  year += 1;                           /* year = year+1 */</L>
<L>  }</L>
<L>printf(&quot;начальный вклад: %.2f\n&quot;, value[0]);</L>
<L>year = 1;</L>
<L>while (year &lt; 5)</L>
<L>  {</L>
<L>  printf(&quot;год %.d\n&quot;, year);</L>
<L>  printf(&quot;%.2f\n&quot;, value[year]);</L>
<L>  year += 1;                           /* year = year+1 */</L>
<L> }</L>
<L>}</L>
</Listing>
</Example>
</Modul>
