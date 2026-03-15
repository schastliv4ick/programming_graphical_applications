<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="7AICT7V762N8I8FG6AZI" Author="Федорук Е.В." Level="0" ADate="EV6S2QK9">
<Title>Аргументы функции</Title>
<P>При <Term Type="Link">вызове функции</Term> в круглых скобках указываются ее <Term Type="Link">аргументы</Term> или <Term Type="Out">фактические параметры</Term>. В качестве фактического параметра может использоваться любое <Term Type="Link">выражение</Term>.</P>
<P>В вызове функции должно быть указано правильное количество, порядок и типы параметров.</P>
<P>Компилятор <Term Type="Link">ANSI</Term> Си проверяет согласованность параметров вызова функции ее аргументам в следующих случаях:</P>

<List>
<P>если функция объявлена в программе перед ее вызовом;</P>
<P>если функция определена в исходном файле перед вызовом.</P>
</List>
<P>Компилятор ANSI Си проверяет правильность вызова функции: правильно ли указано количество параметров и их типы. Если необходимо, компилятор выполнит <Term Type="Link">автоматическое преобразование</Term> параметров вызова функции к соответствующему <Term Type="Link">типу</Term>. Если преобразование не имеет смысла, во время компиляции выдается сообщение об ошибке.</P>
<P>Все аргументы функции &#x201C;вызываются по значению&#x201D;. В функцию передается значение аргумента или фактического параметра.</P>

<Example ID="EV6TJ8XC">

<Listing>
<L>#include &lt;stdio.h&gt;</L>
<L>int main()</L>
<L>{</L>
<L>void print_growth (float, float);          /*объявление прототипа функции */</L>
<L>float  amount = 250.,                      /*начальный вклад */</L>
<L>       interest = .075;                    /* процент 7.5% */</L>
<L /><L>print_growth (amount, interest);           /*вызов функции */</L>
<L>printf (&quot;main: amount is %.2f \n&quot;, amount);</L>
<L>}</L>
<L /><L>void print_growth (float val, float rate)  /*определение прототипа функции */</L>
<L> /* val = 250., rate=.075 */</L>
<L>{</L>
<L>   val = (1+rate)* val;</L>
<L>   printf (&quot;Value after 1 year: %.2f\n&quot;, val);</L>
<L> }</L>
<L>Результат выполнения программы:</L>
<L>Value after 1 year: 268.75</L>
<L>main: amount is 250.00</L>
</Listing>
</Example>
<P>При вызове в функцию <Operator>print_growth()</Operator> передаются значения фактических параметров: в данном случае значения переменных <Operator>amount</Operator> и <Operator>interest</Operator>. Эти значения присваиваеются новым переменным (<Term Type="Link">формальным параметрам</Term>) <Operator>val </Operator>и <Operator>rate</Operator>, имеющим свои собственные адреса в памяти. Значение переменных <Operator>amount</Operator> и <Operator>interest</Operator> не изменяются вызовом функции <Operator>print_growth()</Operator>.</P>
</Modul>
