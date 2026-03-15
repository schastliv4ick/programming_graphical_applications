<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="1HBEVZOZT7VXREIGXZ7U" Author="kylagin" Level="1" ADate="EUCUI79S">
<Title>Алгоритм JPEG2000(2000г)</Title>
<P>Две модификации: с потерями и без потерь.</P>
<P><Font U="Y">1шаг</Font></P>
<P>Сдвиг яркости каждой компоненты RGB для выравнивания динамического диапазона (гистограмма приближается к 0) &#x2192; увеличение степени сжатия.</P>
<P><Formula>I&apos; (x,y)=I(x,y)-2<Sup>ST-1</Sup></Formula></P>
<P>ST- свое для каждой компоненты</P>
<P>При восстановлении <Formula>I(x,y)=I&apos;(x,y)+2<Sup>ST-1</Sup></Formula></P>
<P><Font U="Y">2 шаг</Font></P>
<P>Перевод изображения из RGB &#x2192; YUV</P>
<P>а)для сжатия с потерями- обычная процедура</P>
<P>б)для сжатия без потерь:</P>
<P><Formula><LogBr><M X="0.0" Y="1.25" Kh="1.25">(</M><M X="1.25" Y="1.12" Kh="1.0"><Matrix Col="1" Row="3" Alg="1"><M X="0.49" Y="1.19" Kh="1.0">Y</M><M X="0.49" Y="2.6" Kh="1.0">U</M><M X="0.49" Y="3.99" Kh="1.0">V</M></Matrix></M><M X="2.24" Y="1.25" Kh="1.25">)</M></LogBr>=<LogBr><M X="0.0" Y="1.25" Kh="1.25">(</M><M X="1.25" Y="1.12" Kh="1.0"><Matrix Col="1" Row="3" Alg="1"><M X="0.49" Y="1.19" Kh="1.0"><Fraction><M>R+2G+B</M><M>4</M></Fraction></M><M X="0.49" Y="2.6" Kh="1.0">R-G</M><M X="0.49" Y="3.99" Kh="1.0">B-G</M></Matrix></M><M X="2.24" Y="1.25" Kh="1.25">)</M></LogBr></Formula></P>
<P>обратное преобразование:</P>
<P><Formula><LogBr><M X="0.0" Y="1.25" Kh="1.25">(</M><M X="1.25" Y="1.12" Kh="1.0"><Matrix Col="1" Row="3" Alg="1"><M X="0.49" Y="1.19" Kh="1.0">R</M><M X="0.49" Y="2.6" Kh="1.0">G</M><M X="0.49" Y="3.99" Kh="1.0">B</M></Matrix></M><M X="2.24" Y="1.25" Kh="1.25">)</M></LogBr>=<LogBr><M X="0.0" Y="1.25" Kh="1.25">(</M><M X="1.25" Y="1.12" Kh="1.0"><Matrix Col="1" Row="3" Alg="1"><M X="0.49" Y="1.19" Kh="1.0">U+G</M><M X="0.49" Y="2.6" Kh="1.0">Y-(<Fraction><M>U+V</M><M>4</M></Fraction>)</M><M X="0.49" Y="3.99" Kh="1.0">V+G</M></Matrix></M><M X="2.24" Y="1.25" Kh="1.25">)</M></LogBr></Formula></P>
<P><Font U="Y">3 шаг</Font></P>
<P>Дискретное вейвлет-преобразование (DWT)  2-х видов:</P>
<P><Font U="Y">Сжатие с потерями:</Font></P>

<Table Col="3" ID="EUCVHW9N" TTop="Y">
<P><Formula>i</Formula> </P>
<P>низкочастотное <Formula>h<Sub>L</Sub>(i)</Formula></P>
<P>высокочастотное <Formula>h<Sub>H</Sub>(i)</Formula></P>
<P>0</P>
<P>1,11508</P>
<P /><P>&#xB1;1</P>
<P /><P /><P>&#xB1;2</P>
<P /><P /><P>&#xB1;3</P>
<P /><P /><P>&#xB1;4</P>
<P /><P /></Table>
<P>Коэффициенты при восстановлении:</P>

<Table Col="3" ID="EUCVSE5D" TTop="Y">
<P><Formula>i</Formula></P>
<P>низкочастотные <Formula>g<Sub>L</Sub>(i)</Formula></P>
<P>высокочастотные <Formula>g<Sub>H</Sub>(i)</Formula></P>
<P>0</P>
<P /><P /><P>&#xB1;1</P>
<P /><P /><P>&#xB1;2</P>
<P /><P /><P>&#xB1;3</P>
<P /><P /><P>&#xB1;4</P>
<P /><P /></Table>
<P>Для сжатия без потерь:</P>

<Table Col="3" ID="EUCVWT3R" TTop="Y">
<P><Formula>i</Formula></P>
<P>сжатие      <Formula>h<Sub>L</Sub>(i)</Formula>       <Formula>h<Sub>H</Sub>(i)</Formula></P>
<P>восстановление     <Formula>g<Sub>L</Sub>(i)</Formula>        <Formula>g<Sub>H</Sub>(i)</Formula> </P>
<P>0</P>
<P><Formula> .                 6/8          1</Formula></P>
<P><Formula>.                                 1                 6/8</Formula></P>
<P>&#xB1;1</P>
<P><Formula>.                 2/8        -1/2</Formula></P>
<P><Formula>.                               1/2               -2/8</Formula></P>
<P>&#xB1;2</P>
<P><Formula><Font>.</Font>                 -1/8          0</Formula></P>
<P><Formula>.                                 0                -1/8</Formula></P>
</Table>
<P>Четные выходящие значения (низкочастотные преобразования)</P>
<P><Formula Br="Y">Y<Sub>out</Sub>(2n)=<Limits><M>N-1</M><M>&#x2211;</M><M>j=0</M></Limits>x<Sub>in</Sub>h<Sub>L</Sub>(j-2n)</Formula></P>
<P>Нечетные-высокочастотный фильтр</P>
<P><Formula>Y<Sub>out</Sub>(2n)=<Limits><M>N-1</M><M>&#x2211;</M><M>j=0</M></Limits>x<Sub>in</Sub>h<Sub>H</Sub>(j-2n-1)</Formula></P>
<P>При этом отсчеты, лежащие в начале и конце последовательностей симметрично достраиваются.</P>
<P><Font U="Y">3.1 шаг</Font></P>
<P>Далее применяется черезстрочное преобразование:</P>
<P>Четные- в начало, нечетные в конец. Это преобразование - сначала для строк, затем для столбцов.</P>
<P><Font U="Y">4 шаг</Font></P>
<P>Квантование (также как и в JPEG)</P>
<P><Font U="Y">5 шаг</Font></P>
<P>Арифметическое сжатие (MQ-кодер)</P>
</Modul>
