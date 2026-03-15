<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="Z3H2JPSAQTO92XQ4BLJ9" Author="Волосатова Т.М., Родионов С.В." Level="0" ADate="F0Y18E9P">
<Title>Функция isalpha</Title>

<Listing>
<L>#include &lt;ctype.h&gt;</L>
<L>int isalpha(int   ch);</L>
</Listing>
<P><Term Type="Out">Функция isalpha ()</Term> возвращает ненулевое значение, если ее аргумент <Operator>ch</Operator> является буквой, в противном случае возвращается нуль. Принадлежность символа к буквам зависит от конкретного языка. Для английского языка таковыми являются прописные и строчные буквы от А до Z.</P>

<Example ID="F0Y2319L">
<P>Данная программа делает проверку каждого символа, прочитанного из стандартного входного потока stdin, и выдает сообщение, если этот символ окажется буквой.</P>
</Example>

<Listing>
<L>#include &lt;ctype.h&gt;</L>
<L>include &lt;stdio.h&gt;</L>
<L>int main(void) I</L>
<L>char ch;</L>
<L>for(;;)  {</L>
<L>ch = getchar() ;</L>
<L>if (ch == &apos;. &apos;) break;</L>
<L>if(isalpha(ch)) printf(&quot;%c является буквой\п&quot;, ch) ;</L>
<L>}</L>
<L>return 0;</L>
<L>}</L>
</Listing>
<P>При этом использованы следующие зависимые <Term Type="In">функции isalnum</Term>(), <Term Type="In">iscntrl</Term>(), <Term Type="In">isdigit</Term>(), <Term Type="In">isgraph</Term>(), <Term Type="In">isprint</Term>(), <Term Type="In">ispunct</Term>() и <Term Type="In">isspace</Term>().</P>
<P /></Modul>
