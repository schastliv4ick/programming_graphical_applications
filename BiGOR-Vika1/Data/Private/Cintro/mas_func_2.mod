<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="HU5J3ITPYPSDHIU20PPI" Author="Федорук Е.В." Level="0" ADate="EV9GP1JV">
<Title>Передача в функцию многомерного массива</Title>
<P><Term Type="Out">Многомерный массив</Term> &#x2014; <Term Type="Link">массив</Term>, имеющий более одного измерения. Число измерений массива в <Term Type="Link">языке Си</Term> не ограничено.</P>
<P>В <Term Type="Link">функцию</Term> можно передавать лишь <Term Type="Link">адрес массива</Term>, а не копию всего массива. Тем не менее, в функции для доступа к элементам массива можно использовать <Term Type="Link">индексы</Term>.</P>

<Example ID="EV9GQBLR">

<Listing>
<L>/* Программа для чтения текстового файла и выдачи на печать лишь тех слов,</L>
<L> которые начинаются с прописной буквы */</L>
<L>#include &lt;stdio.h&gt;</L>
<L>int main()</L>
<L>{</L>
<L>  void print_caps(int, const char [][20]);</L>
<L>  int amount_read = 0;</L>
<L>  char input[1000][20];         /* Это массив из 1000 массивов из 20 символов */</L>
<L>  while (scanf(&quot;%s&quot;, input[amount_read]) == 1)</L>
<L>     amount_read++;               /* input[amount_read] - один из массивов из 20 символов */</L>
<L>  print_caps(amount_read, input);</L>
<L>}</L>
<L>/* print_caps печатает лишь те слова, которые начинаются с прописной буквы */</L>
<L>void print_caps(int n_words, const char words[][20])</L>
<L>/* words - Это массив из произвольного числа массивов из 20 символов */</L>
<L>{</L>
<L>   int i=0;</L>
<L>   while (i &lt; n_words)</L>
<L>      {</L>
<L>      if (words[i][0] &lt;= &apos;Z&apos; &amp;&amp; words[i][0] &gt;= &apos;A&apos;)</L>
<L>                                   /* words[i][0] - 0-ой символ i-го массива из 20 символов */</L>
<L>         printf(&quot;%s\n&quot;, words[i]); /* words[i] - Один из массивов из 20 символов*/</L>
<L>      i++;</L>
<L>      }</L>
<L> }</L>
</Listing>
</Example>
<P>Значением <Term Type="Link">операции доступа к элементу массива</Term> <Operator>words[i][j]</Operator> будет адрес, вычесленный по следующим формулам:</P>
<P><Formula Br="Y">адрес = начальный адрес массива + смещение</Formula></P>
<P><Formula Br="Y">смещение = (i &#x2219; (число элементов в строке) + j) &#x2219; (длина элемента в байтах)</Formula></P>
</Modul>
