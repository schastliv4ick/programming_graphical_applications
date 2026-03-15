<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="YI45MFW8KM72QPT2NESB" Author="Федорук Е.В." Level="0" ADate="EVQJP2RB">
<Title>Макросы</Title>
<P><Term Type="Out">Макрос</Term> &#x2014; это короткая процедура, у которой могут быть аргументы.</P>
<P>Макрос определяется с помощью диретивы <Term Type="Link">препроцессора</Term> <Operator>#define</Operator>.</P>
<P>Определение макроса похоже на определение <Term Type="Link">поименованной константы</Term>.</P>
<P><Operator>#define идентификатор(аргумент[,аргумент]...) строка-шаблон</Operator></P>
<P>В скобках непосредственно после <Term Type="Link">идентификатора</Term> могут быть указаны имена аргументов. Между идентификатором и символом <Operator>(</Operator> не должно быть символов промежутка. При расширении макроса <Term Type="Link">препроцессор</Term> осуществляет вставку строк. Препроцессор ничего не знает о <Term Type="Link">синтаксисе</Term> <Term Type="Link">языка Си</Term> или логике программы. Поэтому такие подстановки могут быть источниками синтаксических ошибок.</P>

<Example ID="EVQO1X52">

<Listing>
<L>#define SQUARE(X) ((X) * (X))</L>
<L>#define MAX(A,B) ((A) &gt; (B) ? (A) : (B))</L>
<L>int main()</L>
<L>{</L>
<L>  int int1, int2;</L>
<L>  int1 = SQUARE(3);</L>
<L>  int2 = SQUARE(int1 + 1);</L>
<L>  printf(&quot;max = %d\n&quot;, MAX(int1,int2));</L>
<L>}</L>
<L>Результат препроцессирования:</L>
<L>int main()</L>
<L>{</L>
<L>  int int1, int2;</L>
<L>  int1 = ((3) * (3));</L>
<L>  int2 = ((int1 + 1) * (int1 + 1));</L>
<L>  printf (&quot;max = %d\n&quot;, ((int1) &gt; (int2) ? (int1) : (int2)));</L>
<L>}</L>
<L>Вывод программы:</L>
<L>max = 100</L>
</Listing>
</Example>
<P>Если в примере 1 в определении <Operator>SQUARE</Operator> не будут использованы скобки, то переменной <Operator>int2</Operator> будет присвоено другое значение:</P>
<P><Operator>int2 = int1 + 1 * int1 + 1;</Operator></P>
<P>Для просмотра результата препроцессирования надо использовать команду компиляции <Operator>cc</Operator> с опцией <Operator>-P</Operator>.</P>
<P>Макрос может использовать другие ранее определенные макросы. Многие препроцессоры Си, включая препроцессор системы <Term Type="Link">UNIX</Term>, не допускают использования рекурсивных макросов.</P>
<P>Иногда удобно определять макрос так, чтобы он был <Term Type="Link">блоком операторов</Term>.</P>
<P>Одно из преимуществ блока &#x2014; возможность определить локальные переменные. Если только макрос содержит более одного оператора, эти операторы должны быть включены в блок, иначе возможны неприятности.</P>

<Example ID="EVQOM86P">

<Listing>
<L>/* Эти операторы следует заключить в блок */</L>
<L>#define DOIT(A, B, C) A = D * 2; \</L>
<L>                      B = C * 2;</L>
<L>void f(void)</L>
<L>{</L>
<L>   int i, j, k;</L>
<L>   if (i &lt; j)</L>
<L>       DOIT(i, j, k) /* Здесь после обработки препроцессором будет синтаксическая ошибка */</L>
<L>   else</L>
<L>      printf(&quot;Something \n&quot;);</L>
</Listing>
</Example>
<P>Хотя этот фрагмент программы и выглядит корректно, однако после расширения препроцессором компилятор обнаружит ошибку. Синтаксис <Term Type="Link">оператора if-else</Term> требует единственного оператора между <Operator>if </Operator>и <Operator>else</Operator>. В такой ситуации использование блока в макросе устранит проблему.</P>
<P><Term Type="Link">Стандарт ANSI</Term> запрещает макроподстановки в строковых литералах.</P>
<SubTitle>Орерация #</SubTitle>
<P><Term Type="Out">Операция #</Term>- операция для создания строки из аргумента макроса.</P>

<Example ID="EVQP4VD1">
<P>Определение макроса:</P>
<P><Operator>#define string(x) #x</Operator></P>
<P>Использование макроса:</P>
<P><Operator>string(hello)</Operator></P>
<P>Результат подстановки:</P>
<P><Operator>&quot;hello&quot;</Operator></P>
</Example>

<Example ID="EVQOY3EC">

<Listing>
<L>#define SWAP(A,B) {int temp; \</L>
<L>                    temp = A;\</L>
<L>                    A = B;\</L>
<L>                    B =temp; \</L>
<L>                    }</L>
<L>#define PRINT(A,B) \</L>
<L>            printf(#A&quot;: %d, &quot;#B&quot;: %d\n&quot;, A, B)</L>
<L>int main( )</L>
<L>{</L>
<L>  int num1 = 30, num2 = 90;</L>
<L>  PRINT(num1, num2);</L>
<L>  if (num2 &gt; num1)</L>
<L>     SWAP(num1, num2);</L>
<L>  PRINT(num1, num2);</L>
<L>}</L>
</Listing>
<P>Вывод программы:</P>

<Listing>
<L>num1: 30, num2: 90</L>
<L>num1: 30, num2: 90</L>
</Listing>
</Example>
<SubTitle>Орерация ##</SubTitle>
<P><Term Type="Out">Операция ##</Term> &#x2014; операция для объединения лексем в определении макросов одну лексему .</P>

<Example ID="EVQPLJ83">

<Listing>
<L>#define WheatBread 0</L>
<L>#define RyeBread 1</L>
<L>#define WhiteBread 2</L>
<L>#define PumpernickelBread 3</L>
<L>#define Bread(x) x ## Bread</L>
<L>int main ()</L>
<L>{</L>
<L>    printf(&quot;Value of WheatBread is %d\n&quot;, Bread(Wheat));</L>
<L>    printf(&quot;Value of RyeBread is %d\n&quot;, Bread(Rye));</L>
<L>    printf(&quot;Value of WhiteBread is %d\n&quot;, Bread(White));</L>
<L>    printf(&quot;%c\n&quot;,&apos;??=&apos;);</L>
<L>    printf(&quot;%c\n&quot;,&apos;??&apos;&apos;);</L>
<L>    printf(&quot;%c\n&quot;,&apos;??!&apos;);</L>
<L>    printf(&quot;%c\n&quot;,&apos;??-&apos;);</L>
<L>}</L>
</Listing>
<P>Вывод:</P>

<Listing>
<L>Value of WheatBread is 0</L>
<L>Value of RyeBread is 1</L>
<L>Value of WhiteBread is 2</L>
<L>#</L>
<L>^</L>
<L>|</L>
<L>~</L>
</Listing>
</Example>
<P>Вызов макроса <Operator>Bread(Rye)</Operator> расширяется сначала в <Operator>Rye##Bread</Operator>, потом &#x2013; в одно слово <Operator>RyeBread</Operator>, заменяемое затем константой <Operator>1</Operator>.</P>
<SubTitle>Сравнение функций и макросов</SubTitle>
<P>Большим преимуществом <Term Type="Link">макросов</Term> является то, что они быстрее <Term Type="Link">функций</Term>. Потери времени при <Term Type="Link">вызове функции</Term> включают в себя время на сохранение <Term Type="Link">аргументов</Term> и регистров на <Term Type="Link">стеке</Term> и восстановление их при возврате. При вызове макроса этого не происходит.</P>
<P>Однако, если макрос используется много раз, исполняемая программа будет иметь больший размер, чем при использовании функций.</P>
<P>Преимуществом функций является возможность возвратить результат при помощи <Term Type="Link">оператора return</Term>. В макросе оператор <Operator>return</Operator> вызовет немедленный выход из функции, в которой вызван макрос.</P>
<P>Кроме того, функции могут быть <Term Type="Link">рекурсивными</Term>. Большая же часть <Term Type="Link">препроцессоров</Term> Си (в том числе и в операционной системе UNIX) запрещают рекурсивные макросы.</P>
<P>К тому же макросы сложнее для отладки, чем функции. Отлаживая макрос, надо смотреть на результат работы препроцессора. Для этого в операционной системе UNIX можно воспользоваться следующими командами:</P>
<P><Operator>$cc -Xa -P proc.c</Operator></P>
<P><Operator>$cat proc.i</Operator></P>
</Modul>
