<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="VF3NMTC6LYM2OPIBAM69" Level="1" ADate="ETN5QC7H" Author="Волосатова">
<Title>Последовательная свертка</Title>
<P>В большинстве систем цифровой обработки сигналов(см. например, ОЭП) реализовано несколько последовательно соединенных фильтров. В этом случае процесс цифровой фильтрации можно записать следующим образом:</P>
<P><Formula>U<Sub>вых,1</Sub>=U<Sub>вх,1</Sub>&#x2217;&#x2217;h<Sub>1</Sub>;</Formula></P>
<P><Formula>U<Sub>вых,2</Sub>=U<Sub>вых,1</Sub>&#x2217;&#x2217;h<Sub>2</Sub>;</Formula></P>
<P><Formula Br="Y" Num="Y" ID="ETRK26Y3">U<Sub>вых,p</Sub>=U<Sub>вх,p&#x2212;1</Sub>&#x2217;&#x2217;h<Sub>p</Sub>;</Formula></P>
<P>где &#x2217;&#x2217; -операция свертки , p -количество фильтров. Выполним БПФ от равенств <Link To="ETRK26Y3" /> и осуществим подстановки:</P>
<P><Formula Br="Y" Num="Y" ID="ETRKCJP3">U<Matrix Col="1" Row="2" Alg="0"><M X="0.49" Y="1.2" Kh="1.0">ф</M><M X="0.49" Y="2.6" Kh="1.0">вых,p</M></Matrix>(k)=U<Matrix Col="1" Row="2" Alg="0"><M X="0.49" Y="1.2" Kh="1.0">ф</M><M X="0.49" Y="2.6" Kh="1.0">вх,p</M></Matrix>&#x2217;h<Matrix Col="1" Row="2" Alg="1"><M X="0.5" Y="1.2" Kh="1.0">ф</M><M X="0.5" Y="2.6" Kh="1.0">1</M></Matrix>(k)&#x2217;h<Matrix Col="1" Row="2" Alg="1"><M X="0.5" Y="1.2" Kh="1.0">ф</M><M X="0.5" Y="2.6" Kh="1.0">2</M></Matrix>(k)&#x2217;...&#x2217;h<Matrix Col="1" Row="2" Alg="1"><M X="0.5" Y="1.2" Kh="1.0">ф</M><M X="0.5" Y="2.6" Kh="1.0">p</M></Matrix>(k)</Formula></P>
<P>или</P>
<P><Formula Br="Y" Num="Y" ID="ETRKEB9Y">U<Matrix Col="1" Row="2" Alg="0"><M X="0.49" Y="1.2" Kh="1.0">ф</M><M X="0.49" Y="2.6" Kh="1.0">вых,p</M></Matrix>(k)=U<Matrix Col="1" Row="2" Alg="0"><M X="0.49" Y="1.2" Kh="1.0">ф</M><M X="0.49" Y="2.6" Kh="1.0">вх</M></Matrix>(k)&#x2217;H<Sup>ф</Sup>(k)</Formula></P>
<P>где H<Sup>ф</Sup>(k) &#x2014; произведение передаточных функций всех фильтров. Таким образом, использование БПФ облегчает цифровую фильтрацию для каскада фильтров.</P>
</Modul>
