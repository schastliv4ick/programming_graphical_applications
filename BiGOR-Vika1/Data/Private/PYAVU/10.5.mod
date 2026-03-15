<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="UE7FM42TE8YJHJLB6A14" Author="Волосатова Т.М., Родионов С.В." Level="0" ADate="F0F1JKYO">
<Title>Функция difftime</Title>

<Listing>
<L>#include   &lt;time.h&gt;</L>
<L>double   difftime(time_t   time2,   time_t   timel);</L>
</Listing>
<P><Term Type="Out">Функция difftime</Term>() возвращает разность в секундах между значениями параметров time1 и time2, т.е. возвращается значение выражения time2-time1.</P>

<Example ID="F0F1N2HR">
<P>Эта программа отображает время в секундах, требуемое для выполнения пустого цикла 5 000 000 раз:</P>
</Example>

<Listing>
<L>#include &lt;time.h&gt; #include &lt;stdio.h&gt;</L>
<L>int main(void)</L>
<L>{</L>
<L>time_t start,end; </L>
<L>volatile long unsigned t;</L>
<L>start = time(NULL);</L>
<L>for(t=0; t&lt;5000000; t++);</L>
<L>end = time(NULL);</L>
<L>printf(&quot;Цикл использовал %f секунд.\n&quot;, difftime(end, start));</L>
<L>return 0;</L>
<L>}</L>
</Listing>
<P>Здесь используются зависимые <Term Type="In">функции localtime</Term>(), <Term Type="In">gmtime</Term>(), <Term Type="In">time</Term>() и <Term Type="In">asctime</Term>().</P>
<P /></Modul>
