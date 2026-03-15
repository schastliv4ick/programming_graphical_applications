<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="DND5FVWU0IVSPF0HZ0M8" Author="Волосатова Т.М., Родионов С.В." Level="0" ADate="F0Y3A8IR">
<Title>Функция  isspace</Title>

<Listing>
<L>#include  &lt;ctype.h&gt; </L>
<L>int  isspace(int   ch) ;</L>
</Listing>
<P><Term Type="Out">Функция isspace</Term>() возвращает ненулевое значение, если аргумент <Operator>ch</Operator> является пробельным символом. К пробельным символам, помимо пробела, относятся симво&#xAC;лы горизонтальной и вертикальной табуляции, перевода страницы, возврата каретки и новой строки. Причем при локализации к этому списку могут быть добавлены и другие символы. В противном случае возвращается нуль.</P>

<Example ID="F0Y3DBEX">
<P>Данная программа проверяет все символы, прочитанные из стандартного входного потока stdin, и выдает сообщение о каждом пробельном символе.</P>
</Example>

<Listing>
<L>#include &lt;ctype.h&gt;</L>
<L>#include &lt;stdio.h&gt;</L>
<L>int main(void) {</L>
<L>char ch;</L>
<L>for(;;) {</L>
<L>ch = getchar();</L>
<L>if(isspace(ch)) </L>
<L>printf(&quot;%c является пробельным символом\n&quot;, ch) ;</L>
<L>if(ch = = &apos;.&apos;)</L>
<L>break;</L>
<L>}</L>
<L>return 0;</L>
<L>}</L>
</Listing>
<P>Здесь использованы следующие зависимые <Term Type="In">функции isalnum</Term>(), <Term Type="In">isalpha</Term>(), <Term Type="In">isblank</Term>(), <Term Type="In">iscntrl</Term>(), <Term Type="In">isdigit</Term>(), <Term Type="In">isgraph</Term>()и <Term Type="In">ispunct</Term>().</P>
</Modul>
