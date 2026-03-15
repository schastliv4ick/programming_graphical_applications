<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="H8I665WCZ42HQILAIM7D" Author="Федорук Е.В." Level="0" ADate="EV9DNUML">
<Title>Оператор return</Title>
<P><Term Type="Link">Функция</Term> может передавать одно значение обратно в <Term Type="Link">вызывающую функцию</Term>.</P>
<P><Term Type="Link">Тип</Term> <Term Type="Link">возвращаемого значения</Term> определяется в <Term Type="Link">определении прототипа функции</Term> и объявляется в <Term Type="Link">объявлении прототипа функции.</Term></P>
<P>Функция возвращает значение с помощью <Term Type="Out">оператора возврата return</Term>.</P>
<P><Term Type="Link">Синтаксис</Term> оператора возврата <Operator>return</Operator>:</P>
<P><Operator>return выражение</Operator><Operator>;</Operator></P>
<P>При выходе на оператор <Operator>return</Operator> выполняется возврат из функции так, что управление вновь передается в вызывающую функцию. В случае если оператор <Operator>return</Operator> имеет выражение, значением <Term Type="Link">вызова функции</Term> является значение этого <Term Type="Link">выражения</Term>. Если оператор <Operator>return</Operator> не имеет выражениеня , значение вызова функции не определено.</P>
<P>Функция может иметь более одного оператора <Operator>return</Operator>.</P>

<Example ID="EV9DYG60">

<Listing>
<L>int func1(void)</L>
<L>{</L>
<L>...</L>
<L>if (n==0 || n==1)</L>
<L>   return 1;</L>
<L>else</L>
<L>   return 0;</L>
<L>}</L>
</Listing>
</Example>

<Example ID="EV9EC6WJ">

<Listing>
<L>void func2(void)</L>
<L>{</L>
<L>...</L>
<L>return ;</L>
<L>}</L>
</Listing>
</Example>
<P>В <Link To="EV9DYG60" /> функция <Operator>func1()</Operator> возвращает значение <Term Type="Link">целого типа</Term>. В <Link To="EV9EC6WJ" /> функция <Operator>func2()</Operator> не возвращает никакого значения.</P>
<P><Term Type="Link">Функция main()</Term> может использовать оператор <Operator>return </Operator>для возврата некоторого целого значения в родительский процесс.</P>

<Example ID="EV9E0EU2">

<Listing>
<L>#include &lt;stdio.h&gt;</L>
<L>int main ()</L>
<L>{</L>
<L>   int area_rect (int, int);</L>
<L>   int len = 50, width = 4, area;</L>
<L /><L>   area = area_rect (len, width);</L>
<L>   printf (&quot;Area is %d \n&quot;, area);</L>
<L>   return 0;</L>
<L>}</L>
<L /><L>int area_rect (int l, int w)</L>
<L>{</L>
<L>/*площадь прямоуголника*/</L>
<L>   return l*w;</L>
<L>}</L>
</Listing>
</Example>
<SubTitle>Функции, возвращающие указатели</SubTitle>
<P><Term Type="Link">Функция</Term> может возвращать <Term Type="Link">указатель</Term>. При этом она должна быть определена и объявлена соответствующим образом. Например, если функция возвращает указатель на целое, ее определение обычно имеет вид:</P>

<Listing>
<L>int *f(void)</L>
<L>{</L>
<L>. . .</L>
<L>}</L>
</Listing>
<P>Кроме того, функция должна быть объявлена в некоторой <Term Type="Link">вызывающей функции</Term> или выше всех таких функций по тексту программы.</P>

<Example ID="EXIZ175W">

<Listing>
<L>main ()</L>
<L>{</L>
<L>int *f(void);</L>
<L>...</L>
<L>}</L>
</Listing>
</Example>

<Example ID="EXIZ175X">

<Listing>
<L>int *f(void);</L>
<L>main ()</L>
<L>{</L>
<L>...</L>
<L>}</L>
</Listing>
</Example>

<Example ID="EXIZ175Y">

<Listing>
<L>#include &quot;local.h&quot;</L>
<L>main ()</L>
<L>{</L>
<L>...</L>
<L>}</L>
</Listing>
</Example>
<P>В <Link To="EXIZ175W" /> объявление известно внутри <Term Type="Link">функции main()</Term>. В <Link To="EXIZ175X" />, подобно <Term Type="Link">внешней</Term> переменной, объявление известно всем функциям, расположенным ниже его в исходном тексте программы. Объявление может предваряться <Term Type="Link">ключевым словом</Term> <Operator>extern</Operator>. Прим. 6 напоминает, что объявления функций часто находятся в файлах заголовков, область действия этих объявлений такая же, как в <Link To="EV9EC6WJ" />.</P>

<Example ID="EXIZ175Z">

<Listing>
<L>/* main () - передает адрес массива, содержащего город и улицу,</L>
<L>в функцию getstreet(), которая возвращает указатель на улицу*/</L>
<L>#include &lt;stdio.h&gt;</L>
<L>int main ()</L>
<L>{</L>
<L>   char *getstreet (char *);</L>
<L>   static char info[] = &quot;Москва, Арбат&quot;;</L>
<L /><L>   printf (&quot;Улица %s\n&quot;, getstreet(info));</L>
<L>}</L>
<L>/* Предполагается, что p указывает на строку вида &quot;Город, Улица&quot; */</L>
<L>char *getstreet(char *p)</L>
<L>{</L>
<L>  while ( *p != &apos;,&apos;)</L>
<L>    p++;</L>
<L>  return p + 2;</L>
<L>}</L>
<L>Вывод:</L>
<L>Улица Арбат</L>
</Listing>
</Example>
</Modul>
