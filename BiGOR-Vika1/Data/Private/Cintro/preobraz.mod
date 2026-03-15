<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="C1F77Z9U62N7X1RA434Q" Author="Федорук Е.В." Level="0" ADate="EUWL3DN0">
<Title>Преобразование данных</Title>
<SubTitle>Преобразование при присваивании</SubTitle>
<P>Если в <Term Type="Link">операции присваивания</Term> оба операнда операции присваивания имеют один и тот же <Term Type="Link">тип</Term>, то никакого <Term Type="Out">преобразования данных</Term> не требуется. Однако, <Term Type="Link">выражение</Term> слева (<Term Type="Link">именующее выражение</Term>) не обязано иметь тот же тип, что и выражение справа. В этом случае делается попытка преобразования правого выражения к типу левого объекта.</P>
<P>Возможны следующие варианты преобразований:</P>

<List Num="Y">
<P>Объект типа <Operator>float</Operator> или <Operator>double</Operator> = выражение типа <Operator>char</Operator> или <Operator>int</Operator></P>
<P>Объект типа <Operator>char</Operator> или <Operator>int</Operator> = выражение типа <Operator>float</Operator> или <Operator>double</Operator></P>
<P>Объект меньшего размера = выражение большего размера.</P>
<P>Объект большего размера = выражение меньшего размера</P>
</List>
<P>В первом варианте присваивание обычно не влечет никакой потери данных. Значение выражение типа <Operator>char</Operator> или <Operator>int </Operator> будет помещено в область памяти, отведенную для <Operator>float</Operator> или <Operator>double</Operator>. При этом объект, представленный в <Term Type="Link">формате целых чисел</Term>, преобразуется в <Term Type="Link">формат с плавающей точкой</Term> для вещественных чисел.</P>

<Example ID="EUWMUWRS">
<P><Operator> int_var = 27;</Operator></P>
<P><Operator> float_var = int_var;</Operator><Operator> /* float_var  теперь равно 27.0*/</Operator></P>
</Example>
<P>В некоторых ситуациях этот вид присваивания может привести к потере данных. Например, на некотором компьютере формат целых чисел типа <Operator>int</Operator> может содержать 10 цифр, а формат с плавающей точкой типа <Operator>float</Operator> &#x2013; 7 значащих цифр. Присваивание переменной типа <Operator>float</Operator> 10-значащего целого приведет к потере точности. Для большинства компьютеров эта проблема преодолевается путем присваивания целых переменным типа <Operator>double</Operator>.</P>
<P>Во втором варианте присваивание вызывает отбрасывание дробной части. Если результат не помещается в формат типа <Operator>char</Operator> или <Operator>int</Operator>, часть значения теряется.</P>
<P>В третьем варианте в присваиваниях вида</P>

<List>
<P>объект типа <Operator>char</Operator> = выражение типа <Operator>int</Operator></P>
<P>объект типа <Operator>float</Operator> = выражение типа <Operator>double</Operator></P>
</List>
<P>данные могут быть потеряны.</P>
<P>В дальнейшем термин &quot;младшие байты&quot; и &quot;старшие байты&quot; относятся к двоичному представлению значения, независимо от того, в каком порядке эти байты хранятся в памяти различных процессов.</P>
<P>В четвертом варианте присваивания вида</P>

<List>
<P>объект типа <Operator>int</Operator> = выражение типа <Operator>char</Operator></P>
<P>объект типа <Operator>long</Operator> = выражение типа <Operator>short</Operator></P>
</List>
<P><Term Type="Link">преобразование</Term> выполняется следующим образом.</P>
<P>Значение переносится в младший байт(ы). Обработка старшего байта(ов) зависит от знакового бита меньшего объекта и от используемого процессора.</P>
<P>Если знаковый бит равен 0, старшие байты заполняются нулями.</P>
<P>Если знаковый бит равен 1 и правый операнд имеет знаковый тип, старшие байты заполняются единицами.</P>
<P>Если знаковый бит равен 1 и правый операнд имеет беззнаковый тип,</P>
<P>старшие байты заполняются нулями.</P>

<Example ID="EUWNK0P1">
<P>int_var = char_var</P>
<P>char_var <Limits><Z /><M> 00110101</M><M>&#x2193;</M></Limits></P>
<P>int_var 00000000 00000000 00000000 00110101</P>
</Example>

