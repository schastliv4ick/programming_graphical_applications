<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="WSYVTF0QLC0W1O2VA7KV" Author="Федорук Е.В." Level="0" ADate="EUPB04VM">
<Title>Арифметические операции</Title>
<P><Term Type="Link">Язык Си</Term> предоставляет следующие <Term Type="Out">арифметические операции</Term>.</P>

<List>
<P><Term Type="Out">Аддитивные операции</Term></P>

<List>
<P>сложение (<Operator>+</Operator>) Пример: <Operator>x+y</Operator></P>
<P>вычитание (<Operator>-</Operator>) Пример: <Operator>num-20</Operator></P>
</List>
<P><Term Type="Out">Мультипликативные операции</Term></P>

<List>
<P>умножение (<Operator>*</Operator>) Пример: <Operator>200*val</Operator></P>
<P>деление (<Operator>/</Operator>) Примеры: <Operator>10/3</Operator> <Operator>10.0/3.0</Operator></P>
<P>получение остатка от деления (<Operator>%</Operator>) Пример: <Operator>clock%60</Operator></P>
</List>
<P><Term Type="Out">Изменение знака</Term>(унарный минус) (<Operator>-</Operator>) Пример: <Operator>-(prev+current)</Operator></P>
</List>
<P>Приоритеты арифметических операций определяютя <Term Type="Link">таблицей приоритетов</Term> операций языка Си.</P>
<P>При делении <Term Type="Link">целых</Term> дробная часть результата отбрасывается (10/3 равно 3). <Term Type="Link">Стандарт ANSI</Term> требует, чтобы округление производилось в сторону нуля. Если один или оба операнда &#x2013; числа с плавающей точкой, то округления не происходит. Результат &#x2014; вещественное число (10.0/3.0 равно 3.3333&#x2026;).</P>
<P>Операция получение остатка от деления (%) выполняет деление и выдает в качестве результата остаток от деления. 10%3 (произносится &quot;10 по модулю 3&quot;) равно 1. Операнды не могут быть <Term Type="Link">вещественными</Term> числами.</P>
<P>Операцию изменения знака иногда называют <Term Type="Link">унарным</Term> минусом, так как она имеет только один операнд.</P>
</Modul>
