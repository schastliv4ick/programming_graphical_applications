<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="NDSH83WQ3I8QE86D5JO2" Author="Федорук Е.В." Level="0" ADate="EV9G9533">
<Title>Атрибут const</Title>
<P>Для указания того, что значение переменной не будет изменено в <Term Type="Link">программе</Term>, может быть использован <Term Type="Out">атрибут const</Term>. В этом случае переменная размещается в памяти, доступной только для чтения.</P>
<P>Использование атрибута <Operator>const</Operator> в прототипе <Term Type="Link">определения функции</Term> указывает, что <Term Type="Link">параметр</Term> не будет изменяться функцией.</P>
<P>Если вы попробуете изменить значение переменной <Operator>const</Operator>, компилятор выдаст сообщение об ошибке.</P>

<Example ID="EV9GCO17">

<Listing>
<L>int main()</L>
<L>{</L>
<L>void stringcopy(char [], const char []);</L>
<L>. . .</L>
<L>}</L>
<L>void stringcopy(char str1[], const char str2[])</L>
<L>{</L>
<L>. . .</L>
<L>}</L>
<L>float area_circle(double radius)</L>
<L>{</L>
<L> const double pi = 3.1415;</L>
<L>. . .</L>
<L>}</L>
</Listing>
</Example>
</Modul>
