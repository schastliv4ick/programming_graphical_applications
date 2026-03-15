<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="VRBILTA6VRS7SSUG8B90" Author="kylagin" Level="0" ADate="ETBEXXFW">
<Title>Линейные и нелинейные фильтры</Title>
<P>Преобразование <Term Type="In">сигнала</Term> каким-либо устройством в общем случае описывается оператором</P>
<P><Formula Br="Y" Num="Y" ID="EUFUJAA6">U<Sub>вых</Sub>=T[U<Sub>вх</Sub>]  </Formula>      </P>
<P>Большой класс преобразующих систем-линейные.</P>
<P> Определение 1:</P>
<P>Преобразование называется линейным, если </P>
<P><Formula Br="Y" Num="Y" ID="EUFUJU17">T[aU<Sub>1вх</Sub>]+bU<Sub>2вх</Sub>]=aT[U<Sub>1вх</Sub>]+bT[U<Sub>2вх</Sub>]= =aU<Sub>1вых</Sub>+bU<Sub>2вых</Sub>                         a,b-const</Formula></P>
<P>Определение: </P>
<P>Оператор , для которого условия <Link To="EUFUJAA6" /> не выполнено называется нелинейным</P>
<P><Formula>T[U<Sub>вх</Sub>]=U<Sup>2</Sup><Sub>вх</Sub>=U<Sub>вых</Sub></Formula></P>
<P>Определение:</P>
<P>Преобразователь называется инвариантным к сдвигу, если<Formula Br="Y" Num="Y" ID="EUFUIEQX"> T[U<Sub>вх</Sub>(t-T)]=U<Sub>вых</Sub>(t-T) </Formula></P>
<P>Наиболее часто используемый класс- линейные инвариантные к сдвигу системы (ЛИС)</P>
<P>Математическое описание ЛИС-систем</P>
<P>Имеем:</P>
<P><Formula>U<Sub>вх</Sub>(t)=<Matrix Col="1" Row="3" Alg="0"><M X="0.5" Y="1.2" Kh="1.0">+&#x221D;</M><M X="0.5" Y="2.6" Kh="1.0">&#x222B;</M><M X="0.5" Y="3.99" Kh="1.0">-&#x221D;</M></Matrix>U<Sub>вх</Sub>(t&apos;)&#x3B4;(t-t&apos;)dt&apos;</Formula></P>
<P>Применим оператор T&#xA0;к обоим частям:</P>
<P>T[<Formula>U<Sub>вх</Sub>(t)]=  T[<Matrix Col="1" Row="3" Alg="0"><M X="0.5" Y="1.2" Kh="1.0">+&#x221D;</M><M X="0.5" Y="2.6" Kh="1.0">&#x222B;</M><M X="0.5" Y="3.99" Kh="1.0">-&#x221D;</M></Matrix>U<Sub>вх</Sub>(t&apos;)&#x3B4;(t-t&apos;)dt&apos;</Formula>]=</P>
<P>(из линейности T)</P>
<P><Formula>=<Matrix Col="1" Row="3" Alg="0"><M X="0.5" Y="1.2" Kh="1.0">+&#x221D;</M><M X="0.5" Y="2.6" Kh="1.0">&#x222B;</M><M X="0.5" Y="3.99" Kh="1.0">-&#x221D;</M></Matrix>U<Sub>вх</Sub>(t&apos;)T[&#x3B4;(t-t&apos;)]dt&apos;= <Matrix Col="1" Row="3" Alg="0"><M X="0.5" Y="1.2" Kh="1.0">+&#x221D;</M><M X="0.5" Y="2.6" Kh="1.0">&#x222B;</M><M X="0.5" Y="3.99" Kh="1.0">-&#x221D;</M></Matrix>U<Sub>вх</Sub>(t&apos;)H(t-t&apos;)dt&apos;</Formula></P>
<P>Итак, для ЛИС-систем</P>
<P><Formula Br="Y" Num="Y" ID="EUFUKSW2">U<Sub>вых</Sub>(t)=<Matrix Col="1" Row="3" Alg="0"><M X="0.5" Y="1.2" Kh="1.0">+&#x221D;</M><M X="0.5" Y="2.6" Kh="1.0">&#x222B;</M><M X="0.5" Y="3.99" Kh="1.0">-&#x221D;</M></Matrix>U<Sub>вх</Sub>(t&apos;)H(t-t&apos;)dt&apos;   </Formula></P>
<P>H(t)-называется функцией импульсного отклика или импульсным откликом системы.</P>
<P>Применив преобразование Фурье к обеим частям <Link To="EUFUKSW2" /></P>
<P><Formula Br="Y" Num="Y" ID="EUFUL215">U<Sup>ф</Sup><Sub>вых</Sub>(f)=U<Sup>ф</Sup><Sub>вх</Sub>(f)H<Sup>ф</Sup>(f)  </Formula></P>
<P>H<Sup>ф</Sup>(f)- передаточная функция системы.</P>
<P /></Modul>
