<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="VJAUOI97IGWS4RERD2E9" Author="Федорук Е.В." Level="0" ADate="EUTUIARV">
<Title>Операция присваивания</Title>
<P><Operator>Именующие выражение  =  Выражение</Operator></P>
<P><Term Type="Out">Операция присваивания</Term> помещает значение выражения (своего правого операнда) в область памяти, определяемую левым операндом, который должен быть именующим выражением.</P>
<P><Term Type="Out">Именующее выражение</Term> должно определять область памяти, заданную для записи, например, переменную или элемент массива.</P>

<Example ID="EUTV1ZW3">

<Listing>
<L>count = 1   /* верно */</L>
</Listing>
<P><Operator>(a - b) = 6      /* неверно */</Operator></P>
</Example>

<Example ID="EUTVGOTL">

<Listing>
<L>int  main ()</L>
<L>{</L>
<L>   unsigntd int        quantity;</L>
<L>   float               total, price = 150.00;</L>
<L /><L>   quantity = 4U;</L>
<L>   total = quantity * price;</L>
<L>   . . .</L>
<L>}</L>
</Listing>
</Example>
<P>Как видно из примера, начальное значение переменной может быть присвоено как при объявлении, так и операцией присваивания.</P>
<SubTitle>Составные операции присваивания</SubTitle>
<P><Term Type="Out">Составные операции присваивания</Term> вида <Operator>ор=</Operator> работают следующим образом:</P>
<P><Operator>выражение1 ор= выражение2</Operator></P>
<P>эквивалентно выражению</P>
<P><Operator>выражение1 = выражение1 ор выражение2</Operator></P>
<P>Операция <Operator>ор</Operator> может быть одной из перечисленных ниже <Term Type="Link">арифметических операций</Term> или одной из бинарных <Term Type="Link">побитовых операций</Term>.</P>

<Table Col="2" ID="EUTVPF4H" TTop="Y">
<P>Составная операция присваивания</P>
<P>Эквивалентное выражение</P>
<P><Operator>x += 50</Operator></P>
<P><Operator>x = x + 50</Operator></P>
<P><Operator>x -= 50</Operator></P>
<P><Operator>x = x - 50</Operator></P>
<P><Operator>x *= 50</Operator></P>
<P><Operator>x = x * 50</Operator></P>
<P><Operator>x /= 50</Operator></P>
<P><Operator>x = x / 50</Operator></P>
<P><Operator>x %= 50</Operator></P>
<P><Operator>x = x % 50</Operator></P>
<P><Operator>x *= a + b</Operator></P>
<P><Operator>x = x * (a + b)</Operator></P>
</Table>
<P>Использование операций присваивания в форме <Operator>ор=</Operator> повышает эффективность программы, так как выражение слева вычисляется только один раз. Применение этой формы может повысить удобочитаемость и упростить отладку, особенно если операцией связаны сложные выражения.</P>
<P>Такая составная форма не только лаконична, но и позволяет с первого взгляда заметить, что используемая в ней переменная также изменяется.</P>
</Modul>
