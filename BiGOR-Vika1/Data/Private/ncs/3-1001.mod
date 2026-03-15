<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="49784MEY48YAG8APXU7Q" Author="kylagin" Level="0" ADate="ETBAMDZ8">
<Title>Преобразование Фурье</Title>
<P><Formula Br="Y" Num="Y" ID="EUFUFLOX">U<Sub>ф</Sub>(f)=<Matrix Col="1" Row="3" Alg="0"><M X="0.5" Y="1.2" Kh="1.0">+&#x221D;</M><M X="0.5" Y="2.6" Kh="1.0">&#x222B;</M><M X="0.5" Y="4.0" Kh="1.0">-&#x221D;</M></Matrix>U(t)exp(&#x3AF;2&#x3C0;ft)dt                       </Formula></P>
<P>Обратное </P>
<P><Formula Br="Y" Num="Y" ID="EUFUFUEP">U(t)=<Matrix Col="1" Row="3" Alg="0"><M X="0.5" Y="1.2" Kh="1.0">+&#x221D;</M><M X="0.5" Y="2.6" Kh="1.0">&#x222B;</M><M X="0.5" Y="4.0" Kh="1.0">-&#x221D;</M></Matrix>U<Sub>ф</Sub>(f)exp(&#x3AF;2&#x3C0;ft)df    </Formula>     </P>
<P>Для двумерных:</P>
<P><Formula>U<Sub>ф</Sub>(f<Sub>1</Sub>,f<Sub>2</Sub>)=<Matrix Col="1" Row="3" Alg="0"><M X="0.5" Y="1.2" Kh="1.0">+&#x221D;</M><M X="0.5" Y="2.6" Kh="1.0">&#x222B;</M><M X="0.5" Y="4.0" Kh="1.0">-&#x221D;</M></Matrix><Matrix Col="1" Row="3" Alg="0"><M X="0.5" Y="1.2" Kh="1.0">+&#x221D;</M><M X="0.5" Y="2.6" Kh="1.0">&#x222B;</M><M X="0.5" Y="4.0" Kh="1.0">-&#x221D;</M></Matrix>U(x,y)exp[&#x3AF;2&#x3C0;(f<Sub>1</Sub>x+f<Sub>2</Sub>y)]dxdy</Formula></P>
<P /><P>Основные свойства:</P>
<P>Теорема о свертке:</P>
<P>определение:</P>
<P><Formula Br="Y" Num="Y" ID="EUFUG88X">U(t)=<Matrix Col="1" Row="3" Alg="0"><M X="0.5" Y="1.2" Kh="1.0">+&#x221D;</M><M X="0.5" Y="2.6" Kh="1.0">&#x222B;</M><M X="0.5" Y="4.0" Kh="1.0">-&#x221D;</M></Matrix>a(&#x3C4;)b(t-&#x3C4;)d&#x3C4;   - свертка</Formula></P>
<P>Фурье- образ свертки равен произведению фурье-образов свертываемых функций, т.е.</P>
<P><Formula>U<Sub>ф</Sub>(f)=a<Sub>ф</Sub>(f)b<Sub>ф</Sub>(f)</Formula></P>
<P>Доказательство:</P>
<P><Formula>U<Sub>ф</Sub>(f)=<Matrix Col="1" Row="1" Alg="1"><M X="0.5" Y="1.2" Kh="1.0"><Matrix Col="1" Row="3" Alg="0"><M X="0.5" Y="1.2" Kh="1.0">+&#x221D;</M><M X="0.5" Y="2.6" Kh="1.0">&#x222B;</M><M X="0.5" Y="4.0" Kh="1.0">-&#x221D;</M></Matrix>U(t)exp</M></Matrix>(&#x3AF;2&#x3C0;ft)dt=<Matrix Col="1" Row="3" Alg="0"><M X="0.5" Y="1.2" Kh="1.0">+&#x221D;</M><M X="0.5" Y="2.6" Kh="1.0">&#x222B;</M><M X="0.5" Y="4.0" Kh="1.0">-&#x221D;</M></Matrix><Matrix Col="1" Row="1" Alg="1"><M X="0.5" Y="1.2" Kh="1.0">exp</M></Matrix>(&#x3AF;2&#x3C0;ft)<Matrix Col="1" Row="3" Alg="0"><M X="0.5" Y="1.2" Kh="1.0">+&#x221D;</M><M X="0.5" Y="2.6" Kh="1.0">&#x222B;</M><M X="0.5" Y="4.0" Kh="1.0">-&#x221D;</M></Matrix>a(&#x3C4;)b(t-&#x3C4;)dtd&#x3C4; e<Sup>&#x3AF;2&#x3C0;f&#x3C4;</Sup>e<Sup>-&#x3AF;2&#x3C0;f&#x3C4;</Sup></Formula>=</P>
<P><Formula>&#x3BE;=t&#x3C4;</Formula></P>
<P><Formula>=<Matrix Col="1" Row="3" Alg="0"><M X="0.5" Y="1.2" Kh="1.0">+&#x221D;</M><M X="0.5" Y="2.6" Kh="1.0">&#x222B;</M><M X="0.5" Y="4.0" Kh="1.0">-&#x221D;</M></Matrix>d&#x3C4;e<Sup>&#x3AF;2&#x3C0;f&#x3C4;</Sup>a(&#x3C4;)<Matrix Col="1" Row="3" Alg="0"><M X="0.5" Y="1.2" Kh="1.0">+&#x221D;</M><M X="0.5" Y="2.6" Kh="1.0">&#x222B;</M><M X="0.5" Y="4.0" Kh="1.0">-&#x221D;</M></Matrix>d&#x3BE;b(&#x3BE;)e<Sup>&#x3AF;2&#x3C0;f&#x3BE;</Sup>=a<Sub>ф</Sub>(f)b<Sub>ф</Sub>(f)</Formula></P>
</Modul>