<Example ID="EUWNQ7QH">
<P>int_var = char_var</P>
<P>signed char_var <Limits><Z /><M>10110101</M><M>&#x2193;</M></Limits></P>
<P>signed или</P>
<P>unsignedint_var 11111111 11111111 11111111 10110101</P>
</Example>

<Example ID="EUWO30SW">
<P>int_var = char_var</P>
<P>unsigned char_var <Limits><Z /><M>10110101</M><M>&#x2193;</M></Limits></P>
<P>signed или</P>
<P>unsignedint_var 00000000 00000000 00000000 00110101</P>
</Example>
<SubTitle>Автоматические преобразования</SubTitle>
<P><Term Type="Link">Язык Си</Term> допускает <Term Type="Link">выражения</Term> с операндами различных <Term Type="Link">типов</Term>. Например, можно делить переменную типа <Operator>float</Operator> на константу типа <Operator>int</Operator>, прибавлять константу типа <Operator>int</Operator> к переменной типа <Operator>char</Operator> и т.д. Если выражение имеет операнды различных типов, низкий тип всегда преобразуется к более высокому. Один тип ниже другого, если он занимает меньше памяти.</P>
<Image ID="EUWQ47UU" DDImg="-7РОЗB8O+8+++BЙИ+ДТ++-4+2++э60++0+СхО3++++2зБНБ+K+lD9ьб3++++4вЛЗФД+я+я+яDUxbH++++7рИЩу+++9G++9G-9ТЭюь+++А5фЙНЕ5ЦА9MD+anTVЩn++5чЙрДБФшQнЭ5СKesE3РRQpяяЛxDXildVVРEоВmчГЭqhТ2ытUUЦxРюююaаяялЬx0РKF++АYUE76ДA00F+АYUАE76Д00F-+АYUE76MД00F+АYeuсъxЮjЧПыГZSШщэфnДWHJzчмтшsФHЫщ1ЮCИАUGEеьыч8рVчумьnbщьшiхяьrпNйММкЖTOлщrfХЗLy28gQZuхъxюEююy-MжPпиЧэуvbhоwььjдgе5нФг9ЯВ3юWСbчЖфyуэpЙRЮгОбLЩsЦКЙгuУГЭНД7цбЭтЩЦYMaBф7ЖxоЩN8HbyНbYZinEщtДбmЯЛЗКммnлХKOокчМЧqsЭкщнкХlUdонЛЯОм3ЧQKЗJьцеZе3cФиЙЗiМRИYMяasryлwqUFaОEAxzUаipхNBИxkнcdI7Hи2WБFЖyМeР-ИkбQkлw72Z4Й4MИАkРJ2C8уЕ7ЖZGEV622W-БА7bНРВС00nF+АY4УсOtЧУ6Дрumiзъ8F+А6YUРЗйUpгЛtqШJeEУXДcкKуx5ZKлЩДв6ЦpЛtyэгnЬaОQп755KDFаьDyКЙMsBVжtЧэvкtSеЩУфyцdЩОхt0ЧQД00Hbр6Д00FUИAHПIDF768Д0Т1QcДR0н12бНYJШб2м622ЯЮeXИУzЯвЪОС00F++АYUE76Д000СiXАVАЗ76Д00F-+АYUE76ЮДвЩiюикОкп6fPКЬHЫkВYИЙХВкezиpWсGмЮЦuRИА3UaмнТнQQТpщжПeщкАб0bмpzмгjbьХgiHПBГМCGrкКpсшмЗЛoKBTvLПЪqyалбdSDУщ-8raФH98НЧlfDЧтDсaGBКяsЗSs3ШмjуFznXУYвЕgУR8ГьMРsxЙжтуШа6J4цF75XNПKЦяvrЖnхjЩЭFмВH5kскВб3iъубЯbPFPЦыБмнETlЩYвDfЩyз6ЯзukэPjееHХНуЪюнcхгь-zd5Jч0ИЬбПdЩИюРьTЙАктПRWoГYumЯ1qgЫжaВКюеа6Hb6OЭFsрШкЦСI8kfщш6FUФJnnlуNsБИUGE62ЕЮOУуFЮкK7р6Д00FUИFlDЪzFИА6UGE622WG-БEпСГtEЗ76ДWfэbLagГYuтdхoш2йqИААUGEcЪУlzоКУЦбcbСtSКУЦVAGxлgoеR2W--у7юpжЮOmCЗ7SgхЦOmCTсhкКЯZdлEk7юpЮOmCEHb6ЪAdr0кtoеRW-Г-7H2W--рИАUGIкюVыфпW--И+АUGIСМTE4ZGE62ЕOЪюкиtД040F+АYUEа76Д00F+ZАЧ6UрIMDСХTЛШнГзсIЮIWБщтЦbSПND6jД6SmхЮВРYUРHцбжGххЦпзЫu9IчьИjрЪвФшЫiзпЛMdяJfлуKОЗ75Nп8ЛуЫPhRaДЖпxмщEЩажqА3ЫлPBdкДWfщнеАяKoъIХВJтыfЩqЫMВnДdяЧФjя5ДеФгДв6hу7ЙкпчжDaюCwЪг8GHb5fЬХпшyмпП5jSeGNvЛLТОиг8TишYеуJNМЛ5ьDеу3aSЦТqКWpвЛViкMэсKFа-xaTa8fйв2ЖБXv2eлwPзГЫRJI726МQUE76вД0RuюУъ+ГYUE76ДR0Т1ФУL7k6Д00F+АРYcpИ97F-+АYUE76+ьGK0З7юЮxZGсZД0eЯaAHИАL1F+АйnqoЦШЙшТCGдBoЩЙшТWБCТnJAjZGgEsLаoХeoNЯКС0YжИfNЯК5uшPхIКЖLG7qОу6тЛPМСQUшкIйУOXКhз7226aОE622WFБCXьБИYUUE76Д0ТBКYГ6Д00TFUФУziЧ+ИYUE76ДA00F+АYU1рбр6QZUАE76Д00F-+АYUE76иД00FаOiЙявРelд1АЯИG7кшРкvВWБoЭrLЙKAЫщИWШGEиtтшуSвчfrуэK7ЛPlжLshлКоjLУmж5fpылцтсэIшwщ4mwГxЩзсКмЬBЛЖAN3оCvoupLgнзeReНнДWунщhйАцqъ1IХоG5ЪМСoрKовoWЖfOКpшtхкMFMФьWmDъЫxNйб5Шя8HbiIоЩerTqrFгюЧXЗМRнуnhuОgjШдJъgжяQjkrхkGЖDdJфЫCFЯЫФGsjWGgиXFбгlaОEApТ1UЬ5BMDрF76МQШб2БLCCH76шД00FUIЖMЬkWF+АYGcZlLAИY+UE76Д001F+АYUE7k6Д00F+АCYИйюГюЛйзЗWХЙаtМ1lIуXСнonkЭяШa3wBKvzЪРH5bОюjfMбkroфYИPПьНzrzжffДчyЪtpбужеЮKчОl+MЬщ3ТтWуЧЛыLерmПпнХm4ЯЖmю6ЯbМЩзЖTыюSю+bДuвщзЪwуу4ыю5igФuЯЕяЧХ-ЦпйяOfуяЩНфCjпАZaSОqэIzЖвyАХhvиьЙэВБчюrеуUvjpЪiдйЭЦLSвfнRzуТГкLУяЛоCш8i6ГтфrМdO7j7ЫУ-ZдvWkfЙЯнУЯjsКRлVEядкПrеЛяЪfЫZБlуepdя9bЩЙЪнfъЩeуqLщьaVkСАжТvщэЦыgЭБifмХAfЕxcэДurтЦR2НкЕВV0ыЩюYUиоc-чGа76Д00F+ААYUE76юв1чЩОхnу-ЪЭ++++ЙИЕОДiВа0">Преобразования при вычислении выражения</Image>
<P>На рис.1 показано как будет выполняться <Term Type="Link">преобразование</Term>. Преобразования по горизонтали выполняются автоматически. Например, объект типа <Operator>char</Operator> в выражении всегда временно преобразуется в тип <Operator>int</Operator>. Преобразования из младшего в старший тип (снизу вверх) выполняются в случае необходимости. Например, если выражение содержит операнды типов <Operator>int</Operator> и <Operator>double</Operator>, то операнд типа <Operator>int</Operator> будет временно преобразован в тип <Operator>double</Operator>.</P>
<P>В ANSI Си арифметика с операндами типа <Operator>float</Operator> может выполняться с одинарной точностью. Обычно же операнд типа <Operator>float</Operator> автоматически преобразуется в тип <Operator>double</Operator>.</P>
<P>Для устранения неоднозначности преобразования можно использовать операцию явного <Term Type="Link">приведения</Term> типа <Operator>(type)</Operator>.</P>

<Example ID="EUY2IJ5U">
<P><Operator>y = (int)7.2 / 3;</Operator></P>
</Example>
</Modul>
