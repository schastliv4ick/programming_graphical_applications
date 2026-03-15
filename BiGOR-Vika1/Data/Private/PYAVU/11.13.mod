<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="WQD6WM3DAZ59Z8FYHOHP" Author="Волосатова Т.М., Родионов С.В." Level="0" ADate="F0Y56LKE">
<Title>Функция tolower</Title>

<Listing>
<L>#include &lt;ctype.h&gt;</L>
<L>int tolower(int ch);</L>
</Listing>
<P><Term Type="Out">Функция tolower</Term>() возвращает строчный эквивалент параметра <Operator>ch</Operator> , если он явля&#xAC;ется буквой; в противном случае возвращается ch без изменений.</P>

<Example ID="F0Y57SX6">
<P>Этот фрагмент программы выводит букву а. </P>
</Example>

<Listing>
<L>putchar(tolower(&apos;A&apos;) ) ;</L>
</Listing>
<P>Зависимые функции, используемые здесь &#x2013; <Term Type="In">toupper</Term>().</P>
</Modul>
