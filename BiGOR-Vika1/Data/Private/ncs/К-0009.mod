<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="QQV8HQAF7KXHNPHG6TGQ" Author="Горшкова" Level="0" ADate="EUOACW35">
<Title>Линейные разделяющие функции</Title>
<P>Пусть <Formula>k</Formula> - число классов,&#xA0;<Formula><Limits><M>&#x2192;</M><M>w<Sub>i</Sub></M><Z /></Limits>={w<Sub>i1</Sub>, w<Sub>i2</Sub>, ... w<Sub>in</Sub>}</Formula> - вектор весовых коэффициентов. Линейная разделяющая функция <Formula Br="Y">g<Sub>i</Sub>(<Limits><M>&#x2192;</M><M>x</M><Z /></Limits>)=w<Sub>i0</Sub>+<Limits><M>&#x2192;</M><M>w<Sub>i</Sub></M><Z /></Limits>&#x2219;<Limits><M>&#x2192;</M><M>x</M><Z /></Limits></Formula>или, если ввести обозначения:<Formula Br="Y"><Matrix Col="1" Row="2" Alg="0"><M X="0.5" Y="1.79" Kh="1.0"><Limits><M>&#x2192;</M><M>v<Sub>i</Sub></M><Z /></Limits>={w<Sub>0</Sub>, w<Sub>1</Sub>, ... w<Sub>n</Sub>}</M><M X="0.5" Y="4.16" Kh="1.0"><Limits><M>&#x2192;</M><M>y</M><Z /></Limits>={x<Sub>0</Sub>, x<Sub>1</Sub>, ... x<Sub>n</Sub>}</M></Matrix>,</Formula>где обычно выбирают x<Sub>0</Sub>=1, разделяющая функция имеет вид:<Formula Br="Y">g<Sub>i</Sub>(<Limits><M>&#x2192;</M><M>y</M><Z /></Limits>)=<Limits><M>&#x2192;</M><M>v<Sub>i</Sub></M><Z /></Limits>&#x2219;<Limits><M>&#x2192;</M><M>y</M><Z /></Limits>,</Formula>а решающее правило запишется в виде:<Formula Br="Y"><Limits><M>&#x2192;</M><M>y<Sub>m</Sub></M><Z /></Limits>&#x220A;c<Sub>i</Sub> &#x27FA;g<Sub>i</Sub>(<Limits><M>&#x2192;</M><M>y<Sub>m</Sub></M><Z /></Limits>)&#x2265;g<Sub>j</Sub>(<Limits><M X="0.33" Y="0.68" Kh="0.8">&#x2192;</M><M X="0.0" Y="1.59" Kh="1.0">y<Sub>m</Sub></M><Z /></Limits>) &#x2200;j.</Formula></P>
<P>Разделяющая поверхность описывается в этом случае уравнением:<Formula Br="Y">g(<Limits><M>&#x2192;</M><M>y</M><Z /></Limits>)=g<Sub>i</Sub>(<Limits><M>&#x2192;</M><M>y</M><Z /></Limits>)-g<Sub>j</Sub>(<Limits><M>&#x2192;</M><M>y</M><Z /></Limits>)=0.</Formula></P>
<P>Таким образом,&#xA0;необходимо найти коэффициенты <Formula>w<Sub>ij</Sub></Formula>. Нахождение коэффициентов происходит методом обучения и коррекции. Рассмотрим его на примере 2-х классов.</P>
<P>Пусть имеется 2 класса - <Formula>c<Sub>1</Sub></Formula> и <Formula>c<Sub>2</Sub></Formula>, а также векторы <Formula><Limits><M>&#x2192;</M><M>v</M><Z /></Limits></Formula> и <Formula><Limits><M>&#x2192;</M><M>y</M><Z /></Limits></Formula>. Критерий классификации:<Formula Br="Y"><Matrix Col="1" Row="2" Alg="1"><M X="0.5" Y="1.2" Kh="1.0"><Limits><M>&#x2192;</M><M>v</M><Z /></Limits>&#x2219;<Limits><M>&#x2192;</M><M>y</M><Z /></Limits>&gt;0 &#x27F9; класс c<Sub>1</Sub></M><M X="0.5" Y="2.6" Kh="1.0"><Limits><M>&#x2192;</M><M>v</M><Z /></Limits>&#x2219;<Limits><M>&#x2192;</M><M>y</M><Z /></Limits>&#x2264;0 &#x27F9; класс c<Sub>2</Sub></M></Matrix>.</Formula></P>
<P>Принцип обучения: берутся известные объекты. Если результат классификации неверный,&#xA0;то применяют &quot;наказание&quot;,&#xA0;состоящее в том, что изменяют веса,&#xA0;увеличивая или уменьшая их. Если результат верный,&#xA0;применяют &quot;поощрение&quot;, веса оставляют неизменными.</P>

<Table Col="5" ID="EUOBJJKX" TTop="Y" HMono="Y">
<P>Решение</P>
<P>Отклик</P>
<P>Решение</P>
<P>Верно?</P>
<P>Изменение весов</P>
<P><Formula><Limits><M>&#x2192;</M><M>x</M><Z /></Limits>(i)&#x220A;c<Sub>1</Sub></Formula></P>
<P>&#x2264;0</P>
<P><Formula>c<Sub>2</Sub></Formula></P>
<P>нет</P>
<P><Formula><Limits><M>&#x2192;</M><M>w</M><Z /></Limits>(i+1)=<Limits><M>&#x2192;</M><M>w</M><Z /></Limits>(i)+c<Limits><M>&#x2192;</M><M>x</M><Z /></Limits>(i)</Formula></P>
<P><Formula><Limits><M>&#x2192;</M><M>x</M><Z /></Limits>(i)&#x220A;c<Sub>1</Sub></Formula></P>
<P>&gt;0</P>
<P><Formula>c<Sub>1</Sub></Formula></P>
<P>да</P>
<P><Formula><Limits><M>&#x2192;</M><M>w</M><Z /></Limits>(i+1)=<Limits><M>&#x2192;</M><M>w</M><Z /></Limits>(i)</Formula></P>
<P><Formula><Limits><M>&#x2192;</M><M>x</M><Z /></Limits>(i)&#x220A;c<Sub>2</Sub></Formula></P>
<P>&gt;0</P>
<P><Formula>c<Sub>1</Sub></Formula></P>
<P>нет</P>
<P><Formula><Limits><M>&#x2192;</M><M>w</M><Z /></Limits>(i+1)=<Limits><M>&#x2192;</M><M>w</M><Z /></Limits>(i)-c<Limits><M>&#x2192;</M><M>x</M><Z /></Limits>(i)</Formula></P>
<P><Formula><Limits><M>&#x2192;</M><M>x</M><Z /></Limits>(i)&#x220A;c<Sub>2</Sub></Formula></P>
<P>&#x2264;0</P>
<P><Formula>c<Sub>2</Sub></Formula></P>
<P>да</P>
<P><Formula><Limits><M>&#x2192;</M><M>w</M><Z /></Limits>(i+1)=<Limits><M>&#x2192;</M><M>w</M><Z /></Limits>(i)</Formula></P>
</Table>
<P><Formula><Limits><M>&#x2192;</M><M>w</M><Z /></Limits>(i), <Limits><M>&#x2192;</M><M>w</M><Z /></Limits>(i+1)</Formula> - выборы коэффициентов на <Formula>i</Formula> и <Formula>i+1</Formula> шаге коррекции,&#xA0;<Formula><Limits><M>&#x2192;</M><M>x</M><Z /></Limits>(i)</Formula> - выбор измерений,&#xA0;<Formula>c</Formula> - некоторая константа.</P>
<P>Задача нахождения <Formula><Limits><M>&#x2192;</M><M>w</M><Z /></Limits></Formula> считается решенной,&#xA0;когда все предъявленные объекты классифицированы верно. Показано,&#xA0;что процедура сводится к конечному числу этапов,&#xA0;если классы линейно сепарабельны.</P>
<SubTitle>Выбор c</SubTitle>
<P>Пусть <Formula><Limits><M>&#x2192;</M><M>&#x3B7;</M><Z /></Limits> = <LogBr Cent="Y"><M X="-0.6" Y="3.8" Kh="2.87">{</M><M X="1.3" Y="2.87" Kh="1.0"><Matrix Col="1" Row="2" Alg="2"><M X="0.49" Y="1.79" Kh="1.0">+<Limits><M>&#x2192;</M><M>y</M><Z /></Limits>, <Limits><M>&#x2192;</M><M>x</M><Z /></Limits>&#x220A;c<Sub>1</Sub></M><M X="0.89" Y="4.16" Kh="1.0">-<Limits><M X="-0.0" Y="0.68" Kh="0.8">&#x2192;</M><M X="0.21" Y="1.59" Kh="1.0">y</M><Z /></Limits>, <Limits><M X="-0.0" Y="0.68" Kh="0.8">&#x2192;</M><M X="0.21" Y="1.59" Kh="1.0">x</M><Z /></Limits>&#x220A;c<Sub>2</Sub></M></Matrix></M><Z X="2.24" Y="1.25" Kh="1.25" /></LogBr></Formula>.</P>
<P>Процедура коррекции:<Formula Br="Y"><Limits><M>&#x2192;</M><M>v</M><Z /></Limits>(i+1) = <LogBr Cent="Y"><M X="-0.6" Y="3.8" Kh="2.87">{</M><M X="1.3" Y="2.87" Kh="1.0"><Matrix Col="1" Row="2" Alg="0"><M X="0.49" Y="1.79" Kh="1.0"><Limits><M>&#x2192;</M><M>v</M><Z /></Limits>(i)+&#x3C1;<Limits><M>&#x2192;</M><M>&#x3B7;</M><Z /></Limits>(i), <Limits><M>&#x2192;</M><M>v</M><Z /></Limits>(i)<Limits><M>&#x2192;</M><M>&#x3B7;</M><Z /></Limits>(i)&lt;0</M><M X="0.49" Y="4.16" Kh="1.0"><Limits><M>&#x2192;</M><M>v</M><Z /></Limits>(i) в остальных случаях</M></Matrix></M><Z X="2.24" Y="1.25" Kh="1.25" /></LogBr>, &#x3C1;&gt;0</Formula></P>
<P>Умножим обе части на <Formula><Limits><M>&#x2192;</M><M>&#x3B7;</M><Z /></Limits>(i)</Formula>:<Formula Br="Y"><Limits><M>&#x2192;</M><M>v</M><Z /></Limits>(i+1)<Limits><M>&#x2192;</M><M>&#x3B7;</M><Z /></Limits>(i)=[<Limits><M>&#x2192;</M><M>v</M><Z /></Limits>(i)+&#x3C1;<Limits><M>&#x2192;</M><M>&#x3B7;</M><Z /></Limits>(i)]<Limits><M>&#x2192;</M><M>&#x3B7;</M><Z /></Limits>(i).</Formula>При правильном распознавании эта величина положительна,&#xA0;т.е.<Formula Br="Y"><Limits><M>&#x2192;</M><M>v</M><Z /></Limits>(i)<Limits><M>&#x2192;</M><M>&#x3B7;</M><Z /></Limits>(i)+&#x3C1;|<Limits><M>&#x2192;</M><M>&#x3B7;</M><Z /></Limits>(i)|<Sup>2</Sup>&gt;0.</Formula>Коррекция производится только тогда, когда первый член неравенства меньше или равен нулю, &#x27F9; должно выполняться<Formula Br="Y">&#x3C1;&gt;<Fraction><M>|<Limits><M>&#x2192;</M><M>v</M><Z /></Limits>(i)<Limits><M>&#x2192;</M><M>&#x3B7;</M><Z /></Limits>(i)|</M><M>|y(i)|<Sup>2</Sup></M></Fraction>,</Formula>откуда<Formula Br="Y">&#x3C1;=&#x3BB;<Fraction><M>|<Limits><M>&#x2192;</M><M>v</M><Z /></Limits>(i)<Limits><M>&#x2192;</M><M>&#x3B7;</M><Z /></Limits>(i)|</M><M>|y(i)|<Sup>2</Sup></M></Fraction>, 0&lt;&#x3BB;&lt;2</Formula>где для сходимости <Formula>1&lt;&#x3BB;&lt;2</Formula>. Итак,<Formula Br="Y"><Limits><M>&#x2192;</M><M>v</M><Z /></Limits>(i+1) = <LogBr Cent="Y"><M X="-0.6" Y="3.8" Kh="2.87">{</M><M X="1.3" Y="2.87" Kh="1.0"><Matrix Col="1" Row="2" Alg="0"><M X="0.49" Y="1.79" Kh="1.0"><Limits><M>&#x2192;</M><M>v</M><Z /></Limits>(i)+&#x3BB;<Fraction><M>|<Limits><M>&#x2192;</M><M>v</M><Z /></Limits>(i)<Limits><M>&#x2192;</M><M>&#x3B7;</M><Z /></Limits>(i)|</M><M>|y(i)|<Sup>2</Sup></M></Fraction>, <Limits><M>&#x2192;</M><M>v</M><Z /></Limits>(i)<Limits><M>&#x2192;</M><M>&#x3B7;</M><Z /></Limits>(i)&lt;0; (-&#x3BB;<Fraction><M><Limits><M>&#x2192;</M><M>v</M><Z /></Limits>(i)<Limits><M>&#x2192;</M><M>&#x3B7;</M><Z /></Limits>(i)</M><M>|y(i)|<Sup>2</Sup></M></Fraction>)</M><M X="0.49" Y="4.16" Kh="1.0"><Limits><M>&#x2192;</M><M>v</M><Z /></Limits>(i) в противном случае</M></Matrix></M><Z X="2.24" Y="1.25" Kh="1.25" /></LogBr>.</Formula></P>
</Modul>
