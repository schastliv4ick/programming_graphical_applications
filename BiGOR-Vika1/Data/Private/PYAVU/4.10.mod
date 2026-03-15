<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="JNE6473N8WAUP7VTPTLN" Author="Полякова Виктория" Level="0" ADate="ET64AAGU">
<Title>Оператор continue</Title>
<P><Term Type="Out">Оператор continue</Term>, как и <Term Type="In">оператор break</Term>, используется только внутри операторов цикла, но в отличие от него выполнение программы продолжается не с оператора, следующего за прерванным оператором, а с начала прерванного оператора. Формат оператора следующий:</P>

<Listing>
<L /><L>continue;</L>
</Listing>

<Example ID="ET64CERT">

<Listing>
<L>int main()</L>
<L>{ int a,b;</L>
<L>  for (a=1,b=0; a&lt;100; b+=a,a++)</L>
<L>    { if (b%2) continue;</L>
<L>      ... /* обработка четных сумм  */</L>
<L>    }</L>
<L>  return 0;</L>
<L>}</L>
</Listing>
</Example>
<P>Когда сумма чисел от 1 до а становится нечетной, оператор continue передает управление на очередную итерацию цикла <Operator>for,</Operator> не выполняя операторы обработки четных сумм. Оператор <Operator>continue,</Operator> как и оператор break, прерывает самый внутренний из объемлющих его циклов.</P>
</Modul>
