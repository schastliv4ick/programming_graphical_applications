<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="PCOZIWQCEF18OG6D20B4" Author="Волосатова Т.М., Родионов С.В." Level="0" ADate="F0Y2IGDJ">
<Title>Функция isdigit</Title>

<Listing>
<L>#include  &lt;ctype.h&gt;</L>
<L>int  isdigit(int   ch);</L>
</Listing>
<P><Term Type="Out">Функция isdigit</Term>() возвращает ненулевое значение, если ее аргумент <Operator>ch</Operator> является цифрой, т.е. попадает в диапазон 0-9. В противном случае возвращается нуль.</P>

<Example ID="F0Y2JBDV">
<P>Данная программа проверяет каждый символ, прочитанный из стандартного потока stdin, и выдает сообщение, если этот символ окажется цифрой.</P>
</Example>

<Listing>
<L>#include  &lt;ctype.h&gt;</L>
<L>#include  &lt;stdio.h&gt;</L>
<L>int main(void)</L>
<L>{</L>
<L>char ch;</L>
<L>for(;;)    {</L>
<L>ch = getchar();</L>
<L>if(ch  ==   &apos;.&apos;)   break;</L>
<L>if(isdigit(ch))   printf(&quot;%c  является цифрой\n&quot;,   ch) ;</L>
<L>}</L>
<L>return 0;</L>
<L>}</L>
</Listing>
<P>При этом могут быть использованы следующие зависимые <Term Type="In">функции isalnum</Term>(),  <Term Type="In">isalpha</Term>(), <Term Type="In">iscntrl</Term>(), <Term Type="In">isgraph</Term>(), <Term Type="In">isprint</Term>(),  <Term Type="In">ispunct</Term>(), <Term Type="In">isspace</Term>().</P>
<P /></Modul>
