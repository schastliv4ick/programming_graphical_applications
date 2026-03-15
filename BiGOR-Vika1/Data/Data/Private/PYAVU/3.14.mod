<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="Y31OG91FXXMYLNURUL9P" Author="Полякова Виктория" Level="0" ADate="ESYEOEU0">
<Title>Простое присваивание</Title>
<P>Операция простого присваивания используется для замены значения левого операнда, значением правого операнда. При присваивании производится преобразование типа правого операнда к типу левого операнда по правилам, упомянутым раньше. Левый операнд должен быть модифицируемым.</P>

<Example ID="ESYEOQL6">

<Listing>
<L>int t;</L>
<L>char f;</L>
<L>long z;</L>
<L>t=f+z;</L>
</Listing>
</Example>
<P>Значение переменной <Operator>f</Operator> преобразуется к типу <Operator>long</Operator>, вычисляется <Operator>f+z</Operator> ,результат преобразуется к типу <Operator>int</Operator> и затем присваивается переменной <Operator>t</Operator>.</P>
</Modul>
