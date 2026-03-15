<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="WBP7GRPL2X6WYHAJUV71" Author="Полякова Виктория" Level="0" ADate="ET7D1O11">
<Title>Сортировка вставкой</Title>
<P>Упорядоченный массив B&apos; получается из В следующим образом: сначала он состоит из единственного элемента К1; далее для i=2,...,N выполняется вставка узла Кi в B&apos; так, что B&apos; остается упорядоченным списком длины i.</P>
<P>Например, для начального списка B=&lt; 20,-5,10,8,7 &gt; имеем:</P>

<Listing>
<L>B=&lt; 20,-5,10,8,7&gt;  B&apos;=&lt; &gt;</L>
<L>B=&lt; -5,10,8,7 &gt;    B&apos;=&lt; 20 &gt;</L>
<L>B=&lt; 10,8,7 &gt;       B&apos;=&lt; -5,20 &gt;</L>
<L>B=&lt; 8,7  &gt;         B&apos;=&lt; -5,10,20 &gt;</L>
<L>B=&lt; 7 &gt;            B&apos;=&lt; -5,8,10,20 &gt;</L>
<L>B=&lt; &gt;              B&apos;=&lt; -5,7,8,10,20 &gt;</L>
</Listing>
<P>Функция insert реализует сортировку вставкой.</P>

<Listing>
<L>/*    сортировка  методом   вставки      */</L>
<L>float *insert(float *s, int m, int n)</L>
<L> {</L>
<L>   int i,j,k;</L>
<L>   float aux;</L>
<L>   for (i=m+1; i&lt;=n; i++)</L>
<L>     { aux=s[i];</L>
<L>       for (k=m; k&lt;=i &amp;&amp; s[k]=k; j--)  s[j+1]=s[j];</L>
<L>       s[k]=aux;</L>
<L>     }</L>
<L>   return(a);</L>
<L> }</L>
</Listing>
<P>Здесь оба списка <Operator>В</Operator> и <Operator>В&apos;</Operator> размещаются в массиве <Operator>s</Operator>, причем список <Operator>В</Operator> занимает часть <Operator>s</Operator> c индексами от <Operator>i</Operator> до <Operator>n</Operator>, а <Operator>B&apos;</Operator> &#x2014; часть <Operator>s</Operator> c индексами от <Operator>m</Operator> до <Operator>i-1</Operator> (см. рис.1). При сортировке вставкой требуется <Operator>Q=(n-m)*(n-m)</Operator> сравнений и не требуется дополнительной памяти.</P>
<Image ID="ET7D3HWK" DDImg="+ЗЙЖstбQИ-З++++яГяя+++Vщ+2--+++g+++++Q-Зш++0ы2DdыЛнDXQoЪЯ9nЮwыD4эвИKж7aкrКqо9ЗтМDЧцBзъP2rvШы75QUPс6МiAЖРnDй12VYaUсORвэЦRoKшшКtСоmцУJyЗЧhЮЫxiidгуюЩHюСб4x3чщЧ5sИsМMЖцЦдХИiШИEчbШaDщa5cEИБoЕ5M+ЩEЩИtdONMкглЧ5Ч4sЗкьЩFъNHeГИщЪУ9PбИQaqЛыsыУuЛыКeYOwzQЬммАAHСэМНxBЪRыhxрRvэxlЭНXCyФшTCSiyОiХNЗCTDigЯьпяЯи0zПжDпЮDрSvРч-9KФЗО0УВХGО-PAlлШГHHTЬФфmырEВУ4Umв66бXWQWSj6IVqlMКSsYЙKДУтд5NэMЮЖ8жРaгaKVхюAйBnVРIVvGXеЦу4Н3ЗРяq3еIZopYmKWkO-+fZKJуъ9ДГp4ЦдcЖчCpРpкsRъК5К3щфFvЪpВЫGAымHjatфГВgkPILЫisБXmGД6сjJГ2гAoMsЖjЬrAdЫдlЫLЪдqH7пЯpмolIДZWЩFжwсмbеХжyыоwцCзж7+хТгSBNhоО0гнВЦСPoЙлЭoщяRЬъSч8аjБOясБwtлаИdМfLiЫцЭмЗGP5KЫЭkzгзГpчжюjЫчфkmXЫэzОСXкgбкVыец8Я2zыет7ЫПjАМДЮ-sG-жEхbSэuBЧLS-АФLT91ъБШУыI1KkЯЩ6ЦхЕбэвN2в6тWCИв7нрnKЗbaiИвJ9iycРОAUкYЧtКшчNXyqжsXSGuцш2CЙ6ейQEЪMщСBDИкlYЪК1qС7юИENHаAЬxdЕKqцрИVBРбГЙЗЦвЮFPhLаKZМMдА3ЙDшж0LlжGлGУ9nKУМdбIТСмЩOAзшN4LT0ЮXеWjdкsЯ-штс67фЪтщbDЦсKmcH1сМ7cYHqщHуSQвШзbWщCКкdaS8ЮкeeiКкfуiy8лgmОwКлhqЮ8л5iuKУ++V1юпФийуU+ЗЙЖUжйм+еUчбуUб+ууенвме+дUчйфиU+ЗЙЖUГпо+уфтхгфй+поUУефU+жтпнuB8+B8Бмгие+нщUНйод+чптлуUЙ+огiB8Рi+ПiUВпшU+pkkB8Ве+ефпоgUП+офбтйпB+8МkЗUlБ+kB8ГБОБ+ДБiB8B8+ФийуUгп+ннеофUв+мпглUчй+ммUопфU+брребтU+йоUжйме+уUгтебф+едUчйфи+UбUтезй+уфетедU+цетуйпо+UпжUЗЙЖ+UГпоуфт+хгфйпоU+Уеф+v">Схема движения индексов при сортировке вставкой</Image>
</Modul>
