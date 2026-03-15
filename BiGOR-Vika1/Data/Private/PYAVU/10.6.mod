<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="ZGQALLRMLXSXV2YZHT79" Author="Волосатова Т.М., Родионов С.В." Level="0" ADate="F0F1OKL9">
<Title>Функция gmtime</Title>

<Listing>
<L>#include   &lt;time.h&gt;</L>
<L>struct   tm  *gmtime (const   time_t   *time) ;</L>
</Listing>
<P><Term Type="Out">Функция gmtime</Term>() возвращает <Term Type="In">указатель</Term> на <Term Type="In">структуру tm</Term>, содержащую календарное время в разделенной на компоненты форме. Значение time представлено в виде так называемого координированного всемирного времени (Coordinated Universal Time, ли UTC), которое, по сути, является средним временем по гринвичскому меридиану (Greenwich mean time, GMT). Функция time() возвращает указатель time. Она возвращает NULL, если система не поддерживает координированное всемирное время.</P>
<P>Память для структуры, в которой функция gmtime() сохраняет разделенное на компоненты время, распределяется статически. Эта структура перезаписывается при каждом вызове функции. Чтобы сохранить содержимое структуры, ее необходимо скопировать в какую-нибудь другую область памяти.</P>

<Example ID="F0F1RYIK">
<P>Эта программа печатает местное время и координированное всемирное время (UTC) системы:</P>
</Example>

<Listing>
<L>#include &lt;time.h&gt;</L>
<L>#include  &lt;stdio.h&gt;</L>
<L>/* Печать местного и координированного всемирного (UTC) времени.  */</L>
<L>int main(void)</L>
<L>{</L>
<L>struct   tm   *local, *gm;</L>
<L>time_t  t;</L>
<L>t = time(NULL);</L>
<L>local = localtime(&amp;t);</L>
<L>printf(&quot; Местное время и дата: %s\n&quot;, asctime(local));</L>
<L>gm = gmtime(&amp;t) ;</L>
<L>printf(&quot;Координированное всемирное время и дата: %s&quot;, asctime(gm));</L>
<L>return  0;</L>
<L>}</L>
</Listing>
<P>Здесь используются зависимые <Term Type="In">функции localtime</Term>(), gmtime(), <Term Type="In">time</Term>() и <Term Type="In">asctime</Term>().</P>
</Modul>
