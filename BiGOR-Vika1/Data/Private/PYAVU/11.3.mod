<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="PVB5UYY57EHFJE8QHJX7" Author="Волосатова Т.М., Родионов С.В." Level="0" ADate="F0Y25TWV">
<Title>Функция isblank</Title>

<Listing>
<L>#include &lt;ctype.h&gt;</L>
<L>int isblank(int ch);</L>
</Listing>
<P><Term Type="Out">Функция isblank ()</Term> добавлена в версии С99.</P>
<P>Она возвращает ненулевое значение, если ее аргумент ch является символом, для которого функция isspace() возвращает значение &quot;истина&quot;. Этот символ используется в качестве разделителя слов. Так, для английского языка пробельными символами являются пробел и символ горизонтальной табуляции.</P>

<Example ID="F0Y2CLX5">
<P>Данная программа проверяет все символы, прочитанные из стандартного входного потока stdin, и выдает сообщение о каждом пробельном символе.</P>
</Example>

<Listing>
<L>#include &lt;ctype.h&gt;</L>
<L>#include &lt;stdio.h&gt;</L>
<L>int main(void) {</L>
<L>char ch;</L>
<L>for(;;) {</L>
<L>ch = getchar();</L>
<L>if (ch == &apos;.&apos;) break;</L>
<L>if (isblank (ch) ) printf(&quot;%c является разделителем слов\п&quot;, ch).;</L>
<L>}</L>
<L>return 0;</L>
<L>}</L>
</Listing>
<P>Здесь использованы следующие зависимые <Term Type="In">функции isalnum</Term>(),  <Term Type="In">isalpha</Term>(), <Term Type="In">iscntrl</Term>(),  <Term Type="In">isdigit</Term>(),  <Term Type="In">isgraph</Term>(), <Term Type="In">ispunct</Term>() и <Term Type="In">isspace</Term>().</P>
</Modul>
