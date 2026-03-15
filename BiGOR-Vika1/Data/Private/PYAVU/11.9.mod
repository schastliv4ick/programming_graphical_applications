<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="8OR92XRPH41K9H82L4TD" Author="Волосатова Т.М., Родионов С.В." Level="0" ADate="F0Y2YNGF">
<Title>Функция ispunct</Title>

<Listing>
<L>#include &lt;ctype.h&gt; </L>
<L>int isprint(int ch );</L>
</Listing>
<P><Term Type="Out">Функция ispunct</Term>()  возвращает ненулевое значение, если аргумент <Operator>ch</Operator> является знаком пунктуации. В противном случае возвращается нуль. Под знаками пунктуации подразумеваются печатаемые символы за исключением пробела, которые не относятся к алфавитно-цифровым.</P>

<Example ID="F0Y38UB0">
<P>Данная программа проверяет все символы, прочитанные из стандартного входного потока stdin, и выдает сообщение о каждом знаке пунктуации.</P>
</Example>

<Listing>
<L>#include   &lt;ctype.h&gt;</L>
<L>#include   &lt;stdio.h&gt;</L>
<L>int main(void)</L>
<L>{</L>
<L>char  ch;</L>
<L>for(;;)    {</L>
<L>ch = getchar();</L>
<L>if(ispunct(ch))   </L>
<L>printf{&quot;%c  является знаком пунктуации\n&quot;,   ch);</L>
<L>if(ch ==   &apos;.&apos;)  </L>
<L>break;</L>
<L>}</L>
<L>return   0;</L>
<L>}</L>
</Listing>
<P>Здесь использованы следующие зависимые <Term Type="In">функции isalnum</Term>(),  <Term Type="In">isalpha</Term>(), <Term Type="In">iscntrl</Term>(),  <Term Type="In">isdigit</Term>(), <Term Type="In">isgraph</Term>(), <Term Type="In">isspace</Term>().</P>
<P /></Modul>
