<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="JV3Z329J6EJFBJYT59T5" Author="kylagin" Level="1" ADate="EU3U6K74">
<Title>Параллельное вычисление по группам элементов входного изображения</Title>
<P><Font Color="#0000FF">а)</Font> Представим соотношение <Formula>D<Matrix Col="1" Row="2" Alg="0"><M X="0.5" Y="1.2" Kh="1.0">&apos;</M><M X="0.5" Y="2.6" Kh="1.0">ij</M></Matrix>=<Limits><M>M</M><M>&#x2211;</M><M>m=&#x2212;M</M></Limits> <Limits><M>N</M><M>&#x2211; </M><M>n=&#x2212;N</M></Limits> <Fraction><M>1</M><M>(2M+1)(2N+1)</M></Fraction>&#x3B4;(D<Sub>i&#x2212;m,j&#x2212;n</Sub>&#x2264;D<Sub>ij</Sub>)</Formula></P>
<P><Formula Br="Y" Num="Y" ID="EU3UFQQQ">D<Matrix Col="1" Row="2" Alg="0"><M X="0.5" Y="1.2" Kh="1.0">&apos;</M><M X="0.5" Y="2.6" Kh="1.0">ij</M></Matrix>=<Limits><M>M</M><M>&#x2211;</M><M>m=&#x2212;M</M></Limits>S<Matrix Col="1" Row="2" Alg="0"><M X="0.5" Y="1.2" Kh="1.0">&apos;</M><M X="0.5" Y="2.6" Kh="1.0">ijm</M></Matrix>,</Formula></P>
<P>где <Formula Br="Y" Num="Y" ID="EU3UG43Y">S<Matrix Col="1" Row="2" Alg="0"><M X="0.5" Y="1.2" Kh="1.0">&apos;</M><M X="0.5" Y="2.6" Kh="1.0">ijm</M></Matrix>=<Limits><M>N</M><M>&#x2211; </M><M>n=&#x2212;N</M></Limits>&#x3B4;(D<Sub>i&#x2212;m,j&#x2212;n</Sub>&#x2264;D<Sub>ij</Sub>)</Formula></P>
<P>Вычисления по формуле <Link To="EU3UG43Y" /> <Formula>S<Matrix Col="1" Row="2" Alg="0"><M X="0.5" Y="1.2" Kh="1.0">&apos;</M><M X="0.5" Y="2.6" Kh="1.0">ijm</M></Matrix></Formula> можно выполнять параллельно, так как количество сумм равно <Formula>(2М+1)</Formula>, то во столько раз увеличится быстродействие.</P>
<P><Font Color="#0000FF">б)</Font> Если ввести в состав процессора <Formula>(2М+1)</Formula><Formula>(2N+1)</Formula> компараторов и один суммарор, имеющих <Formula>(2М+1)</Formula><Formula>(2N+1)</Formula> одноразрядных входов, то алгоритм можно представить</P>
<P><Formula>V<Sub>i</Sub>:=<Limits><M>__</M><M>1,I</M><Z /></Limits></Formula></P>
<P><Formula>V<Sub>j</Sub>:=<Limits><M>__</M><M>1,J</M><Z /></Limits></Formula></P>
<P><Formula>R<Sub>m,n</Sub>:=&#x3B4;(D<Sub>i&#x2212;m,j&#x2212;n</Sub>&#x2264;D<Sub>ij</Sub>)</Formula></P>
<P><Formula>D<Matrix Col="1" Row="2" Alg="0"><M X="0.5" Y="1.2" Kh="1.0">&apos;</M><M X="0.5" Y="2.6" Kh="1.0">ij</M></Matrix>=<Limits><M>M</M><M>&#x2211;</M><M>m=&#x2212;M</M></Limits> <Limits><M>N</M><M>&#x2211; </M><M>n=&#x2212;N</M></Limits>R<Sub>m,n</Sub></Formula></P>
<P>Для повышения быстродействия можно организовать параллельную работу компараторов и сумматороа <Operator>S</Operator>, с использованием конвейерной организации, как это было использовано для процессора свертуи.</P>
</Modul>
