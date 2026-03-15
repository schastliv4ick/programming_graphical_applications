<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="4KGXVFAOA5BL3M3UZ8DF" Author="Волосатова Т.М., Родионов С.В." Level="0" ADate="F0Y0XY36">
<Title>Функция isalnum</Title>

<Listing>
<L>#include  &lt;ctype.h&gt;</L>
<L>int isalnum(int ch) ;</L>
</Listing>
<P>Если аргумент <Operator>ch</Operator> <Term Type="Out">функции isalnum</Term>() является либо буквой, либо цифрой, она возвращает ненулевое значение. Если же тестируемый символ не относится к алфавитно-цифровым, возвращается нуль.</P>

<Example ID="F0Y0Z9JX">
<P>Данная программа читает из стандартного входного потока stdin символы, проверяет их и выдает сообщение о каждом алфавитно-цифровом символе.</P>
</Example>

<Listing>
<L>#include &lt;ctype.h&gt;</L>
<L>#include &lt;stdio.h&gt;</L>
<L>int main(void)</L>
<L>char.ch;</L>
<L>for{;;{</L>
<L>ch = getc(stdin);</L>
<L>if(ch == &apos;.&apos;) break;</L>
<L>if(isalnum(ch)) printf{&apos;Символ %с является алфавитно-цифровым \n&apos; , ch) ;</L>
<L>}</L>
<L>return       0 ;</L>
<L>}</L>
</Listing>
<P>При этом могут быть использованы следующие зависимые функции <Term Type="In">isalpha()</Term>, <Term Type="In">iscntrl()</Term>, <Term Type="In">isdigit()</Term>, <Term Type="In">isgraph()</Term>, <Term Type="In">isprint()</Term>, <Term Type="In">ispunct()</Term> и <Term Type="In">isspace()</Term>.</P>
<P /></Modul>
