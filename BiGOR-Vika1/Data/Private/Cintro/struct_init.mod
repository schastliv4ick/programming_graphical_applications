<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="T0AE5QBFQ7STZWQ1YJ34" Author="Федорук Е.В." Level="0" ADate="EWJCJBP1">
<Title>Инициализация структуры</Title>
<P><Term Type="Out">Инициализация структуры</Term> заключается в присванивании начальных значений элементам <Term Type="Link">структуры</Term>. Структуры могут быть проинициализированы при их объявлении. <Term Type="Out">Инициализирующая запись</Term> указывается в виде заключенного в фигурные скобки списка, элементы которого разделяются запятыми и являются <Term Type="Link">константами</Term>. Любые неинициализированные элементы <Term Type="Link">внешних</Term> или <Term Type="Link">статических</Term> структур по умолчанию равны 0. Значения неинициализированных элементов <Term Type="Link">автоматических</Term> структур неопределены.</P>

<Example ID="EWJCL4FC">

<Listing>
<L>struct course {</L>
<L>              char name[30];</L>
<L>              int  number;</L>
<L>              char nickname[30];</L>
<L>              } title = {&quot;C for new programmers&quot;,</L>
<L>                          1633,</L>
<L>                         &quot;TRR YYY&quot;};</L>
<L>struct mailinfo {</L>
<L>                char name[25];</L>
<L>                char mailadr[30];</L>
<L>                } proj_member [] = {</L>
<L>                    {&quot;Ivanov Oleg&quot;, &quot;rz3bb!imr&quot;},</L>
<L>                    {&quot;Klimov Alex&quot;, &quot;rz3bb!ha&quot;},</L>
<L>                    {&quot;Petrova Elena&quot;, &quot;rz3bb!wij&quot;},</L>
<L>                    { &quot;&quot;, &quot;&quot;}</L>
<L>                };</L>
<L>int f (void)</L>
<L>{</L>
<L>static struct mailinfo admin =</L>
<L>              {&quot;Administrator&quot;, &quot;root&quot;};</L>
<L>...</L>
<L>}</L>
</Listing>
</Example>
<P>В качестве признака окончания массива часто используется &quot;нулевая&quot; запись, поэтому зачастую используют циклы подобные <Link To="EWJCXGD7" />. Цикл будет выполняться до тех пор, пока первый символ поля <Operator>name</Operator> структуры, на которую указывает <Term Type="Link">указатель</Term> <Operator>p</Operator>, не равен <Operator>&apos;\0&apos;</Operator>.</P>

<Example ID="EWJCXGD7">

<Listing>
<L>for (p = proj_member; *p-&gt;name != &apos;\0&apos;; p++)</L>
<L>   printf (&quot;%s %s \n&quot;, p-&gt;name, p-&gt;mail_addr);</L>
</Listing>
</Example>
</Modul>
