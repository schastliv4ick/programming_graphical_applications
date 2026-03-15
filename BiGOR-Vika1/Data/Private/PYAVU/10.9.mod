<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="6ET8JE46IR9URRB6GE4E" Author="Волосатова Т.М., Родионов С.В." Level="0" ADate="F0HRUWBS">
<Title>Функция mktime</Title>

<Listing>
<L>#include  &lt;time.h&gt;</L>
<L>time_t mktime(struct tm  *time);</L>
</Listing>
<P><Term Type="Out">Функция mktime</Term>() возвращает календарный эквивалент времени, хранящийся в разделенном на компоненты виде в структуре, которая адресуется параметром-указателем <Operator>time.</Operator> Элементы <Operator>tm_wday</Operator> и <Operator>tm_yday</Operator> устанавливаются самой функцией, поэтому их не нужно определять при ее вызове.</P>
<P>Если mktime() не может представить информацию в виде допустимого календарного времени, возвращается -1.</P>

<Example ID="F0HRYSRS">
<P>Эта программа сообщает день недели 3 января 2005 года:</P>
</Example>

<Listing>
<L>#include &lt;time.h&gt; </L>
<L>#include &lt;stdio.h&gt;</L>
<L>int main(void)</L>
<L>{</L>
<L>struct tm t;</L>
<L>time_t  t_of_day;</L>
<L>t.tm_year = 2005-1900;</L>
<L>t.tm_mon = 0;</L>
<L>t.tm mday = 3;</L>
<L>t.tm_hour =0;   /* Час, минута, секунда не имеют значения, */</L>
<L>t.tm_min =0;  /* если только они не определяют переход */</L>
<L>t.tm_sec =1;   /* на новую дату */</L>
<L>t.tm_isdst = 0;</L>
<L>t_ of_day = mktime{&amp;t); printf(ctime(&amp;t_of_day)</L>
<L>return 0;</L>
<L>}</L>
</Listing>
<P>Здесь используются зависимые <Term Type="In">функции time</Term>(), <Term Type="In">ctime</Term>(), <Term Type="In">gmtime</Term>(),  и <Term Type="In">asctime</Term>().</P>
<P /></Modul>
