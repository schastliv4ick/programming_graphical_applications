<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="2WS23S7PT3JL8LN2OJQS" Author="kylagin" Level="0" ADate="ETCYOHGT">
<Title>Дискретные и спектральные преобразования</Title>
<P><Term Type="Out">Дискретное преобразование сигнала</Term>- представление непрерывного сигнала в форме конечного числа ординат N</P>
<P><Term Type="Out">Спектральное  преобразование сигнала</Term> - представление данного сигнала через его проекции на базис, образованный некоторой системой ортоггональных функций.</P>
<P>Определение: последователбность называется периодической с периодом N , если</P>
<P><Formula><Limits><M>&#x223C;</M><M>U</M><Z /></Limits>(n+N)=<Limits><M>&#x223C;</M><M>U</M><Z /></Limits>(n)</Formula></P>
<P>Теорема</P>
<P>Любая периодическая последовательность <Formula><Limits><M>&#x223C;</M><M>U</M><Z /></Limits>(n)</Formula> с периодом  N может быть представлена дискретным рядом Фурье (ДФП)</P>
<P><Formula Br="Y" Num="Y" ID="EUFUMAFA"><Limits><M>&#x223C;</M><M>U</M><Z /></Limits>(n)=<Fraction><M>1</M><M>N</M></Fraction><Matrix Col="1" Row="3" Alg="0"><M X="0.5" Y="1.2" Kh="1.0">N-1</M><M X="0.5" Y="2.6" Kh="1.0">&#x2211;</M><M X="0.5" Y="4.0" Kh="1.0">k=0</M></Matrix><Limits><M>&#x223C;</M><M>V</M><Z /></Limits>(k)exp(&#x3AF;<Fraction><M>2&#x3C0;</M><M>N</M></Fraction>kn),</Formula> </P>
<P><Formula Br="Y" Num="Y" ID="EUFUMHZ2">где   <Limits><M>&#x223C;</M><M>V</M><Z /></Limits>(k)<Matrix Col="1" Row="3" Alg="0"><M X="0.5" Y="1.2" Kh="1.0">N-1</M><M X="0.5" Y="2.6" Kh="1.0">&#x2211;</M><M X="0.5" Y="4.0" Kh="1.0">n=0</M></Matrix><Limits><M>&#x223C;</M><M>U</M><Z /></Limits>(n)exp(-&#x3AF;<Fraction><M>2&#x3C0;</M><M>N</M></Fraction>kn) - коэффициенты ДПФ.  </Formula></P>
<P>Любой конечный сигнал можно периодически продолжить на всю числовую ось, т.е.</P>
<P><Formula Br="Y" Num="Y" ID="EUFUMMRJ"><Limits><M>&#x223C;</M><M>U</M><Z /></Limits>(n)=<Matrix Col="1" Row="3" Alg="0"><M X="0.5" Y="1.2" Kh="1.0">+&#x221D;</M><M X="0.5" Y="2.6" Kh="1.0">&#x2211;</M><M X="0.5" Y="4.0" Kh="1.0">k=-&#x221D;</M></Matrix>U(n-kN)  ,</Formula> </P>
<P>где N-период, <Formula><Limits><M>&#x223C;</M><M>U</M><Z /></Limits>(n)</Formula>-периодическое продолжение <Formula>U(n)</Formula>. Тогда:</P>
<P><Formula Br="Y" Num="Y" ID="EUFUMTZM">U(n)=<LogBr><M X="0.0" Y="1.25" Kh="1.25">{</M><M X="1.25" Y="1.12" Kh="1.0"><Matrix Col="1" Row="2" Alg="0"><M X="0.5" Y="1.2" Kh="1.0"><Limits><M>&#x223C;</M><M>U</M><Z /></Limits>(n) , n&#x2208;R<Sub>N</Sub>=[0,N-1]</M><M X="0.5" Y="2.6" Kh="1.0">0 в остальных случаях</M></Matrix></M><Z X="2.25" Y="1.25" Kh="1.25" /></LogBr></Formula></P>
<P>Тогда ДПФ можно записать:</P>
<P><Formula Br="Y" Num="Y" ID="EUFUN0KC">V(k)=<Matrix Col="1" Row="3" Alg="0"><M X="0.5" Y="1.2" Kh="1.0">N-1</M><M X="0.5" Y="2.6" Kh="1.0">&#x2211;</M><M X="0.5" Y="4.0" Kh="1.0">n=0</M></Matrix>U(n)exp(-2&#x3C0;&#x3AF;<Fraction><M>kn</M><M>N</M></Fraction>)</Formula></P>
<P><Formula>U(n)=<Fraction><M>1</M><M>N</M></Fraction><Matrix Col="1" Row="3" Alg="0"><M X="0.5" Y="1.2" Kh="1.0">N-1</M><M X="0.5" Y="2.6" Kh="1.0">&#x2211;</M><M X="0.5" Y="4.0" Kh="1.0">k=0</M></Matrix>V(k)exp(2&#x3C0;&#x3AF;<Fraction><M>kn</M><M>N</M></Fraction>),</Formula></P>
<P>где</P>
<P>V(k)=<LogBr><M X="0.0" Y="1.25" Kh="1.25">{</M><M X="1.25" Y="1.12" Kh="1.0"><Matrix Col="1" Row="2" Alg="0"><M X="0.5" Y="1.2" Kh="1.0"><Limits><M>&#x223C;</M><M>V</M><Z /></Limits>(k) , k&#x2208;[0,N-1]</M><M X="0.5" Y="2.6" Kh="1.0">0 в остальных случаях</M></Matrix></M><Z X="2.25" Y="1.25" Kh="1.25" /></LogBr></P>
</Modul>
