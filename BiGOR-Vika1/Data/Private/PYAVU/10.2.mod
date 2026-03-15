<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="WV7RSD9B7W2P30D6ZYY4" Author="Волосатова Т.М., Родионов С.В." Level="0" ADate="F0F0VEHF">
<Title>Функция asctime</Title>

<Listing>
<L> #include &lt;time.h&gt;</L>
<L> char   *asctime(const   struct   tm   *ptr);</L>
</Listing>
<P><Term Type="Out">Функция asctime</Term> возвращает указатель на строку, которая содержит информацию, со&#xAC;храняемую в адресуемой параметром <Operator>ptr</Operator> структуре и имеющую следующую форму:  День_недели месяц дата часы:минуты:секунды год\п\0</P>

<Example ID="F0F10TG3">
<P> Fri  Apr   15   12:05:34   2005</P>
</Example>
<P><Operator>Ptr</Operator> указывает на структуру, заполняемую <Term Type="In">функциями localtime</Term>() или <Term Type="In">gmtime</Term>().</P>
<P>Буфер, используемый функцией asctime() для хранения форматированной строки вывода, является статически распределенным массивом символов. Он перезаписывается при каждом вызове функции. Чтобы сохранить содержание строки, скопируйте ее в какую-нибудь другую область памяти.</P>

<Example ID="F0F14L8Z">
<P>Эта программа отображает местное время, определяемое системой:</P>
</Example>

<Listing>
<L>#include   &lt;time.h&gt; #include   &lt;stdio.h&gt;</L>
<L>it  main (void)</L>
<L>{</L>
<L>struct   tm  *ptr; time_t   lt;</L>
<L>lt = time(NULL) ;</L>
<L>ptr = localtime(&amp;lt) ;</L>
<L>printf(asctime(ptr)) ;</L>
<L>return 0;</L>
<L>}</L>
</Listing>
<P>Здесь используются зависимые функции localtime(), gmtime(), <Term Type="In">time</Term>() и  asctime().</P>
</Modul>
