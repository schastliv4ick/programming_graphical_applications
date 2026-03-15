<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="3SPMA6ZLP2VH313QNDQI" Author="Федорук Е.В." Level="0" ADate="EW248PQC">
<Title>Передача в функцию адреса массива</Title>
<P><Term Type="Link">Язык Си</Term> не допускает копирования всего <Term Type="Link">массива</Term> для передачи его в <Term Type="Link">функцию</Term>. Тем не менее, можно передавать элемент массива или начальный адрес массива.</P>
<P>Для того, чтобы функция имела доступ к массиву, ей достаточно передать <Term Type="Out">адрес массива</Term>- адрес первого элемента массива.</P>

<Example ID="EW24B00I">

<Listing>
<L>/* Копирует массив с использованием функции */</L>
<L>int main( )</L>
<L>{</L>
<L>void stringcopy (char [], char []);</L>
<L>char current[30], target[30];</L>
<L> . . .</L>
<L>stringcopy(current, target);</L>
<L>. . .</L>
<L>}</L>
<L /><L>/* Копирует str1 в str2 */</L>
<L>void stringcopy(char str1[], char str2[])</L>
<L>/* str1 = 600 str2 = 500 */</L>
<L>{</L>
<L>int i;</L>
<L>for ( i = 0; str2[i]!= &apos;\0&apos;; i++)</L>
<L>      str1[i] = str2[2];           /* адрес [смещение] */</L>
<L>      str1[i] = &apos;\0&apos;;</L>
<L>}</L>
</Listing>
</Example>
<P>Выражение типа <Operator>str2[i]</Operator> интерпретируется так, что означает <Operator>адрес[смещение]</Operator>.</P>
<P>Если в <Term Type="Link">вызове функции</Term> в качестве <Term Type="Link">фактического параметра</Term> используется <Term Type="Link">имя массива</Term> без скобок, то значением этого параметра будет начальный адрес массива. Если в примере начальные адреса массивов <Operator>current</Operator> и <Operator>target</Operator> равны соответственно 600 и 500, то в момент вызова функции <Operator>stringcopy</Operator> значения <Term Type="Link">формальных параметров</Term> <Operator>str1</Operator> и <Operator>str2</Operator> будут равны соответственно 600 и 500. Зная эти адреса, функция <Operator>stringcopy</Operator> может обращаться к элементам массива, используя <Term Type="Link">операцию доступа к элементу массива</Term> <Operator>[]</Operator>.</P>
<P>В примере 1 как выражение <Operator>current[3]</Operator>, так и <Operator>str2[3]</Operator> будут интерпретированы как 500[3].</P>
<P>Доступ выполняется к значению, запомненному по адресу<Formula Br="Y">500 + (3 &#x2219; (количество байтов в элементе)) = 500 +3&#x2219;1</Formula></P>
<P>В примере 2 показаны два способа объявления <Term Type="Link">параметров</Term> <Term Type="Link">функции</Term> при передаче адреса <Term Type="Link">массива</Term>:</P>

<Example ID="EW24B00I">

<Listing>
<L>int main()</L>
<L>{</L>
<L>int str1[20], str2[20];</L>
<L>void array_cpy(char [], char []);</L>
<L>void ptr_cpy(char *, char *);</L>
<L>  ...</L>
<L>    array_cpy(str1, str2);</L>
<L> /*ptr_cpy(str1, str2);*/</L>
<L>  ...</L>
<L>}</L>
<L /><L>void array_cpy(char one[], char two[])</L>
<L>{</L>
<L>int i;</L>
<L>for (i = 0; two[i] !=&apos;\0&apos;; i++)</L>
<L>   one[i] = two [i];</L>
<L>one[i] = &apos;\0&apos;;</L>
<L>}</L>
<L /><L>void ptr_cpy(char *one, char *two)</L>
<L>{</L>
<L>for ( ; *two !=&apos;\0&apos;; one++, two++)</L>
<L>   *one = *two ;</L>
<L>*one = &apos;\0&apos;;</L>
<L>}</L>
</Listing>
</Example>
<P>В функции <Operator>array_cpy()</Operator> <Term Type="Link">формальные параметры</Term> объявляются с использованием <Term Type="Link">операции доступа к элементу массива</Term> <Operator>[]</Operator>. Эта же операция применяется и в теле функции.</P>
<P>В функции <Operator>ptr_cpy()</Operator> формальные параметра объявляется как <Term Type="Link">указатели</Term>. В теле функции используется <Term Type="Link">операция косвенного доступа</Term> <Operator>*</Operator>.</P>
<P>Такая совместимость объявлений и операций настоятельно рекомендуется по стилевым причинам, но она не является необходимой. Тела двух функций можно без ущерба поменять местами. Важно помнить, что доступ к данным, хранящимся по адресу, обеспечивают обе операции <Operator>*</Operator> и <Operator>[]</Operator>. Операцию <Operator>*</Operator> можно применять даже к имени массива. В действительности, выражение</P>
<P><Operator>array_name[i]</Operator></P>
<P>преобразуется компилятором в следующее выражение</P>
<P><Operator>*(array_name + i)</Operator></P>
</Modul>
