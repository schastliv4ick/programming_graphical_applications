<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="4TM9QH4XW16O05UXA3LG" Author="kylagin" Level="1" ADate="EU4EQD9J">
<Title>Медианные фильтры на основе сортирующих сетей</Title>
<P><Term Type="In">Медиана</Term> квадратного фрагмента (2M+1)x(2M+1) элементов вычисляется с помощью одномерного медианного фильтра в течение 2-х этапов</P>

<List Num="Y">
<P>Вычисление медианы строк (столбцов) фрагмента <Formula Br="Y">U<Matrix Col="1" Row="2" Alg="1"><M X="0.5" Y="1.2" Kh="1.0">&apos;</M><M X="0.5" Y="2.6" Kh="1.0">&#x2212;M</M></Matrix>=med(U<Sub>&#x2212;M,j&#x2212;M</Sub>, ... , U<Sub>&#x2212;Mj</Sub>, ... ,U<Sub>&#x2212;M,j+M</Sub>)</Formula><Formula Br="Y">U<Matrix Col="1" Row="2" Alg="1"><M X="0.5" Y="1.2" Kh="1.0">&apos;</M><M X="0.5" Y="2.6" Kh="1.0">&#x2212;i</M></Matrix>=med(U<Sub>i,j&#x2212;M</Sub>, ... ,U<Sub>ij</Sub>, ... ,U<Sub>i,j+M</Sub>)</Formula><Formula Br="Y">U<Matrix Col="1" Row="2" Alg="1"><M X="0.5" Y="1.2" Kh="1.0">&apos;</M><M X="0.5" Y="2.6" Kh="1.0">M</M></Matrix>=med(U<Sub>M,j&#x2212;M</Sub>, ... ,U<Sub>M,j</Sub>, ... ,U<Sub>M,j+M</Sub>)</Formula></P>
<P>По медианам строк определяется псевдомедиана</P>
</List>
<P><Formula>U<Free><M Y="1.0">&apos;*</M><M Y="2.5">ij</M></Free>=med(U<Free><M Y="1.0">&apos;</M><M Y="2.5">&#x2212;M</M></Free> , ... , U<Free><M Y="1.0">&apos;</M><M Y="2.5">i</M></Free>,..., U<Free><M Y="1.0">&apos;</M><M Y="2.5">M</M></Free>)</Formula></P>
<P>Для определения медианы U<Free><M Y="1.0">&apos;*</M><M Y="2.5">ij</M></Free>=med(S) нужно выполнить сортировку (2M+1)<Sup>2</Sup> элементов.</P>
<P>Псевдомедиана:</P>
<P>а)Сортировка (2M+1) элементов (при этом определяется медиана строки фрагмента U<Free><M Y="1.0">&apos;</M><M Y="2.5">i</M></Free> , т.к. перекрывающиеся фрагменты изображения отличаются на одну строку) параллельно и сортировки (2M+1) элементов изображения, т.е. медиана строк. При этом вычисляется медиана строк.</P>
<SubTitle>Алгоритм быстрой сортировки для медианной фильтрации</SubTitle>
<P>Обычная сортировка одномерного массива размерности n простого выбора (поиск min и его перестановка ) требует:</P>
<P><Formula><Fraction><M>1</M><M>2</M></Fraction>(n<Sup>2</Sup>-n)</Formula> операций сравнения;</P>
<P>max: <Formula><Fraction><M>n<Sup>2</Sup></M><M>4</M></Fraction>+3(n-1)</Formula> операций пересылок.</P>
<SubTitle>Алгоритм быстрой сортировки(К.Хоар 1971г.)</SubTitle>
<P>(Сортировка с разделением)</P>
<P><Formula>a<Sub>1</Sub>,a<Sub>2</Sub>,a<Sub>3</Sub>,...,a<Sub>x</Sub>,....,a<Sub>n-1</Sub>,a<Sub>n</Sub></Formula></P>
<P>Просматриваем массив слева направо, пока не встретим a<Sub>i</Sub>&gt;x,&#xA0;а затем справа налево, пока не встретим a<Sub>i</Sub>&lt;x. Тогда поменяем их местами.</P>
<P>Продолжим просмотр с обменом, пока не встретимся где-то вблизи x (i&gt;j). В этом случае исходный массив разделится на 2 части:</P>
<P>левая-элементы &lt;x</P>
<P>правая-элементы &gt;x</P>
<P>Применяя указанную процедуру рекурсивно к каждой из частей получим упорядоченный по возрастанию массив.</P>

<Listing>
<L>a:array[1..n] of real;</L>
<L>procedure quicksort;</L>
<L>procedure sort(l,r:integer);</L>
<L>var i,j:integer ;</L>
<L>k,w:real;</L>
<L>begin i:=l; j:=r;</L>
<L>x:=a[(l+r) div L);</L>
<L>repeat</L>
<L>while a[i]&lt;x do i:=i+1;</L>
<L>while a[j]&gt;x do j:=j+1;</L>
<L>if i&lt;=j then</L>
<L>begin</L>
<L>w:=a[i]; a[i]:=a[j];a[j]:=w;</L>
<L>i:=i+1; j:=j-1;</L>
<L>end</L>
<L>until i&gt;j</L>
<L>if l&lt;j then sort(l,j);</L>
<L>if i&lt;r then sort(r);</L>
<L>end;</L>
<L>begin</L>
<L>sort(1,n);</L>
<L>end;</L>
</Listing>
<P>Общее количество сравнений <Formula>n&#x2219;log<Sub>2</Sub>n.</Formula> Общее количество перестановок <Formula>max: n&#x2219;log<Sub>2</Sub>n,</Formula></P>
<P>среднее : <Formula><Fraction><M>n</M><M>6</M></Fraction>&#x2219;log<Sub>2</Sub>n.</Formula></P>
</Modul>
