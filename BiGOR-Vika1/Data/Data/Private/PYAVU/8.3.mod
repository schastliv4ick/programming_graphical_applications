<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="TN58K2UEGEUCDV34I8QY" Author="Полякова Виктория" Level="0" ADate="ET6W712C">
<Title>Директива #undef</Title>
<P><Term Type="Out">Директива #undef</Term> используется для отмены действия <Term Type="In">директивы #define</Term>. Синтаксис этой директивы следующий #undef идентификатор Директива отменяет действие текущего определения #define для указанного идентификатора. Не является ошибкой использование директивы #undef для идентификатора, который не был определен директивой #define.</P>

<Listing>
<L>#undef WIDTH</L>
<L>#undef MAX</L>
</Listing>
<P>Эти директивы отменяют определение именованной константы <Operator>WIDTH</Operator> и макроопределения <Operator>MAX.</Operator></P>
</Modul>
