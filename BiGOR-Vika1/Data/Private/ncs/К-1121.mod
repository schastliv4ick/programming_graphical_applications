<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="V54BDVAKUAI7ENB65T9Y" Author="Горшкова" Level="0" ADate="EU1FDESB">
<Title>Рекурсивный алгоритм фильтрации импульсных помех</Title>
<P>Алгоритм <Font>(1 предыд.модуля)</Font> требует 2 прохода. Его можно упростить, если для вычисления локального среднего использовать не 4 отсчета,&#xA0;соседних с данным на растре,&#xA0;а только 2 уже обработанных отсчета, предшествующих данному. В результате получаем следующий рекурсивный алгоритм фильтрации:<Formula Br="Y"><Limits><M>&#x2227;</M><M>a<Sub>k</Sub></M><Z /></Limits>=<LogBr><M X="0.0" Y="1.25" Kh="1.25">{</M><M X="1.25" Y="1.12" Kh="1.0"><Matrix Col="1" Row="2" Alg="0" Cent="Y"><M X="0.5" Y="1.87" Kh="1.0">b<Sub>k</Sub>, если |d|&lt;&#x3B4;<Sub>1</Sub></M><M X="0.5" Y="4.41" Kh="1.0"><Limits><M>&#x2014;</M><M>b<Sub>k</Sub></M><Z /></Limits>+&#x3B4;<Sub>2</Sub>&#x2219;sign(d) в противном случае,</M></Matrix></M><Z X="2.25" Y="1.25" Kh="1.25" /></LogBr></Formula>где <Formula>d=b<Sub>k</Sub>-<Limits><M>&#x2014;</M><M>b<Sub>k</Sub></M><Z /></Limits></Formula>, <Formula><Limits><M>&#x2014;</M><M>b<Sub>k</Sub></M><Z /></Limits>=(b<Sub>k-2</Sub>+b<Sub>k-1</Sub>)/2</Formula>.</P>
<P>Порог <Formula>&#x3B4;<Sub>2</Sub></Formula> вводится, чтобы обеспечить устойчивость алгоритма, и выбирается равным <Formula>3-4%</Formula> размаха значений сигнала.</P>
</Modul>
