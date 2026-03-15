<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="LSD313WNSI4IPH88565P" Level="1" ADate="ETKAETPZ" Author="Волосатова">
<Title>Совмещенные алгоритмы</Title>
<P>Если последовательность U(n) &#x2014; вещественна, то в соответствии с формулой (<LDocument RC="8J2HI82P95AO672PPQ2O:8FJPHK478DKDQUOPKBD5" />3)</P>
<P><Formula Br="Y" Num="Y" ID="ETKC8T5Z">V(k)=V*(N&#x2212;K)</Formula></P>
<P>Таким образом, достаточно вычислить V(k) только для <Formula>k=0,1,...,<Fraction><M>N</M><M>2</M></Fraction></Formula>, а остальные найти по формуле <Link To="ETKC8T5Z" />.</P>
<P>Два способа реализации выигрыша:</P>

<List Num="Y">
<P>Из двух последовательностей<Formula>U(n)</Formula> и&#xA0;<Formula>W(n)</Formula>длинной N&#xA0;образуют последовательность</P>
</List>
<P><Formula>Q(n)=U(n)+&#x3AF;W(n)</Formula></P>
<P>И вычисляют ее БПФ</P>
<P><Formula>&#x3C7;(k)=<Matrix Col="1" Row="3" Alg="0"><M X="0.5" Y="1.2" Kh="1.0">N&#x2212;1</M><M X="0.5" Y="2.6" Kh="1.0">&#x2211;</M><M X="0.5" Y="4.0" Kh="1.0">n=0</M></Matrix>Q(n)exp(&#x3AF;2&#x3C0;<Fraction><M>kn</M><M>N</M></Fraction>)</Formula></P>
<P>Тогда БПФ исходных последовательностей <Formula>V(k)</Formula> и <Formula>P(k)</Formula> находят:</P>
<P><Formula Br="Y" Num="Y" ID="ETKFSZIS">V(k)=<Fraction><M>&#x3C7;(k)+&#x3C7;*(N&#x2212;k)</M><M>2</M></Fraction>; P(k)=&#x2212;&#x3AF;<Fraction><M>&#x3C7;(k)+&#x3C7;*(N&#x2212;k)</M><M>2</M></Fraction></Formula></P>
<P>Причем вычисления по формуле <Link To="ETKFSZIS" /> достаточно вычислить только для <Formula>k=0,1,...,<Fraction><M>N</M><M>2</M></Fraction></Formula>, а остальные можно найти по формуле <Link To="ETKC8T5Z" />.</P>
<P>Удобно для двумерных:<Formula>U(n)</Formula> и&#xA0;<Formula>W(n)</Formula>- соседние строки.</P>
<P /><P> </P>
<P>2. При преобразовании одномерных последовательностей вещественных чисел использется 2-ой способ, вытекающий из представления:</P>
<P>V<Formula Br="Y" Num="Y" ID="ETKGAHGO">(k)=<Matrix Col="1" Row="3" Alg="0"><M X="0.5" Y="1.2" Kh="1.0">N/2&#x2212;1</M><M X="0.5" Y="2.6" Kh="1.0">&#x2211;</M><M X="0.5" Y="4.0" Kh="1.0">n=0</M></Matrix>a<Sub>2n</Sub>exp(&#x3AF;2&#x3C0;<Fraction><M>nk</M><M>(N/2)</M></Fraction>)+<Matrix Col="1" Row="3" Alg="0"><M X="0.5" Y="1.2" Kh="1.0">N/2&#x2212;1</M><M X="0.5" Y="2.6" Kh="1.0">&#x2211;</M><M X="0.5" Y="4.0" Kh="1.0">n=0</M></Matrix>a<Sub>2n+1</Sub>exp(&#x3AF;2&#x3C0;<Fraction><M>nk</M><M>(N/2)</M></Fraction>)exp[&#x3AF;&#x3C0;<Fraction><M>k</M><M>(N/2)</M></Fraction>]</Formula>Таким образом БПФ всей последовательности можно выполнить, вычислив БПФ от двух ее подпоследовательностей, составленных из четных и нечетных членов исходной последовательности, т.е.</P>
<P><Formula>V(k)=[V<Free><M Y="1.0">(ч)</M><M Y="2.5">k</M></Free>+exp(<Fraction><M>&#x3AF;&#x3C0;k</M><M>(N/2)</M></Fraction>)V<Free><M Y="1.0">(н)</M><M Y="2.5">k</M></Free>]</Formula>,</P>
<P>при этом коэффициенты <Formula>V<Free><M Y="1.0">(ч)</M><M Y="2.5">k</M></Free></Formula> + V<Free><M Y="1.0">(н)</M><M Y="2.5">k</M></Free> можно найти, пользуясь 1-м способом по формулам <Link To="ETKFSZIS" /></P>
</Modul>
