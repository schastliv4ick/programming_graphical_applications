<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="FGDZXMK3MEE2TO3OZNIC" Author="Федорук Е.В." Level="0" ADate="EVQRTAEA">
<Title>Переименование типа</Title>
<P><Term Type="Out">Оператор typedef</Term> &#x2014; это оператор языка Си, по которому задается новое имя (синоним) существующему типу данных.</P>
<P>Синтаксис оператора <Operator>typedef</Operator> похож на объявления переменной:</P>
<P><Operator>typedef</Operator> <Operator>существующий_тип новое_имя</Operator></P>
<P>Имена подчиняются тем же правилам, что и прочие <Term Type="Link">идентификаторы</Term>.</P>
<P>Хотя объявления <Operator>typedef </Operator>не являются <Term Type="Link">директивами препроцессора</Term> <Term Type="Link">языка Си</Term>, они часто используются в <Term Type="Link">файлах заголовков</Term>.</P>
<P>Оператор <Operator>typedef</Operator> может использоваться также для объявления <Term Type="Link">производных типов</Term>, таких как, например, матрица 20 на 40 целых значений.</P>
<P>Использование заглавных букв в именах типов, определенных оператором <Operator>typedef</Operator>, &#x2014; это соглашение, а не правило.</P>

<Example ID="EVQS0CV2">

<Listing>
<L>typedef char BYTE;</L>
<L>typedef unsigned short USHORT;</L>
<L>typedef int MATRIX[20][40];</L>
<L>typedef int WORD;</L>
<L>int main()</L>
<L>{</L>
<L>BYTE input;</L>
<L>WORD buf [512];</L>
<L>MATRIX prev, current;</L>
<L>. . .</L>
<L>}</L>
</Listing>
</Example>
</Modul>
