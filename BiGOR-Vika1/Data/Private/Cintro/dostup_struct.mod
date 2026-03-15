<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="9C1U9LTUBPSTSOS83VYU" Author="Федорук Е.В." Level="0" ADate="EW9DLHQ9">
<Title>Доступ к элементам структуры</Title>
<P>В <Term Type="Link">языке Си</Term> есть <Term Type="Out">операция доступа к элементу структуры</Term> (<Operator>.</Operator>):</P>
<P><Operator>имя_структуры.имя_элемента_структуры</Operator></P>
<P>Операция доступа к элементу структуры (<Operator>.</Operator>) используется для доступа к элементу структуры с тем, чтобы присвоить ему значение, напечатать его, использовать его значение в арифметической операции и т.д. Эта операция является первичной и находится в самой верхней строке <Term Type="Link">таблицы приоритетов</Term> операций языка Си. Результат этой операции &#x2014; значение элемента структуры.</P>

<Example ID="EW9DNK56">

<Listing>
<L>#include &lt;stdio.h&gt;</L>
<L>#include &lt;stdlib.h&gt;</L>
<L>struct emp {</L>
<L>            char name[21];</L>
<L>            char id[8];</L>
<L>            double salary;      /*это шаблон, память не выделяется */</L>
<L>            };</L>
<L>int main()</L>
<L>{</L>
<L>  struct emp prgmr;   /*это объявление переменной - выделяется память */</L>
<L>  int num;</L>
<L>  ...</L>
<L>  gets(prgmr.name);</L>
<L>  gets(prgmr.id);</L>
<L>  gets(buf);</L>
<L>  prgmr.salary = atof(buf);</L>
<L>  printf(&quot;Name: %s\n&quot;, prgmr.name);</L>
<L>  printf(&quot;Id: %s\n&quot;, prgmr.id);</L>
<L>  printf(&quot;salary: %.2f\n&quot;, prgmr.salary);</L>
<L /><L>  ...</L>
<L>  prgmr.salary *= 1.15;</L>
<L /><L>  ...</L>
<L>}</L>
</Listing>
</Example>
</Modul>
