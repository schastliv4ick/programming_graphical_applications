<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="WAS1AV4BP3IWS1T8AK94" Author="Федорук Е.В." Level="0" ADate="EWJBNT78">
<Title>Структуры и функции</Title>
<P><Term Type="Link">Структура</Term> может быть передана <Term Type="Link">функции</Term> как <Term Type="Link">параметр</Term>. При этом на стеке в кадре вызываемой функции размещаются значения всех элементов структуры, а затем они ставятся в соответствие формальному параметру.</P>
<P>Функция может возвращать структурное значение.</P>
<P>В языке Си реализована <Term Type="Out">операция копирования структур</Term> &#x2014; присваивание значений элементов одной структуры элементам другой струтуры того же типа при помощи <Term Type="Link">операции присваивания</Term>. Первые компиляторы Си не обеспечивали этой возможности.</P>
<P>В <Link To="EWJBVK6U" /> показано, как в функцию передается структура и как функция возвращает структурное значение.</P>

<Example ID="EWJBVK6U">

<Listing>
<L>#include &lt;stdio.h&gt;</L>
<L>#include &quot;emp.h&quot;        /* содержит шаблон структуры emp */</L>
<L>int main()</L>
<L>{</L>
<L>   struct emp prgmr, raise(struct emp, double);</L>
<L>   ...</L>
<L>   printf(&quot;Old salary: %.2f\n&quot;, prgmr.salary);</L>
<L>   prgmr = raise(prgmr, .12);</L>
<L>   printf(&quot;New salary: %.2f\n&quot;, prgmr.salary);</L>
<L>}</L>
<L>struct emp raise(struct emp person, double increase)</L>
<L>{</L>
<L>  person.salary *= (1+ increase);</L>
<L>  return person;</L>
<L>}</L>
</Listing>
</Example>
<P>Данная программа выполнялась бы более эффективно, если в функцию <Operator>raise()</Operator> передавался <Term Type="Link">указатель</Term> на структуру. В этом случае при передаче управления в функцию передается лишь значение указателя, что делает доступными в функции элементы структуры. Этот вариант программы показан в <Link To="EWJC2ZXD" />.</P>

<Example ID="EWJC2ZXD">

<Listing>
<L>#include &lt;stdio.h&gt;</L>
<L>#include &quot;emp.h&quot; /* содержит шаблон структуры emp */</L>
<L>int main()</L>
<L>{</L>
<L>   struct emp prgmr;</L>
<L>   void raise(struct emp *, double);</L>
<L>   ...</L>
<L>   printf(&quot;Old salary: %.2f\n&quot;, prgmr.salary);</L>
<L>   raise(&amp;prgmr, .12);</L>
<L>   printf(&quot;New salary: %.2f\n&quot;, prgmr.salary);</L>
<L>}</L>
<L>void raise(struct emp *person, double increase)</L>
<L>{</L>
<L>person-&gt;salary *= (1+ increase);</L>
<L>}</L>
</Listing>
</Example>
</Modul>
