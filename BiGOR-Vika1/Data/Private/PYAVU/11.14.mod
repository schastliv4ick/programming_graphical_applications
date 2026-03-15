<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="QL7I3EMEUWB9C3IGLVRD" Author="Волосатова Т.М., Родионов С.В." Level="0" ADate="F0Y59MOS">
<Title>Функция toupper</Title>

<Listing>
<L>#include &lt;ctype.h&gt;</L>
<L>int toupper(int ch);</L>
</Listing>
<P><Term Type="Out">Функция toupper</Term>() возвращает прописной эквивалент параметра <Operator>ch</Operator> , если <Operator>ch</Operator> -  буква; в противном случае возвращается <Operator>ch</Operator> без изменений.</P>

<Example ID="F0Y5A1Y9">
<P>Этот фрагмент программы выводит букву А.</P>
</Example>

<Listing>
<L>putchar(toupper(&apos;a&apos;) ) ;  </L>
<L /></Listing>
<P>Зависимые функции, используемые здесь &#x2013; <Term Type="In">tolower</Term>().</P>
</Modul>
