<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="WUVRYCKFPZ7GFD81YFZB" Author="Волосатова Т.М., Родионов С.В." Level="0" ADate="F0Y2PWYT">
<Title>Функция islower</Title>
<P />
<Listing>
<L>#include &lt;ctype.h&gt;</L>
<L>int islower(int ch);</L>
</Listing>
<P><Term Type="Out">Функция islower</Term>()   возвращает ненулевое значение, если аргумент <Operator>ch</Operator> является строчной буквой. В противном случае возвращается нуль.</P>

<Example ID="F0Y2R8TG">
<P>Данная программа проверяет все символы, прочитанные из стандартного входного потока stdin, и выдает сообщение о каждой строчной букве.</P>
</Example>

<Listing>
<L>#include &lt;ctype.h&gt;</L>
<L>#include &lt;stdio.h&gt;</L>
<L>int main(void)</L>
<L>{</L>
<L>char ch;</L>
<L>for(;;) {</L>
<L>ch = getchar () ;</L>
<L>if(ch == &apos;.&apos;) break;</L>
<L>if(islower(ch)) printf{&quot;%c является строчной буквой\n&quot;, ch);</L>
<L>}</L>
<L>return 0;</L>
<L>}</L>
</Listing>
<P>Зависимые функции, используемые здесь - <Term Type="In">isupper</Term>().</P>
</Modul>
