<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="PBH6SV4Y7N5FZKAXAIS9" Author="Волосатова Т.М., Родионов С.В." Level="0" ADate="F1RZCAOS">
<Title>Сортировка структур</Title>
<P>В большинстве прикладных программ, в которых используется сортировка, предусмотрена сортировка совокупностей данных. Например, списки почтовой рассыпки, складские базы данных и журналы сотрудников содержат наборы разнотипных данных. В программах на языке С совокупности данных обычно хранятся в структурах. Хотя структура обычно содержит несколько членов, структуры, как правило, сортируются только по одному получлену, который используется в качестве ключа сортировки. За исключением выбора ключа, приемы сортировки структур ничем не отличаются от приемов сортировки других типов данных.</P>
<P>Чтобы проиллюстрировать пример сортировки структур, создадим структуру под называнием <Operator>address,</Operator> в которой можно хранить почтовый адрес. Подобная структура может применяться в программе почтовой рассылки. Описание структуры <Operator>address</Operator> показано ниже:</P>

<Listing>
<L>struct address   {</L>
<L>char name[40]; .</L>
<L>/*  имя  */</L>
<L>char street[40];</L>
<L>/*  улица  */</L>
<L>char city[20];</L>
<L>/*   город  */</L>
<L>char state[3];</L>
<L>/*  штат   */</L>
<L>char zip[ll];</L>
<L>/* индекс */</L>
<L>};</L>
</Listing>
<P>Поскольку представляется разумным организовать список адресов в виде массива структур, в данном примере предположим, что процедура сортировки будет сортировать массив структур типа <Operator>address.</Operator> Такая процедура показана ниже. Она сортирует адреса по почтовому индексу.</P>

<Listing>
<L>/*  Быстрая  сортировка  структур  типа  address.   */ </L>
<L>void quick_struct(struct  address  items[],  int  count)</L>
<L>{</L>
<L>qs_ struct(items,0,count-l) ;</L>
<L>}</L>
<L>void qs_struct(struct address items[], int left, int right)</L>
<L>register int i, j;</L>
<L>char *x;</L>
<L>struct address temp;</L>
<L>i = left; j = right;</L>
<L>x = items [ (left+fright)/2] . zip; /* сортировка по почтовому индексу */</L>
<L>do {</L>
<L>while({strcmp(items[i].zip,x) &lt; 0) &amp;&amp; (i &lt; right}) i++; while((strcmp(items[j].zip,x) &gt; 0) &amp;&amp; (j &gt; left)) j--; </L>
<L>if(i &lt;= j) {</L>
<L>temp = items[i];</L>
<L>items[i] = items[j];</L>
<L>items[j] = temp;</L>
<L>}</L>
<L>} while(i &lt;= j) ;</L>
<L>if(left &lt; j) qs_struct(items, left, j);</L>
<L> if(i &lt; right) qs_struct(items, i, right);</L>
<L>}</L>
</Listing>
<P /></Modul>
