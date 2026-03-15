<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="27XMYLPUTV92DV15ZPAG" Author="Волосатова Т.М., Родионов С.В." Level="0" ADate="F0HS1RHD">
<Title>Функция setlocale</Title>

<Listing>
<L>#include  &lt;locale.h&gt;</L>
<L>char  *setlocale(int   type,   const  char   * locale);</L>
</Listing>
<P><Term Type="Out">Функция setlocale</Term>() позволяет получить или установить некоторые параметры, которые зависят от геополитической среды выполнения программы. Если указатель <Operator>locale</Operator> является нулем, функция setlocale() возвращает указатель на строку текущей локализации. В противном случае функция setlocale() попытается использовать строку <Operator>locale</Operator> для установки локальных параметров в соответствии с параметром type. Для задания стандартных С-параметров региональной привязки надо использовать строку &quot;С&quot;, а для задания собственных параметров среды &#x2014; пустую строку (&quot;&quot;). Чтобы получить подробную информацию о строках локализации, поддерживаемых конкретным компилятором, обратитесь к документации.</P>
<P>При вызове функции setlocale() в качестве параметра <Operator>type</Operator> должен быть использован один из следующих макросов (определенных в заголовке &lt;<Term Type="Out">locale.h</Term> &gt;).</P>
<P><Term Type="Out">LC_ALL</Term></P>
<P>LC_COLLATE</P>
<P>LC_CTYFE</P>
<P>LC__MONETARY</P>
<P>LC__NUMERIC</P>
<P>LC_TIME</P>
<P>Макрос LC_ALL относится ко всем категориям локализации. <Term Type="Out">Макрос LCCOLLATE</Term> оказывает влияние на выполнение функции <Operator>strcoll ()</Operator>. <Term Type="Out">Макрос LC_CTYPE</Term> изменяет характер работы символьных функций. <Term Type="Out">Макрос LC_MONETARY</Term> определяет денежный формат. <Term Type="Out">Макрос LC_NUMERIC</Term> изменяет символ десятичной точки для функций форматированного ввода-вывода. Наконец, <Term Type="Out">макрос LCJTIME</Term> определяет поведение <Term Type="In">функции strftime</Term>().</P>
<P>Функция setlocale() возвращает указатель на строку, связанную с параметром type.</P>

<Example ID="F0HSHB2B">
<P>Эта программа отображает текущую установку локализации:</P>
</Example>

<Listing>
<L>#include &lt;locale.h&gt;</L>
<L>#include &lt;stdio.h&gt;</L>
<L>int main(void) </L>
<L>{</L>
<L>printf(setlocale(LC_ALL, &quot; &quot;));</L>
<L>return 0;</L>
<L>}</L>
</Listing>
<P>Здесь используются зависимые <Term Type="In">функции localeconv</Term>(), <Term Type="In">time</Term>(), strcoll()  и  strftime().</P>
<P /></Modul>
