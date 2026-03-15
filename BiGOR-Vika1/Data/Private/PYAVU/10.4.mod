<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="GOK5AAGNGER1101X97JL" Author="Волосатова Т.М., Родионов С.В." Level="0" ADate="F0F1FMTX">
<Title>Функция ctime</Title>

<Listing>
<L>#include&lt;time.h&gt;</L>
<L>char*ctime(const time_t  *time);</L>
</Listing>
<P><Term Type="Out">Функция ctime</Term>() возвращает указатель на строку, имеющую следующий вид:  День месяц год часы:минуты:cекунды уеаr\п\0.</P>
<P>Функции передается указатель на календарное время. Календарное время обычно получают с помощью <Term Type="In">функции time</Term>().</P>
<P>Буфер, используемый ctime() для хранения форматированной строки вывода является статически распределенным <Term Type="In">массивом</Term> символов. Он перезаписывается при каждом вызове Функции. Для сохранения строки ее необходимо скопировать в какую-нибудь другую область памяти.</P>

<Example ID="F0F1I4M4">
<P>Эта программа отображает местное время, определенное в системе:</P>
</Example>

<Listing>
<L>#include   &lt;time.h&gt; #include   &lt;stdio.h&gt;</L>
<L>int main(void) {</L>
<L>time_t   lt;</L>
<L>lt   =   time(NULL);</L>
<L>printf(ctime(&amp;lt)};</L>
<L>return  0; }</L>
</Listing>
<P>Здесь используются зависимые <Term Type="In">функции localtime</Term>(), <Term Type="In">gmtime</Term>(), time() и <Term Type="In">asctime</Term>().</P>
</Modul>
