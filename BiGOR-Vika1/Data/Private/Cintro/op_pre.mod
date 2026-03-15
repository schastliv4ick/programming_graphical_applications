<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="CSX1FSGW4YZEQNV2890F" Author="Федорук Е.В." Level="0" ADate="EV85HAKG">
<Title>Операция приведения</Title>
<P><Term Type="Out">Приведение</Term> &#x2014; это операция, используемая для временного преобразования значения выражения одного типа в данные другого типа. Операция приведения является <Term Type="Link">унарной</Term> операцией:</P>
<P><Operator>(тип)операнд</Operator></P>
<P><Term Type="Link">Тип</Term> задается <Term Type="Link">ключевым словом</Term>.</P>
<P>Подобно другим операциям <Term Type="Link">языка Си</Term> операция приведение указано в <Term Type="Link">таблице приоритетов</Term> операций.</P>

<Example ID="EV85J0CE">

<Listing>
<L>int main ( )</L>
<L>{</L>
<L>  float func(float);</L>
<L>  int x;</L>
<L /><L>  func ((float)x);</L>
<L>  func (x);</L>
<L>. . .</L>
<L>}</L>
<L>float func(float)</L>
<L>{</L>
<L>  float z;</L>
<L>. . .</L>
<L>  return z;</L>
<L>}</L>
</Listing>
</Example>
<P>В примере при вызове <Term Type="Link">функции</Term> <Operator>func() </Operator>ее <Term Type="Link">фактический параметр</Term> (переменная <Term Type="Link">целого типа</Term> <Operator>x</Operator>) явно приводится к <Term Type="Link">вещественному</Term> типу <Operator>float</Operator>, так как функция <Operator>func()</Operator> требует вещественного значения <Term Type="Link">аргумента</Term>. Хорошим стилем программирования является передача функции параметров ожидаемого ею типа.</P>
<P>Если при <Term Type="Link">вызове функции</Term> не выполняется явное приведение типа фактического параметра, как во втором вызове в примере, компилятор выполнит его сам некоторым способом (ему известно, что <Operator>func()</Operator> ожидает параметр типа <Operator>float</Operator> из прототипа объявления функции). Использование приведения делает текст программы более понятным, поскольку пожелания программиста указаны явно.</P>
<P>Другое использование операции приведения показано в следующем примере.</P>

<Example ID="EV8647W9">

<Listing>
<L>int x, y;</L>
<L>float result;</L>
<L>result = (float)x / (float)y;</L>
</Listing>
</Example>
<P>Значение переменной <Operator>result</Operator> будет иметь дробную часть. Если бы операция приведения не использовалась, то дробная часть результата была бы потеряна.</P>
</Modul>
