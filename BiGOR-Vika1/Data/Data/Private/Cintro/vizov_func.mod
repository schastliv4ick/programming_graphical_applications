<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="2V2ZY48SUBFEN8OVHUHX" Author="Федорук Е.В." Level="0" ADate="EV6RAKII">
<Title>Вызов функции</Title>
<P><Term Type="Out">Вызов функции</Term> влечет выполнение содержащихся в теле функции операторов.</P>
<P><Term Type="Link">Функции</Term> должны быть объявлены перед их вызовом. В <Term Type="Link">стандарте ANSI</Term> языка Си <Term Type="Link">объявления функции</Term> (называемом также объявлением прототипа функции) используется для контроля <Term Type="Link">типов</Term>. Компилятор выполнит проверки того, что количество и типы параметров, переданные функции, правильны.</P>
<P>Если объявление типа функции опущено, компилятор будет использовать правило умолчания K&amp;R и установит для нее тип <Operator>int</Operator>. Для функций <Term Type="Link">стандарта K&amp;R</Term> компилятор не выполняет контроля типов.</P>

<Example ID="EV6RHSIC">

<Listing>
<L>#include &lt;stdio.h&gt;</L>
<L>int main()</L>
<L>{</L>
<L>  void intro (void);     /* объявление прототипа функции*/</L>
<L /><L>  intro();              /*вызов функции*/</L>
<L>...</L>
<L /><L>}</L>
<L>void intro (void)        /*определение прототипа функции*/</L>
<L>{</L>
<L>  printf(&quot;Работает вызываемая фукция intro()&quot;);</L>
<L /><L>}</L>
</Listing>
</Example>
<P>В данном примере при вызове функции <Operator>intro() </Operator>функция <Operator>main()</Operator> является <Term Type="Out">вызывающей функцией</Term>. При вызове функции <Operator>printf() </Operator>вызывающей функцией является <Operator>intro()</Operator>. <Term Type="Link">Ключевое слово</Term> <Operator>void</Operator> в <Term Type="Link">объявлении прототипа функции</Term> <Operator>intro()</Operator> показывает, что функция <Operator>intro()</Operator> не имеет параметров и не возвращает значение.</P>
</Modul>
