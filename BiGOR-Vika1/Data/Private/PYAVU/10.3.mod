<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="P775ZT4JEH8OCZL4A35M" Author="Волосатова Т.М., Родионов С.В." Level="0" ADate="F0F1ABAY">
<Title>Функция clock</Title>

<Listing>
<L>#include &lt;time.h&gt;</L>
<L>clock_t clock(void);</L>
</Listing>
<P><Term Type="Out">Функция clock</Term>() возвращает значение, которое приблизительно соответствует времени работы вызывающей программы. Для преобразования этого значения в секунды нужно разделить его на значение <Operator>CLOCKS_PER_SEC</Operator>. Если системный таймер недоступен, возвращается значение -1.</P>

<Example ID="F0F1B82N">
<P>Следующая функция отображает время выполнения вызывающей программы в секундах:</P>
</Example>

<Listing>
<L>void elapsed_time(void) {</L>
<L>printf(&quot;Прошло: %u секунд.\n&quot;, clock()/CLOCKS_PER_SEC);</L>
<L>}</L>
</Listing>
<P>Здесь используются зависимые функции time(),ctime() и <Term Type="In">asctime</Term>().</P>
</Modul>
