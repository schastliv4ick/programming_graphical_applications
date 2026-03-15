<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="H0VFGCPM8NSW8VK2640G" Author="kylagin" Level="1" ADate="ETN2TB44">
<Title>Вычисление цифровой свертки с использованием БПФ</Title>
<P>В основе лежит свойство преобразования Фурье от свертки, которые, как оказывается, справедливо соответственно и для дискретной свертки.</P>
<P><Font U="Y">Теорема о циклической свертке</Font></P>
<P><Formula Br="Y" Num="Y" ID="ETN331H9"><Limits><M>N-1</M><M>&#x2211;</M><M>n=0</M></Limits>U<Sub>n</Sub>h<Sub>(k-n)modN</Sub><Limits><Z /><M>  &#x2194;</M><M>     ДПФ</M></Limits>   NV<Matrix Col="1" Row="2" Alg="0"><M X="0.49" Y="1.19" Kh="1.0">ф</M><M X="0.49" Y="2.6" Kh="1.0">e</M></Matrix>H<Free><M Y="1.0">ф</M><M Y="2.5">e</M></Free>   ,</Formula>т.е. ДПФ от циклической свертки равно произведению Фурье-образов свертываемых функций.</P>
<P><Font U="Y">Доказательство:</Font></P>
<P>Пусть H<Free><M Y="1.0">ф</M><M Y="2.5">e</M></Free> - ДПФ {h<Sub>n</Sub>}  ,  V<Matrix Col="1" Row="2" Alg="0"><M X="0.49" Y="1.19" Kh="1.0">ф</M><M X="0.49" Y="2.6" Kh="1.0">e</M></Matrix>-ДПФ {U<Sub>n</Sub>}</P>
<P>Рассмотрим , чему будет равно <Formula>ДПФ<Sup>-1</Sup></Formula> от произведения <Formula>H<Free><M Y="1.0">ф</M><M Y="2.5">e</M></Free></Formula> и <Formula>V<Matrix Col="1" Row="2" Alg="0"><M X="0.49" Y="1.19" Kh="1.0">ф</M><M X="0.49" Y="2.6" Kh="1.0">e</M></Matrix></Formula></P>
<P>Имеем:</P>
<P><Formula>ДПФ<Sup>-1</Sup>(H<Free><M Y="1.0">ф</M><M Y="2.5">e</M></Free>V<Matrix Col="1" Row="2" Alg="0"><M X="0.49" Y="1.19" Kh="1.0">ф</M><M X="0.49" Y="2.6" Kh="1.0">e</M></Matrix>)=<Fraction><M>1</M><M>N</M></Fraction><Limits><M>N-1</M><M>&#x2211;</M><M>l=0</M></Limits>V<Matrix Col="1" Row="2" Alg="0"><M X="0.49" Y="1.19" Kh="1.0">ф</M><M X="0.49" Y="2.6" Kh="1.0">e</M></Matrix>H<Free><M Y="1.0">ф</M><M Y="2.5">e</M></Free>exp(2&#x3C0;&#x3AF;<Fraction><M>kl</M><M>N</M></Fraction>)=<Fraction><M>1</M><M>N</M></Fraction><Limits><M>N-1</M><M>&#x2211;</M><M>l=0</M></Limits>  <Limits><M>N-1</M><M>&#x2211;</M><M>n=0</M></Limits>U<Sub>n</Sub>H<Free><M Y="1.0">ф</M><M Y="2.5">e</M></Free>exp[2&#x3C0;&#x3AF;<Fraction><M>l(k-n)</M><M>N</M></Fraction>]=</Formula></P>
<P>Используя свойство (3) ДПФ о сдвиге,  нетрудно увидеть</P>
<P><Formula>=<Fraction><M>1</M><M>N</M></Fraction><Limits><M>N-1</M><M>&#x2211;</M><M>n=0</M></Limits>U<Sub>n</Sub>h<Sub>(k-n)modN</Sub></Formula>  , что и т.д.</P>
<P>Таким образом получается циклическая свертка, т.е. свертка двух функций, периодически продолженных за пределы заданного интервала.</P>
<P><Font U="Y">Отличие от обычной свертки:</Font></P>
<P>Рассмотрим </P>
<P><Formula>U<Sub>вых,k</Sub>=<Limits><M>N-1</M><M>&#x2211;</M><M>n=0</M></Limits>U<Sub>вх,n</Sub>h<Sub>k-n </Sub></Formula> - обычная свертка</P>
<P><Formula><Limits><M>&#x223C;</M><M>U</M><Z /></Limits><Sub>вых,k</Sub>=<Limits><M>N-1</M><M>&#x2211;</M><M>n=0</M></Limits>U<Sub>вх,n</Sub>h<Sub>(k-n)modN </Sub></Formula>  - циклическая свертка</P>
<P>Получим, что при <Formula>k</Formula> близких к 0 или <Formula>N-1</Formula> в свертке участвуют не соседние отсчеты <Formula>h</Formula>, а удаленные от него на всю длину последовательности <Formula>N</Formula>. Для борьбы с этими краевыми эффектами принимают принудительное удлинение сигнала и импульса отклика с доопределением их значений.</P>
<P>Принцип доопределения:</P>
<P>Пусть <Formula>W<Sub>k</Sub></Formula>- линейная свертка</P>
<P><Formula>W<Sub>k</Sub>=<Limits><M>N-1</M><M>&#x2211;</M><M>n=0</M></Limits>h<Sub>(k-n)</Sub>U(n)</Formula></P>
<P>Очевидно, что <Formula>W<Sub>k</Sub></Formula> определена для всех <Formula>k</Formula>:</P>
<P><Formula>0&#x2264;k&#x2264;2N-1</Formula></P>
<P>Рассмотрим циклическую свертку:</P>
<P><Formula Br="Y" Num="Y" ID="ETN521OG">y<Sub>k</Sub>=<Limits><M>N-1</M><M>&#x2211;</M><M>n=0</M></Limits>U(n)h<Sub>(k-n)modN </Sub></Formula>Очевидно, что последовательность <Formula>h(n)</Formula> и <Formula>U(n)</Formula> необходимо доопределить до длины <Formula>2N-1</Formula>. Доопределение производится нулями. В этом случае циклическая свертка переходит в линейную.</P>
<P>Итак алгоритм вычисления следующий:</P>
<P />
<List Num="Y">
<P>Пусть N<Sub>1</Sub>-размер сигнала U, а N<Sub>2</Sub>-размер импульсного отклика h. Выберем N=N<Sub>1</Sub>+N<Sub>2</Sub>-1</P>
<P>Дополним <Formula>U</Formula> и <Formula>h</Formula> необходимым количеством нулей для заполнения области <Formula>N</Formula>.</P>
<P>Вычислим <Formula>N</Formula>&#xA0;точечное БПФ <Formula>U</Formula> и <Formula>h</Formula>.</P>
<P>Вычислим произведение U<Sup>Ф</Sup>(k) h<Sup>ф</Sup>(k)</P>
<P>Найдем обратное N точечное БПФ  от произведения П.Ч.</P>
</List>

<List Num="Y" /><P>Дополнение нулями приводит к увеличению числа операций. Поэтому использование БПФ приводит к выигрышу лишь для больших значений <Formula>N</Formula>.</P>
<P> </P>
</Modul>
