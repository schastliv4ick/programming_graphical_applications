<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="V619RJS4EQIMZNZS3B3S" Author="kylagin" Level="1" ADate="ETBEK5RD">
<Title>Преобразование Уолша</Title>
<P><Formula Br="Y" Num="Y" ID="EUFUH71K">U(t)=<Matrix Col="1" Row="3" Alg="0"><M X="0.5" Y="1.2" Kh="1.0">&#x221D;</M><M X="0.5" Y="2.6" Kh="1.0">&#x2211;</M><M X="0.5" Y="4.0" Kh="1.0">k=0</M></Matrix>C<Sub>k</Sub>Wal<Sub>k</Sub>(t),   </Formula>            </P>
<P>где 0&#x2264;t&#x2264;1</P>
<P><Formula Br="Y" Num="Y" ID="EUFUHC0Z">C<Sub>k</Sub>=<Matrix Col="1" Row="3" Alg="0"><M X="0.5" Y="1.2" Kh="1.0">1</M><M X="0.5" Y="2.6" Kh="1.0">&#x222B;</M><M X="0.5" Y="4.0" Kh="1.0">0</M></Matrix>U(t)Wal<Sub>k</Sub>(t)dt </Formula></P>
<P>Если функция U определена на более широком интервале, то можно ввести &#x3BE;=<Fraction><M>t</M><M>T</M></Fraction> и тогда перейдем к нужному интервалу.</P>
<P><Formula Br="Y" Num="Y" ID="EUFUHHFP">U(t)=<Matrix Col="1" Row="3" Alg="0"><M X="0.5" Y="1.2" Kh="1.0">&#x221D;</M><M X="0.5" Y="2.6" Kh="1.0">&#x2211;</M><M X="0.5" Y="4.0" Kh="1.0">k=0</M></Matrix>C<Sub>k</Sub>Wal<Sub>k</Sub>(<Fraction><M>t</M><M>T</M></Fraction>) </Formula></P>
<P>C<Sub>k</Sub>=<Fraction><M>1</M><M>T</M></Fraction><Matrix Col="1" Row="3" Alg="0"><M X="0.5" Y="1.2" Kh="1.0">T</M><M X="0.5" Y="2.6" Kh="1.0">&#x222B;</M><M X="0.5" Y="4.0" Kh="1.0">0</M></Matrix>U(t)Wal<Sub>k</Sub>(<Fraction><M>t</M><M>T</M></Fraction>)</P>
<P>Для свертки справедливы те же свойства, что и для Фурье.</P>
</Modul>
