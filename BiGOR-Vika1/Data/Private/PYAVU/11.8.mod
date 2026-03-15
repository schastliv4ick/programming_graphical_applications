<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="WNMCPXERUM6C7CJLWEWK" Author="Волосатова Т.М., Родионов С.В." Level="0" ADate="F0Y2S67Q">
<Title>Функция isprint</Title>

<Listing>
<L>#include &lt;ctype.h&gt;</L>
<L>int isprint(int ch);</L>
</Listing>
<P><Term Type="Out">Функция isprint</Term>()  возвращает ненулевое значение, если аргумент <Operator>ch</Operator> является печатаемым символом, включая пробел. В противном случае возвращается нуль. В <Operator>ASCII</Operator>-средах значения печатаемых символов лежат в диапазоне от <Operator>0x20</Operator> до <Operator>0х7Е.</Operator></P>

<Example ID="F0Y2TLSX">
<P>Данная программа проверяет все символы, прочитанные из стандартного входного потока stdin, и выдает сообщение о каждом печатаемом символе.</P>
</Example>

<Listing>
<L>#include  &lt;ctype.h&gt;</L>
<L>#include  &lt;stdio.h&gt;   </L>
<L>int main(void)</L>
<L>{</L>
<L>char  ch;</L>
<L>for(;;)    </L>
<L>{ch = getchar();</L>
<L>if(islower(ch))  </L>
<L>printf(&quot;символ  %с является печатаемым\n&quot;,   ch); if(ch ==   &apos;. &apos;) </L>
<L>break; </L>
<L>}</L>
<L>return  0;</L>
<L>}</L>
</Listing>
<P>Здесь использованы следующие зависимые <Term Type="In">функции isalnum</Term>(),  <Term Type="In">isalpha</Term>(), <Term Type="In">iscntrl</Term>(),  <Term Type="In">isdigit</Term>(), <Term Type="In">isgraph</Term>(),<Term Type="In"> ispunct</Term>() и <Term Type="In">isspace</Term>().</P>
</Modul>
