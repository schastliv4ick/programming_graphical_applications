<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="M7UPA9SHE6Y9WVGQ6FQK" Level="1" ADate="ETUCADFJ" Author="Волосатова">
<Title>Вычисление статистических характеристик случайных сигналов</Title>
<P>1. Функции плотности распределения вероятностей: <Formula>p(x)</Formula></P>
<P>p(x)=<Fraction><M>dP(x)</M><M>dx</M></Fraction>, где <Formula>P(x)</Formula> &#x2014; функция распределения случайной величины <Formula>x</Formula>- вероятность того, что случайная величина не превышает значения <Formula>X.</Formula> <Formula>p(x)</Formula> -вероятность нахождения в интервале <Formula>(x+dx).</Formula></P>
<P>Дискретный аналог-гистограмма распределения значений <Formula>h(m)</Formula>- относительная доля отсчетов, имеющих значение <Formula>m</Formula>.</P>
<P><Term Type="Out">Одномерная гистограмма</Term> &#x2014; описывает частоту появления значений отсчетов независимо от значений других отсчетов.</P>
<P><Term Type="Out">Многомерная гистограмма</Term> -описывает частоту совместного появления значений нескольких отсчетов сигналов.</P>
<P><Formula Br="Y" Num="Y" ID="ETUDM2MP">h(<Limits><M>&#x2192;</M><M>m</M><Z /></Limits>)=<Fraction><M>1</M><M>N</M></Fraction><Limits><M>N&#x2212;1</M><M>&#x2211;</M><M>k=0</M></Limits>&#x3B4;(<Limits><M>&#x2192;</M><M>m</M><Z /></Limits>&#x2212;<Limits><M>&#x2192;</M><M>m</M><Z /></Limits><Sub>k</Sub>) ;</Formula><Formula><Limits><M>&#x2192;</M><M>m</M><Z /></Limits><Sub>k</Sub></Formula>-вектор значений компонент к-ого отсчета сигнала; <Limits><M>&#x2192;</M><M>m</M><Z /></Limits> &#x2014; вектор значений компонент аргумента гистограммы <Formula><Limits><M>&#x2192;</M><M>m</M><Z /></Limits>=(m<Sub>0</Sub>,m<Sub>1</Sub>,...,m<Sub>k&#x2212;1</Sub>)</Formula></P>
<P><Font U="Y">Определение средних значений величины m:</Font></P>
<P>По определению :</P>
<P><Formula Br="Y" Num="Y" ID="ETUDTV7M"><Limits><M>_</M><M>m</M><Z /></Limits> =<Limits><M>M</M><M>&#x2211;</M><M>m=0</M></Limits>mh(m)=<Fraction><M>1</M><M>N</M></Fraction><Limits><M>N&#x2212;1</M><M>&#x2211;</M><M>k=0</M></Limits>m<Sub>k</Sub></Formula></P>
<P>Вычисление локального среднего</P>
<P><Formula Br="Y" Num="Y" ID="ETUDXNI4"><Limits><M>_</M><M>m</M><Z /></Limits>(r)=<Fraction><M>1</M><M>2N<Sub>1</Sub>+1</M></Fraction> <Limits><M X="0.1" Y="0.79" Kh="0.8">N<Sub>1</Sub></M><M X="0.0" Y="2.04" Kh="1.0">&#x2211;</M><M X="0.1" Y="3.08" Kh="0.8">k=N<Sub>1</Sub></M></Limits>m<Sub>r&#x2212;k</Sub></Formula></P>
<P>по окрестности вблизи отсчета <Formula>r</Formula> размера <Formula>2N<Sub>1</Sub>+1</Formula> элементов.</P>
</Modul>
