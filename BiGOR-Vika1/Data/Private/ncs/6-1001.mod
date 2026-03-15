<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="1LGLFGC90W2QKUCOX82M" Author="kylagin" Level="0" ADate="ETRLNERD">
<Title>Одномерные фильтры</Title>
<SubTitle>Классификация фильтров</SubTitle>
<P>Исторически, фильтры описываются дифференциальными уравнениями с постоянными коэффициентами. Для цифровых фильтров это уравнение переходит в разностное типа:</P>
<P><Formula Br="Y" Num="Y" ID="ETRM6KMT">y(&#x3AF;)=<Limits><M>k</M><M>&#x2211;</M><M>k=0</M></Limits>b<Sub>k</Sub>x(&#x3AF;-k)-<Limits><M>L</M><M>&#x2211;</M><M>l=1</M></Limits>a<Sub>l</Sub>y(&#x3AF;-l),</Formula></P>
<P>где y - выходной, x - входной сигналы.</P>

<List Num="Y">
<P>Фильтры, у которых отличен от 0 хотя бы один коэффициент <Formula>a<Sub>&#x3AF;</Sub></Formula> называются рекурсивными или фильтры с бесконечной импульсной характеристикой(<Term Type="Out">БИХ-фильтры</Term>)</P>
<P>Фильтры, у которых все <Formula>a<Sub>&#x3AF;</Sub>=0</Formula> называются нерекурсивными или с конечной импульсной характеристикой (<Term Type="Out">КИХ-фильтры</Term>)</P>
</List>
<P>Наиболее часто принимаются фильтры 2-го порядка вида:</P>
<P><Formula Br="Y" Num="Y" ID="ETSX2G23">y(&#x3AF;)=b<Sub>0</Sub>x(&#x3AF;)-a<Sub>1</Sub>y(&#x3AF;-1)-a<Sub>2</Sub>y(&#x3AF;-2)</Formula></P>
<P>Передаточнцю функцию такого фильтра можно найти, выполнив преобразование Фурье.</P>
<P><Formula Br="Y" Num="Y" ID="ETSX78J1">Y(f)=b<Sub>0</Sub>X(f)-a<Sub>1</Sub>Y(f)exp(-&#x3AF;2&#x3C0;f&#x3C4;)-a<Sub>2</Sub>Y(f)exp(-&#x3AF;4&#x3C0;f&#x3C4;)</Formula></P>
<P><Formula>&#x3C4;:Y(f)=&#x3C4;<Limits><M>+&#x221D;</M><M>&#x2211;</M><M>j=-&#x221D;</M></Limits>y(j)exp(-&#x3AF;2&#x3C0;jf&#x3C4;)</Formula></P>
<P><Formula>&#x3C4;</Formula>- шаг дискретизации. Передаточная функция:</P>
<P><Formula Br="Y" Num="Y" ID="ETSXDKBP"><Fraction><M>Y(f)</M><M>X(f)</M></Fraction>=H(f)=<Fraction><M>b<Sub>0</Sub></M><M>1+a<Sub>1</Sub>exp(-&#x3AF;2&#x3C0;f&#x3C4;)+a<Sub>2</Sub>exp(-&#x3AF;4&#x3C0;f&#x3C4;)</M></Fraction></Formula></P>
<P>Это передаточная функция любого рекурсивного фильтра 2-го порядка.</P>
</Modul>
