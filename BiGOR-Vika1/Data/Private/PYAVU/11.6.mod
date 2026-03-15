<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="ZF63MQTHPXBP6UE4JT8L" Author="Волосатова Т.М., Родионов С.В." Level="0" ADate="F0Y2MA3V">
<Title>Функция isgraph</Title>

<Listing>
<L>#include  &lt;ctype.h&gt; </L>
<L>int isgraph(int ch) ;</L>
</Listing>
<P><Term Type="Out">Функция isgraph</Term>() возвращает ненулевое значение, если ее аргумент <Operator>ch</Operator> является любым печатаемым символом, но не пробелом. В противном случае возвращается нуль. Для <Operator>ASCII</Operator>-сред значения печатаемых символов лежат в диапазоне от <Operator>0x21</Operator> до <Operator>0х7Е.</Operator></P>

<Example ID="F0Y2O7V5">
<P>Данная программа проверяет все символы, прочитанные из стандартного входного потока stdin, и возвращает сообщение о каждом печатаемом символе.</P>
</Example>

<Listing>
<L>#include &lt;ctype.h&gt;</L>
<L>#include &lt;stdio.h&gt;</L>
<L>int main(void)</L>
<L>{</L>
<L>char ch;</L>
<L>for(;;) {</L>
<L>ch = getchar() ;</L>
<L>if(isgraph(ch)) printf(&quot;%c является печатаемым символом\n&quot;, ch);</L>
<L>if(ch == &apos;.&apos;) break;</L>
<L>}</L>
<L>return 0;</L>
<L>}</L>
</Listing>
<P>Здесь использованы следующие зависимые <Term Type="In">функции isalnum</Term>(),  <Term Type="In">isalpha</Term>(), <Term Type="In">iscntrl</Term>(),  <Term Type="In">isdigit</Term>(), <Term Type="In">isprint</Term>(), <Term Type="In">ispunct</Term>() и <Term Type="In">isspace</Term>().</P>
<P /></Modul>
