<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="5M4J8SWUN11V7Q2AM68Z" Author="Волосатова Т.М., Родионов С.В." Level="0" ADate="F0Y3EGBL">
<Title>Функция isupper</Title>

<Listing>
<L>#include  &lt;ctype.h&gt;</L>
<L>int isupper(int  ch);</L>
</Listing>
<P><Term Type="Out">Функция isupper</Term>() возвращает ненулевое значение, если аргумент <Operator>ch</Operator> является прописной буквой. В противном случае возвращается нуль.</P>

<Example ID="F0Y4EQM2">
<P>Данная программа проверяет все символы, прочитанные из стандартного входного потока stdin, и выдает сообщение о каждой прописной букве.</P>
</Example>

<Listing>
<L>#include &lt;ctype.h&gt;</L>
<L>#include &lt;stdio.h&gt;</L>
<L>int main(void)</L>
<L>{</L>
<L>char ch;</L>
<L>for (;;) {</L>
<L>ch = getchar();</L>
<L>if(ch = = &apos;.&apos;) </L>
<L>break;</L>
<L>if(isupper(ch)) </L>
<L>printf(&quot;%c является прописной буквой\n&quot;, ch);</L>
<L>}</L>
<L>return 0;</L>
<L>}</L>
</Listing>
<P>Зависимые функции, используемые здесь &#x2013; <Term Type="In">islower</Term>().</P>
<P /></Modul>
