<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="836I8HOYF61XYSB2TG92" Author="Волосатова Т.М., Родионов С.В." Level="0" ADate="F0Y2DNBI">
<Title>Функция iscntrl</Title>

<Listing>
<L>#include  &lt;ctype.h&gt;</L>
<L>int  iscntrl(int   ch);</L>
</Listing>
<P><Term Type="Out">Функция iscntrl</Term>() возвращает ненулевое значение, если ее аргумент <Operator>ch</Operator> является управляющим символом, значение которого в <Operator>ASCII</Operator>-средах лежит в диапазоне между нулем и <Operator>0x1F</Operator> или равно <Operator>0x7F</Operator> (символ DEL). В противном случае возвращается нуль.</P>

<Example ID="F0Y2ESKR">
<P>Данная программа проверяет все символы, прочитанные из стандартного входного потока stdin, и выдает сообщение о каждом управляющем символе.</P>
</Example>

<Listing>
<L>#include &lt;ctype.h&gt;</L>
<L>#include &lt;stdio.h&gt;</L>
<L>int  main(void)</L>
<L>{</L>
<L>char ch;</L>
<L>for(;;) {</L>
<L>ch = getchar();</L>
<L>if(ch == &apos;.&apos;) break;</L>
<L>if(iscntrl(ch)) printf(&quot;%c является управляющим символом\п&quot;, ch;</L>
<L>}</L>
<L>return 0;</L>
<L>}</L>
</Listing>
<P>При этом могут быть использованы следующие зависимые <Term Type="In">функции isalnum</Term>(), <Term Type="In">isalpha</Term>(), <Term Type="In">isdigit</Term>(), <Term Type="In">isgraph</Term>(), <Term Type="In">isprint</Term>(), <Term Type="In">ispunct</Term>() и <Term Type="In">isspace</Term> ().</P>
</Modul>
