<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="TBZMP12TFANCVWT02L8V" Author="Федорук Е.В." Level="0" ADate="EVJLV34U">
<Title>Инициализация массива</Title>
<P><Term Type="Out">Инициализация массива</Term> &#x2014; это присваивание элементам массива начальных значений.</P>
<P><Term Type="Link">Внешние</Term>, <Term Type="Link">статические внешние</Term>, <Term Type="Link">статические внутренние</Term> и <Term Type="Link">автоматические</Term> переменные составных <Term Type="Link">типов данных</Term>, таких как <Term Type="Link">массивы</Term> и <Term Type="Link">структуры</Term>, могут быть проинициализированы при их объявлении. Любая автоматическая переменная или ее часть (например, элемент массива), которые не были инициализированы, остаются неопределенными. Любая внешняя или статическая переменная или часть ее (например, элемент массива), будучи непроинициализированными, устанавливаются в 0 или <Operator>NULL</Operator>.</P>

<Example ID="EVJLYALC">

<Listing>
<L>char alpha[10];</L>
<L>char beta[10] = {&apos;a, &apos;b&apos;, &apos;c&apos;};</L>
<L>char gamma[10] = &quot;This is gamma&quot;;</L>
<L>char delta[5][10] ={&quot;line 1&quot;,</L>
<L>                    &quot;line 2&quot;,</L>
<L>                    &quot;line 3&quot;};</L>
<L>int num1[10];</L>
<L>int num2[10] = {2, 4, 6, 8, 10};</L>
<L>int num3[5][10] ={{0, 1, 2, 3, 4},</L>
<L>                   {2, 4, 6, 8, 10},</L>
<L>                   {3, 6, 8, 10, 12}};</L>
<L>int main ()</L>
<L>{</L>
<L>static char local[] = &quot;local string&quot;;</L>
<L>char errmsg[] = &quot;name&quot;, &quot;too&quot;, &quot;long&quot;;</L>
<L>int lengths[10] = {23, 56, 83};</L>
<L>...</L>
<L>}</L>
</Listing>
</Example>
<P>Автоматические переменные инициализируются при каждом входе в <Term Type="Link">блок</Term>. Внешние и статические переменные инициализируются один раз, перед началом выполнения <Term Type="Link">программы</Term>.</P>
<P>В примере 1 размеры строк <Operator>gamma</Operator> и <Operator>local</Operator> равны количеству символов в строке, увеличенному на 1 (для символа <Operator>NULL </Operator>&#x2014; <Term Type="Link">признака конца строки</Term>).</P>
</Modul>
