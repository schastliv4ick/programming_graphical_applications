<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="A7K9D9KY86C8H4LQY427" Author="Волосатова Т.М., Родионов С.В." Level="0" ADate="F0F2FLL1">
<Title>Функция localtime</Title>

<Listing>
<L>#include  &lt;time.h&gt;</L>
<L>struct   tm *localtime(const time_t  *time);</L>
</Listing>
<P><Term Type="Out">Функция localtime</Term>() возвращает указатель на структуру типа <Term Type="In">tm</Term>, содержащую время в разделенной на компоненты форме. Время представлено как местное. Указатель time обычно получают с помощью функции time().</P>
<P>Память для структуры, в которой localtime() сохраняет разделенное на компоненты время, выделяется <Term Type="In">статически</Term>. Поэтому эта структура перезаписывается при каждом вызове функции. Для сохранения содержания структуры, ее надо скопировать в какую-нибудь другую область памяти.</P>

<Example ID="F0F2HN0O">
<P>Эта программа печатает местное время и координированное всемирное время системы:</P>
</Example>

<Listing>
<L>#include &lt;time.h&gt;</L>
<L>#include &lt;stdio.h&gt;</L>
<L>/* Печатать местное и координированное всемирное (UTC) время. */</L>
<L>int main(void)</L>
<L>{</L>
<L>struct tm * local;</L>
<L>time_t t;</L>
<L>t - time(NULL) ;</L>
<L>local = localtime(&amp;t);</L>
<L>printf(&quot;Местное время и дата: %s\n&quot;, asctime(local));</L>
<L>local = gmtime(&amp;t);</L>
<L>printf(&quot;Координированное всемирное время (UTC) и дата: %s\n&quot;, asctime(local));</L>
<L>return 0;</L>
<L>}</L>
</Listing>
<P>При этом используются зависимые <Term Type="In">функции gmtime</Term>(), <Term Type="In">time</Term>() и <Term Type="In">asctime</Term>().</P>
</Modul>
