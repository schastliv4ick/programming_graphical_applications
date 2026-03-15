<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="Q7BRGPRYXSO7E4L09VQG" Author="Волосатова Т.М., Родионов С.В." Level="0" ADate="F0HTCA8L">
<Title>Функция time</Title>

<Listing>
<L>#include  &lt;time.h&gt;</L>
<L>time_t  time(time_t   *time);</L>
</Listing>
<P><Term Type="Out">Функция time</Term>() возвращает текущее календарное время системы. Если в системе отсчет времени не производится, возвращается значение -1.</P>
<P>Функцию time() можно вызывать либо с нулевым <Term Type="In">указателем</Term>, либо с указателем на переменную типа time_t. В последнем случае этой переменной будет присвоено календарное время.</P>

<Example ID="F0HTDP0A">
<P>Эта программа отображает местное время, определенное системой:</P>
</Example>

<Listing>
<L>#include &lt;time.h&gt;</L>
<L>#include &lt;stdio.h&gt;</L>
<L>int main(void) </L>
<L>{</L>
<L>struct tm *ptr; time_t lt;</L>
<L>lt = time(NULL);</L>
<L>ptr = localtime(&amp;lt);</L>
<L>printf(asctime (ptr) ) ;</L>
<L>return 0;  }</L>
</Listing>
<P>Здесь используются зависимые <Term Type="In">функции localtime</Term> () , <Term Type="In">gmtime</Term> (), <Term Type="In">strftime</Term>() и <Term Type="In">ctime</Term> ().</P>
</Modul>
