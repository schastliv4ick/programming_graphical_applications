<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="HGCM1KIIW333WL574UKD" Author="Федорук Е.В." Level="0" ADate="EW2355FF">
<Title>Передача адреса в функцию</Title>
<P>Если в <Term Type="Link">функцию</Term> передается адрес переменной, то функция может изменять значение этой переменной. Если функция предполагает, что значением ее <Term Type="Link">параметра</Term> будет адрес, этот параметр должен быть объявлен в функции как <Term Type="Link">указатель</Term>.</P>
<P>Для передачи функции адреса переменной используется <Term Type="Out">операция получения адреса</Term> <Operator>&amp;</Operator>:</P>
<P><Operator>&amp;операнд</Operator></P>
<P>Это унарная операция, приоритет которой определяется по <Term Type="Link">таблице приоритетов</Term> операций языка Си. В качестве операнда может использоваться <Term Type="Link">именующее выражение</Term>. Результат операции &#x2014; адрес обЪекта, определяемого операндом.</P>
<P>Для объявления <Term Type="Link">формального параметра</Term> функции как адреса используется <Term Type="Link">операция косвенного доступа</Term> <Operator>*</Operator>.</P>

<Example ID="EW2373KX">

<Listing>
<L>#include &lt;stdio.h&gt;</L>
<L>int room1 = 19, room2 = 24;</L>
<L>int main ()</L>
<L>{</L>
<L>  int num1 = 10, num2 = 5;</L>
<L>  void swap (int *, int *);</L>
<L /><L>  printf (&quot;%d %d\n&quot;, num1, num2);</L>
<L>  swap(&amp;num1, &amp;num2);</L>
<L>  printf (&quot;%d %d\n&quot;, num1, num2);</L>
<L>  printf (&quot;%d %d\n&quot;, room1, room2);</L>
<L>  swap(&amp;room1, &amp;room2);</L>
<L>  printf (&quot;%d %d\n&quot;, room1, room2);</L>
<L>}</L>
<L>void swap (int *one, int *two)</L>
<L>{</L>
<L>  int temp;</L>
<L>  temp =*one;</L>
<L>  *one = *two;</L>
<L>  *two = temp;</L>
<L>}</L>
<L>вывод:</L>
<L>5</L>
<L>5</L>
<L>10</L>
</Listing>
</Example>
<P>При вызове функции <Operator>swap(&amp;room1, &amp;room2) </Operator><Term Type="Link">фактическими параметрами</Term> будут значения адресов переменных <Operator>room1</Operator> и <Operator>room2</Operator>, которые будут ставиться в соответствие формальным параметрам <Operator>one</Operator> и <Operator>two</Operator>. Использование операции косвенного доступа <Operator>*one</Operator> и <Operator>*two</Operator> в функции <Operator>swap()</Operator>делает доступными сами переменные <Operator>room1</Operator> и <Operator>room2</Operator>.</P>
</Modul>
