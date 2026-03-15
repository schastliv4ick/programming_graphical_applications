<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="S5IGNB95N4YGL6EBHHMH" Author="Федорук Е.В." Level="0" ADate="EVQQ5INE">
<Title>Триграфы</Title>
<P><Term Type="Out">Триграфы</Term> &#x2014; это последовательность из трех символов, обозначающих один символ. Например, триграф <Operator>??-</Operator> обозначает символ <Operator>~</Operator>. Триграфы заменяются <Term Type="Link">препроцессором</Term> на первой стадии компиляции. Они используются для обозначения символов, отсутствующих на некоторых клавиатурах.</P>

<Table Col="2" ID="EVQQ7NX1" Center="Y" TLeft="Y" TTop="Y">
<P>Tриграф</P>
<P>Значение</P>
<P>??=</P>
<P>#</P>
<P>??(</P>
<P>[</P>
<P>??)</P>
<P>]</P>
<P>??&lt;</P>
<P>{</P>
<P>??&gt;</P>
<P>}</P>
<P>??/</P>
<P>\</P>
<P>??&apos;</P>
<P>^</P>
<P>??!</P>
<P>|</P>
<P>??-</P>
<P>~</P>
</Table>

<Example ID="EVQQEZCM">

<Listing>
<L>printf (&quot;%c\n&quot;,&apos;??=&apos;);</L>
<L>printf (&quot;%c\n&quot;,&apos;??&apos;&apos;);</L>
<L>printf (&quot;%c\n&quot;,&apos;??!&apos;);</L>
<L>printf (&quot;%c\n&quot;,&apos;??--);</L>
<L>Вывод:</L>
<L>#</L>
<L>^</L>
<L>|</L>
<L>~</L>
</Listing>
</Example>
</Modul>
