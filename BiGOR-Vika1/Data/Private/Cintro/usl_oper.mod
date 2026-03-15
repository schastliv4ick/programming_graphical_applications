<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="TBUV6QUIVZIB6POJSZLA" Author="Федорук Е.В." Level="0" ADate="EV9EK84C">
<Title>Условная операция</Title>
<P>Синтаксис <Term Type="Out">условной операции</Term>:</P>
<P><Operator>выражение1 ? выражение2 : выражение3</Operator></P>
<P>Если <Operator>выражение1 </Operator><Term Type="Link">истинно</Term>, значением всего <Term Type="Link">выражения</Term> будет значение <Operator>выражения2</Operator>, иначе &#x2014; <Operator>выражения3</Operator>.</P>
<P>Вместо <Term Type="Link">оператора if-else</Term> иногда может быть использована условная операция <Operator>?:</Operator>. Она выполняет проверку и выбор между двумя значениями внутри одного выражения. В отличие от конструкции <Operator>if-else</Operator>, являющейся <Term Type="Link">оператором</Term>, эта операция может использоваться там, где <Term Type="Link">синтаксис</Term> требует указывать <Term Type="Link">выражение</Term>. Поэтому использование условного оператора <Operator>?:</Operator> зачастую является более кратким и эффективным.</P>
<P>Подобно другим операциям языка Си, условная операция <Operator>?:</Operator> указана в <Term Type="Link">таблице приоритетов</Term> операций языка Си. Это единственная операция, составленная из двух символов, разделенных между собой выражениями (в отличии от <Operator>&amp;&amp;</Operator>, <Operator>||</Operator>, <Operator>&gt;=</Operator>, <Operator>&lt;=</Operator> и т.д.). Это единственная операция, требующая три операнда.</P>

<Example ID="EV9F0MUY">

<Listing>
<L>/* Функция вычисления абсолютной величины*/</L>
<L>int abs(int x)</L>
<L>{</L>
<L>   if ( x &gt;= 0)</L>
<L>       return x;</L>
<L>   else</L>
<L>       return -x;</L>
<L>}</L>
</Listing>
</Example>

<Example ID="EV9F6NB2">

<Listing>
<L>/* Альтернативный вариант*/</L>
<L>int abs(int x)</L>
<L>{</L>
<L>   return (x &gt;= 0) ? x : -x;</L>
<L>}</L>
</Listing>
</Example>

<Example ID="EV9F9C67">
<P><Operator>largest = x &gt; max ? x : max;</Operator></P>
</Example>
</Modul>
