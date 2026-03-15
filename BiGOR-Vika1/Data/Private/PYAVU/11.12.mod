<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="MY1SDRCWJC3M0K6VUGYJ" Author="Волосатова Т.М., Родионов С.В." Level="0" ADate="F0Y4FRAT">
<Title>Функция isxdigit</Title>

<Listing>
<L>#include &lt;ctype.h&gt; </L>
<L>int isxdigit(int ch) ;</L>
</Listing>
<P><Term Type="Out">Функция isxdigit</Term>() возвращает ненулевое значение, если аргумент <Operator>ch</Operator> является шестнадцатеричной цифрой. В противном случае возвращается нуль. Шестнадцатеричная цифра должна попадать в один из следующих диапазонов: A-F, a-f или 0-9.</P>

<Example ID="F0Y54VYI">
<P>Данная программа проверяет все символы, прочитанные из стандартного входного потока stdin, и выдает сообщение о каждой шестнадцатеричной цифре.</P>
</Example>

<Listing>
<L>#include &lt;ctype.h&gt;</L>
<L>#include &lt;stdio.h&gt;</L>
<L>int main(void) {</L>
<L>char ch;</L>
<L>for(;;) {</L>
<L>ch = getchar();</L>
<L>if(ch == &apos;.&apos;) </L>
<L>break;</L>
<L>if(isxdigit(ch)) </L>
<L>printf(&quot;%c является шестнадцатеричной</L>
<L>цифрой\n&quot;, ch);</L>
<L>}</L>
<L>return  0;</L>
<L>}</L>
</Listing>
<P>Здесь использованы следующие зависимые <Term Type="In">функции isalnum</Term>(), <Term Type="In">isalpha</Term>(), <Term Type="In">iscntrl</Term>(), <Term Type="In">isdigit</Term>(),  <Term Type="In">isgraph</Term>(), <Term Type="In">ispunct</Term>() и <Term Type="In">isspace</Term>()..</P>
<P /></Modul>
