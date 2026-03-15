<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="M7MEX3FXPQ3DDMUHHB58" Level="1" ADate="EU3V2FOS" Author="Волосатова">
<Title>Медианные фильтры</Title>
<P>Алгоритмы <Term Type="Out">медианных фильтров</Term> основаны на вычислении медианы либо по всему изображению &#x2014; глобальная медианная фильтрация, либо по некоторой S-окрестности &#x2014; локальный алгоритм.</P>
<P><Formula>U<Matrix Col="1" Row="2" Alg="1"><M X="0.5" Y="1.2" Kh="1.0">вых</M><M X="0.5" Y="2.6" Kh="1.0">ij</M></Matrix>=MED(S)</Formula></P>
<P>S &#x2014; окрестность элемента <Formula>U<Matrix Col="1" Row="2" Alg="1"><M X="0.5" Y="1.2" Kh="1.0">вх</M><M X="0.5" Y="2.6" Kh="1.0">ij</M></Matrix></Formula></P>
<P>Один из алгоритмов поиска медианы- гистограммный алгоритм.</P>
<P><Font B="Y" Color="#0000FF">Гистограммный алгоритм</Font></P>
<P>Пусть элементы сигнала-Q-разрядные числа.Для S-фрагмента сигнала, в котором элемент <Formula>{D<Sub>i+m,j+m</Sub> m=&#x2212;<Limits><M>__</M><M>M,M</M><Z /></Limits> n=&#x2212;<Limits><M>__</M><M>N,N</M><Z /></Limits>}</Formula> L=(2N+1)(2M+1)</P>
<P>гистограмма <Formula>{H<Sub>q</Sub>:q=<Limits><M>____</M><M>0,G&#x2212;1</M><Z /></Limits>; G=2<Sup>Q</Sup>}</Formula></P>
<P>строится по формуле</P>
<P><Formula>H<Sub>q</Sub>=<Limits><M>M</M><M>&#x2211;</M><M>m=&#x2212;M</M></Limits> <Limits><M>N</M><M>&#x2211;</M><M>n=&#x2212;N</M></Limits>S(q,D<Sub>i+m,j+n</Sub>)<Fraction><M>1</M><M>(2N+1)(2M+1)</M></Fraction></Formula></P>
<P>H<Sub>q</Sub>-число(доля) элементов фрагмента, равных q.</P>
<P><Term Type="Out">Медиана</Term>- это средний элемент в упорядоченной по возрастанию последовательности элементов, т.е. для нахождения медианы нужно суммировать элементы гистограммы до тех пор, пока их сумма не превысит или не станет равной величине <Fraction><M>(L<Sub>s</Sub>+1)</M><M>2</M></Fraction> .&#xA0;Индекс последнего просуммированного элемента гистограммы и даст медиану.</P>
<P>Для построения гистограммы фрагмента нужно вычислить <Formula>L=(2M+1)(2N+1)</Formula> операций суммирования типа H<Sub>q</Sub>=H<Sub>q</Sub>+1, для нахождения медины &#x2014; не более <Formula>G=2<Sup>Q</Sup></Formula> циклов сравнения и суммирования</P>
<P><Formula>S&#x2265;S+H<Sub>q</Sub></Formula></P>
<P><Formula>S&lt;<Fraction><M>(N<Sub>s</Sub>+1)</M><M>2</M></Fraction> N<Sub>s</Sub>=1</Formula></P>
<P><Font B="Y" Color="#0000FF">Мультигистограммный алгоритм МФ</Font></P>
<P>Изменяя&#xA0;точность представления сигнала от 1 до Q двоичных разрядов можно определить Q гистограмм фрагмента <Formula>S={D<Sub>i+m,j+n</Sub> , m=&#x2212;<Limits><M>__</M><M>M,M</M><Z /></Limits> n=&#x2212;<Limits><M>__</M><M>N,N</M><Z /></Limits>}</Formula></P>
<P>следующим образом</P>
<P><Formula>H<Matrix Col="1" Row="2" Alg="1"><M X="0.5" Y="1.2" Kh="1.0">e</M><M X="0.5" Y="2.6" Kh="1.0">q</M></Matrix>=<Limits><M>M</M><M>&#x2211;</M><M>m=&#x2212;M</M></Limits> <Limits><M>N</M><M>&#x2211;</M><M>n=&#x2212;N</M></Limits> {2<Sup>e</Sup>(<Limits><M>e</M><M>&#x2211;</M><M>k=1</M></Limits> d<Sub>i+m,j+m,k</Sub>2<Sup>&#x2212;k</Sup>)=q}</Formula></P>
<P>q=<Limits><M>____</M><M>0,G-1</M><Z /></Limits> двоичные цифры элемента D<Sub>ij</Sub> Поиск медианы осуществляется за Q циклов сравнения: по гистограмме H<Matrix Col="1" Row="2" Alg="1"><M X="0.5" Y="1.2" Kh="1.0">1</M><M X="0.5" Y="2.6" Kh="1.0">q</M></Matrix> &#x2014; определяется значение старшего разряда медианы, по гистограмме H<Matrix Col="1" Row="2" Alg="1"><M X="0.5" Y="1.2" Kh="1.0">2</M><M X="0.5" Y="2.6" Kh="1.0">q</M></Matrix>-второго разряда медианы...</P>
<P>Каждый из Q циклов сравнения может быть выполнен параллельно.</P>
<P>С целью сокращения объема вычислений, необходимого для фильтрации, предложен приближенный метод вычисления медианы:</P>
<P>-определяются старшие разряды медианы</P>
<P>d<Matrix Col="1" Row="2" Alg="1"><M X="0.5" Y="1.2" Kh="1.0">&apos;</M><M X="0.5" Y="2.6" Kh="1.0">1</M></Matrix>, d<Matrix Col="1" Row="2" Alg="1"><M X="0.5" Y="1.2" Kh="1.0">&apos;</M><M X="0.5" Y="2.6" Kh="1.0">2</M></Matrix>,..., d<Matrix Col="1" Row="2" Alg="1"><M X="0.5" Y="1.2" Kh="1.0">&apos;</M><M X="0.5" Y="2.6" Kh="1.0">Q-t</M></Matrix></P>
<P>-младшие разрыды задаются равными</P>
<P>d<Matrix Col="1" Row="2" Alg="1"><M X="0.5" Y="1.2" Kh="1.0">&apos;</M><M X="0.5" Y="2.6" Kh="1.0">Q-t+1</M></Matrix>=1 ; d<Matrix Col="1" Row="2" Alg="1"><M X="0.5" Y="1.2" Kh="1.0">&apos;</M><M X="0.5" Y="2.6" Kh="1.0">V</M></Matrix>=0 ; Q-t+1&lt;V&#x2264; Q</P>
<P>Отличие между точными и приближенными медианами равно 2<Sup>t-1</Sup></P>
<P><Font Color="#0000FF" B="Y">Конвейерные алгоритмы МФ</Font></P>
<P>Недостаток предыдущего-сложность формирования Q гистограмм.</P>
<P>Метод основан на последовательном исключении элементов изображения больших и меньших медиан.</P>
<P>Q-разрядные элементы изображения <Formula>{U<Sub>i+m,j+n</Sub> m=&#x2212;<Limits><M>__</M><M>M,M</M><Z /></Limits> n=&#x2212;<Limits><M>__</M><M>N,N</M><Z /></Limits>}</Formula> можно представить в виде матрицы LxQ, где <Formula>L=(2M+1)(2N+1)</Formula> . Пусть <Formula>B<Sub>q</Sub>, q=<Limits><M>__</M><M>1,Q</M><Z /></Limits></Formula> столбцы матрицы размером LxQ (составлены из q-х разрядов элементов фрагмента изображения).</P>
<P><Formula>{S<Sub>q</Sub>:<Limits><M /><M>q=<Limits><M>__</M><M>1,Q</M><Z /></Limits></M><Z /></Limits>}</Formula>- векторы, указывающие исключенные элементы на q-м шаге алгоритма (включая предыдущие циклы).</P>
<P>B<Sub>0</Sub>,S<Sub>0</Sub>-единичные векторы.</P>
<P>{B<Matrix Col="1" Row="2" Alg="1"><M X="0.5" Y="1.2" Kh="1.0">0</M><M X="0.5" Y="2.6" Kh="1.0">q</M></Matrix> , B<Matrix Col="1" Row="2" Alg="1"><M X="0.5" Y="1.2" Kh="1.0">1</M><M X="0.5" Y="2.6" Kh="1.0">q</M></Matrix> q=<Limits><M>__</M><M>1,Q</M><Z /></Limits>} &#x2014; число нулей (единиц) в векторе B<Sub>q</Sub> , отмеченных нулями в соответствующих позициях S<Sub>q-1</Sub></P>
<P>Алгоритм поиска:</P>
<P><Formula>F<Sub>1</Sub>:=B<Matrix Col="1" Row="2" Alg="1"><M X="0.5" Y="1.2" Kh="1.0">0</M><M X="0.5" Y="2.6" Kh="1.0">1</M></Matrix>; t=<Fraction><M>[(2M+1)(2N+1)]</M><M>2</M></Fraction></Formula></P>
<P><Formula>&#x2200;q=<Limits><M>__</M><M>1,Q</M><Z /></Limits></Formula></P>
<P><Formula>S<Sub>q</Sub>=S<Sub>q&#x2212;1</Sub></Formula></P>
<P><Formula>if F<Sub>q</Sub>&lt;t, then {S<Sub>q</Sub>:=S<Sub>q</Sub>&amp;B<Sub>q</Sub>; F<Sub>q+1</Sub>=F<Sub>q</Sub>+B<Matrix Col="1" Row="2" Alg="1"><M X="0.5" Y="1.2" Kh="1.0">0</M><M X="0.5" Y="2.6" Kh="1.0">q+1</M></Matrix>}</Formula></P>
<P>else</P>
<P><Formula>{S<Sub>q1</Sub>=S<Sub>q</Sub>&amp;<Limits><M>_</M><M>B</M><Z /></Limits><Sub>q</Sub> ; F<Sub>q+1</Sub>:=F<Sub>q</Sub>&#x2212;B<Matrix Col="1" Row="2" Alg="1"><M X="0.5" Y="1.2" Kh="1.0">1</M><M X="0.5" Y="2.6" Kh="1.0">q+1</M></Matrix>}</Formula></P>
<P>end</P>
<P><Formula>U<Matrix Col="1" Row="2" Alg="1"><M X="0.5" Y="1.2" Kh="1.0">&apos;</M><M X="0.5" Y="2.6" Kh="1.0">ij</M></Matrix>=S<Sub>Q</Sub>&amp;{U<Sub>i+m,j+n</Sub> m=&#x2212;<Limits><M>__</M><M>M,M</M><Z /></Limits> n=&#x2212;<Limits><M>__</M><M>N,N</M><Z /></Limits>}</Formula></P>
<P>где S<Sub>q</Sub>&amp;B<Sub>q</Sub> &#x2014; конъюнкции между соответствующими элементами S<Sub>q</Sub>и B<Sub>q</Sub>.</P>
<P>S<Sub>Q</Sub>&amp;U<Sub>i+m,j+n</Sub>- выбор элемента фрагмента изображения, соответствующего позиции единицы в векторе S<Sub>Q</Sub>.</P>
<P>В результате последовательного исключения элементов изображения, больших и меньших медиан, за Q циклов, включающих в себя операции сравнения и суммирования(вычитания), определяется значение медианы.</P>
<P>Алгоритм особенно интересен для разработки специальных вычислителей.</P>
</Modul>
