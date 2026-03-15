<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="0HKEFKYKLN4C187CAWIR" Author="Федорук Е.В." Level="0" ADate="EUTWSBBE">
<Title>Логические операции</Title>
<P>В языке Си существуют следующие <Term Type="Out">логические операции</Term>: <Term Type="Link">логическое умножение</Term> И &#x2014; <Term Type="Out">коньюнкция</Term> (<Operator>&amp;&amp;</Operator>), <Term Type="Link">логическое сложение</Term> ИЛИ &#x2014; <Term Type="Out">дизьюнкция</Term>(<Operator>||</Operator>), <Term Type="Out">логическое отрицание</Term> НЕ (<Operator>!</Operator>).</P>
<P><Term Type="Link">Приоритеты</Term> логических операций определяются <Term Type="Link">таблицей приоритетов</Term> операций языка Си.</P>
<P>Значением логического <Term Type="Link">выражения</Term> является 0 (<Term Type="Link">ложь</Term>) или 1 (<Term Type="Link">истина</Term>). Значения логических операций определяются в соответствии с таблицами истинности этих операций.</P>

<Table Col="3" ID="EWUHE5NF" TTop="Y" Center="Y" WMono="Y" HMono="Y">
<P>операнд 1</P>
<P>операнд 2</P>
<P>коньюнкция</P>
<P>ложь</P>
<P>ложь</P>
<P>ложь</P>
<P>ложь</P>
<P>истина</P>
<P>ложь</P>
<P>истина</P>
<P>ложь</P>
<P>ложь</P>
<P>истина</P>
<P>истина</P>
<P>истина</P>
</Table>

<Table Col="3" ID="EWUHM79B" TTop="Y" Center="Y" WMono="Y" HMono="Y">
<P>операнд 1</P>
<P>операнд 2</P>
<P>дизьюнкция</P>
<P>ложь</P>
<P>ложь</P>
<P>ложь</P>
<P>ложь</P>
<P>истина</P>
<P>истина</P>
<P>истина</P>
<P>ложь</P>
<P>истина</P>
<P>истина</P>
<P>истина</P>
<P>истина</P>
</Table>

<Table Col="2" ID="EWUHOEDK" TTop="Y" WMono="Y" HMono="Y">
<P>операнд</P>
<P>отрицание</P>
<P>ложь</P>
<P>истина</P>
<P>истина</P>
<P>ложь</P>
</Table>

<Example ID="EUTWUN2J">
<P>Логическое И</P>
<P><Operator>(x &gt;= 1) &amp;&amp; (x &lt;= 500)</Operator></P>
</Example>

<Example ID="EUTWVF9D">
<P>Логическое ИЛИ</P>
<P><Operator>(input == &apos;q&apos;) || (input == &apos;Q&apos;)</Operator></P>
</Example>

<Example ID="EUTX0RIK">
<P>Логическое отрицание</P>
<P><Operator>!(x&gt;y &amp;&amp; y&gt;z)</Operator></P>
</Example>
<P>Для эффективности в языке Си вычисляется логическое выражение слева направо и прекращает вычисление, когда истинность значения определена.</P>

<Example ID="EWUI1G3U">
<P><Operator>(x&lt;y) &amp;&amp; (y&lt;z)</Operator></P>
<P>Это выражение истинно, если истинно как выражение <Operator>(x&lt;y)</Operator>, так и выражение <Operator>(y&lt;z)</Operator>. Если <Operator>(x&lt;y)</Operator> ложно, то все выражение должно быть ложно и выражение<Operator> (y&lt;z)</Operator> игнорируется.</P>
</Example>

<Example ID="EWUI2E36">
<P><Operator>(x&lt;y) || (y&lt;z)</Operator></P>
<P>Это выражение истинно, если истинно либо выражение <Operator>(x&lt;y)</Operator>, либо выражение <Operator>(y&lt;z)</Operator>, или если истинны оба выражения. Если <Operator>(x&lt;y)</Operator> истинно, все выражение истинно, так что в этом случае не вычисляется истинность выражения <Operator>(y&lt;z)</Operator>.</P>
</Example>
<P><Term Type="Link">Унарная операция</Term> <Operator>! </Operator>(НЕ) обращает логическое значение. Если <Operator>(x&lt; y)</Operator> ложно, то <Operator>!(x&lt; y)</Operator> истинно.</P>
</Modul>
