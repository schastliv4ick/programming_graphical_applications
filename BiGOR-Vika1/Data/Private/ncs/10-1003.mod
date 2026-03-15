<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="2CVIJNALNJOIPZ1Y0IKM" Author="kylagin" Level="1" ADate="EU2YWOY8">
<Title>Локальная эквализация</Title>
<P>Эквализация гистограмм-нелинейное преобразование, осуществляемое по формуле:</P>
<P><Formula>D<Matrix Col="1" Row="2" Alg="0"><M X="0.5" Y="1.2" Kh="1.0">&apos;</M><M X="0.5" Y="2.6" Kh="1.0">ij</M></Matrix>=<Limits><M>D<Sub>ij</Sub></M><M>&#x2211;</M><M>q=0</M></Limits>H(q)</Formula></P>
<P>Если гистограммы вычисляются по некоторому S- фрагменту (локальная эквализация), то</P>
<P><Formula Br="Y" Num="Y" ID="EU304M10">D<Matrix Col="1" Row="2" Alg="0"><M X="0.5" Y="1.2" Kh="1.0">&apos;</M><M X="0.5" Y="2.6" Kh="1.0">ij</M></Matrix>=<Limits><M>D<Sub>ij</Sub></M><M>&#x2211;</M><M>q=0</M></Limits>H<Sub>S</Sub>(q),</Formula> где гистограмма строится по S-окрестности, т.е.</P>
<P><Formula Br="Y" Num="Y" ID="EU304WYN">H<Sub>S</Sub>(q)=<Limits><M>M</M><M>&#x2211;</M><M>m=&#x2212;M</M></Limits> <Limits><M>N</M><M>&#x2211;</M><M>n=&#x2212;N</M></Limits>&#x3B4;(q,D<Sub>i&#x2212;m,j&#x2212;n</Sub>)<Fraction><M>1</M><M>(2M+1)(2N+1)</M></Fraction></Formula></P>
<P>S-символ Крошкера.</P>
<P>В таком виде алгоритм вычисления характеризуется низким быстродействием, связанным с последовательным механизмом формирования гистограмм, это ограничивает применение параллельных методов.</P>
<P>Безгистограммный алгоритм основан на следующем соотношении</P>
<P>Подставив <Link To="EU304WYN" /> в <Link To="EU304M10" /> получим:</P>
<P><Formula Br="Y">D<Matrix Col="1" Row="2" Alg="0"><M X="0.5" Y="1.2" Kh="1.0">&apos;</M><M X="0.5" Y="2.6" Kh="1.0">ij</M></Matrix>=<Fraction><M>1</M><M>(2M+1)(2N+1)</M></Fraction><Limits><M>D<Sub>ij</Sub></M><M>&#x2211;</M><M>q=0</M></Limits> <Limits><M>M</M><M>&#x2211;</M><M>m=&#x2212;M</M></Limits> <Limits><M>N</M><M>&#x2211;</M><M>n=&#x2212;N</M></Limits>&#x3B4;(q,D<Sub>i&#x2212;m,j&#x2212;n</Sub>)=</Formula></P>
<P><Formula Br="Y" Num="Y" ID="EU30B697">=<Limits><M>M</M><M>&#x2211;</M><M>m=&#x2212;M</M></Limits> <Limits><M>N</M><M>&#x2211; </M><M>n=&#x2212;N</M></Limits> <Fraction><M>1</M><M>(2M+1)(2N+1)</M></Fraction>&#x3B4;(D<Sub>i&#x2212;m,j&#x2212;n</Sub>&#x2264;D<Sub>ij</Sub>)</Formula></P>
<P><Formula Br="Y" Num="Y" ID="EU30EIEL">где &#x3B4;(a&#x2264;b)=<LogBr><M X="0.0" Y="1.25" Kh="1.25">{</M><M X="1.25" Y="1.12" Kh="1.0"><Matrix Col="1" Row="2" Alg="1"><M X="0.5" Y="1.2" Kh="1.0">0,если a&gt;b</M><M X="0.5" Y="2.6" Kh="1.0">1,если a&#x2264;b</M></Matrix></M><Z X="2.25" Y="1.25" Kh="1.25" /></LogBr></Formula> Операция <Link To="EU30B697" /> может быть использована для построения различных видов параллельного выполнения.</P>
</Modul>
