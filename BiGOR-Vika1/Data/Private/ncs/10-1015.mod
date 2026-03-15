<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="6195MYUROR3SBL6UL7ZO" Author="kylagin" Level="1" ADate="EUCWX6ZC">
<Title>Распознавание образов</Title>
<P><Term Type="Out">Распознавание образов</Term> &#x2014; это совокупность средств и методов , позволяющих достигнуть и превзойти естественные средства восприятия и анализа окружающего мира.</P>
<P>Основные решаемые задачи:</P>

<List>
<P>автоматическое чтение рукописного и машинописного текста</P>
<P>восприятие речи</P>
<P>медицинская диагностика</P>
<P>дистанционная идентификация объекта</P>
<P>интерпретация социологических данных</P>
<P>криминалистика</P>
</List>
<P>Последовательность решения задачи:</P>

<List Num="Y">
<P>Восприятие и обработка (предварительная) информации</P>
<P>Анализ информации</P>
<P>Классификация известных образов</P>
<P>Отнесение неизвестного образа к одному из классов</P>
</List>
<P>Восприятие и предварительная обработка:</P>
<P>Это- методы и приборы (аппаратные) получения информации об интересующих объектах и ее предварительная обработка (фильтрация), устранение помех.</P>
<SubTitle>Анализ информации</SubTitle>
<P><Term Type="Out">Анализ информации</Term> &#x2014; выделение существенных с точки зрения данной задачи характеристик объектов-признаков.</P>
<P>Признаки:</P>

<List>
<P>количественные(рост, вес и т.д.)</P>
<P>качественные (красный, синий)</P>
<P>двоичные (есть свойство или нет)</P>
</List>
<P>Целесообразно приводить все признаки к одному виду:</P>

<Example ID="EUD1ERB9">
<P>Цвет-красный-характеризовать в длинах волн.</P>
<P>Цвета: последовательность чисел красный-1, оранжевый-2, желтый-3 и т.д.</P>
<P>Веса- также градуировать: 0-10=1, 10-20=2 и т.д.</P>
<P>При этом шкаламожет быть неравномерной.</P>
<P>Результат анализа: получение таблицы &quot;объект-признак&quot;</P>
<P><LogBr><M X="0.0" Y="1.25" Kh="1.25">{</M><M X="1.25" Y="1.12" Kh="1.0"><Matrix Col="1" Row="4" Alg="0"><M X="0.49" Y="1.19" Kh="1.0"><Limits><M X="0.1" Y="0.8" Kh="0.8">&#x2192;</M><M X="0.0" Y="2.04" Kh="1.0">X<Sub>1</Sub></M><Z X="0.1" Y="3.08" Kh="0.8" /></Limits>= x<Sub>11</Sub>x<Sub>12</Sub>x<Sub>13</Sub>.....x<Sub>1m</Sub></M><M X="0.49" Y="2.6" Kh="1.0"><Limits><M X="0.1" Y="0.8" Kh="0.8">&#x2192;</M><M X="0.0" Y="2.04" Kh="1.0">X<Sub>2</Sub>=</M><Z X="0.1" Y="3.08" Kh="0.8" /></Limits>x<Sub>21</Sub>x<Sub>22</Sub>x<Sub>23</Sub>.....x<Sub>2m</Sub></M><M X="0.49" Y="3.99" Kh="1.0"><Limits><M X="0.1" Y="0.8" Kh="0.8">&#x2192;</M><M X="0.0" Y="2.04" Kh="1.0">X<Sub>3</Sub></M><Z X="0.1" Y="3.08" Kh="0.8" /></Limits>=x<Sub>31</Sub>x<Sub>32</Sub>x<Sub>33</Sub>.....x<Sub>3m</Sub></M><M X="0.49" Y="5.39" Kh="1.0"><Limits><M X="0.1" Y="0.8" Kh="0.8">&#x2192;</M><M X="0.0" Y="2.04" Kh="1.0">X<Sub>n</Sub></M><Z X="0.1" Y="3.08" Kh="0.8" /></Limits>=x<Sub>n1</Sub>x<Sub>n2</Sub>x<Sub>n3</Sub>.....x<Sub>nm</Sub></M></Matrix></M><Z X="2.25" Y="1.25" Kh="1.25" /></LogBr></P>
<P><Limits><M X="0.1" Y="0.8" Kh="0.8">&#x2192;</M><M X="0.0" Y="2.04" Kh="1.0">X<Sub>n</Sub></M><Z X="0.1" Y="3.08" Kh="0.8" /></Limits>-объекты, x<Sub>nm</Sub>-признаки</P>
</Example>
<SubTitle>Классификация</SubTitle>
<P>Операция классификации состоит в том, чтобы распределить данные по категориям(или классам), включающим совокупность образов имеющих одни и теже признаки(или близкие).</P>
<P>Классификация:</P>

<List Num="Y">
<P>С &quot;учителем&quot;</P>
<P>Автоматическая( без учителя)</P>
</List>

<List Num="Y">
<P>С &quot;учителем&quot; -пространство признаков разделяется на известное число классов человеком на основе априорной информации.</P>
<P>Автоматическая-количество и местоположение классов заранее не известно(пример-классификация живой природы)</P>
</List>
<SubTitle>Основные требования, предъявляемые к классам</SubTitle>

<List Num="Y">
<P>Компактность-точки в пространстве, представляющие объекты одного класса, расположены друг к другу ближе, чем к точкам, представляющим объекты других классов.</P>
</List>
<P>Расстояние между точками:</P>
<P><Formula>d<Sub>1</Sub>(<Limits><M>&#x2192;</M><M>x</M><Z /></Limits><Sub>i</Sub>,<Limits><M>&#x2192;</M><M>x</M><Z /></Limits><Sub>j</Sub>)=<LogBr><M X="0.0" Y="1.25" Kh="1.25">{</M><M X="1.25" Y="1.12" Kh="1.0"><Limits><M>m</M><M>&#x2211;</M><M>k=1</M></Limits> (x<Sub>ik</Sub>&#x2212;x<Sub>jk</Sub>)<Sup>2</Sup> </M><M X="2.25" Y="1.25" Kh="1.25">}</M></LogBr><Sup>1/2</Sup></Formula> -евклидова метрика <InlImage DDImg="+ЗЙЖsrбP6+Q+++++Ь++яяяVщE2+++я+g+++++P+Qk++0МAD6ПЙЭkQфсЪДУj3wлУ3qTMJSЕQзDmqHPКл+кzcRЯtЭхЛюЯСИфgWmErvW9ЙaKийYБReBGДЙPЙTЬhTjзB4rгж-ЩЫ++v" /></P>
<P><Formula>d<Sub>2</Sub>(<Limits><M>&#x2192;</M><M>x</M><Z /></Limits><Sub>i</Sub>,<Limits><M>&#x2192;</M><M>x</M><Z /></Limits><Sub>j</Sub>)=<Limits><M>m</M><M>&#x2211;</M><M>k=1</M></Limits>|</Formula>x<Sub>ik</Sub>-x<Sub>jk</Sub>| -расстояние по манхеттону <InlImage DDImg="+ЗЙЖsrбT6+T+++++Ь++яяяVщE2+++я+g+++++T+Tk++0ЫAD6ЫЙн5ЦPУТхPgЖСпr26ЯеИЮШВebuaнLеЩ7gqoНаu35НэПeешДЕrZЧкcLМaJУчAO1ВЩpХцpвdЪоDЦее0ЯQjгтetУhкWл73JБнlt-Xэc++v" /></P>
<P><Formula>d<Sub>3</Sub>(<Limits><M>&#x2192;</M><M>x</M><Z /></Limits><Sub>i</Sub>,<Limits><M>&#x2192;</M><M>x</M><Z /></Limits><Sub>j</Sub>)=<Limits><Z /><M>MAX</M><M>k</M></Limits>|x<Sub>ik</Sub>&#x2212;x<Sub>jk</Sub>|&#x2212; по Чебышеву <InlImage DDImg="+ЗЙЖsrбW6+X+++++Ь++яяяVщE2+++я+g+++++W+Xр++0гADdzЛhаW2miЦкnБъ1D4йв6qЬJR6zOkfNЖAынРPмШ-hчйшz1WтВ5амШмZЯДRэ52BGIНZZnOМЪпЪiLТ6эТrЧlуШк9nЙwXmчэSzYфТЭbцПитшю3ДDsР++v" /></Formula></P>
<P>Расстояние между точкой и классом C<Sub>0</Sub>:</P>
<P><Formula>d(<Limits><M>&#x2192;</M><M>x</M><Z /></Limits>,C<Sub>0</Sub>)=inf {d(<Limits><M>&#x2192;</M><M>x</M><Z /></Limits>, <Limits><M>&#x2192;</M><M>P </M><Z /></Limits>) , <Limits><M>&#x2192;</M><M>P </M><Z /></Limits>&#x2208;C<Sub>0</Sub>}</Formula></P>
<P><Font Color="#0000FF">2.</Font>Сепарабельность(разделимость)-классы являются ограниченными и не пересекаются между собой.</P>
<P>Эти свойства выполняются не всегда(сильно зависит от удачного выбора признаков)</P>
<SubTitle>1 метод-Иерархическая группировка</SubTitle>
<P>Искомое описание- иерархическая структура.Иерархия строится на основе понятия расстояния&#x2192;выбор метрики. Метод состоит в том, чтобы разработать последовательность разделений множества всех объектов на подгруппы, одна из которых обладает искомым свойством, а другая -не обладает.</P>
<P>Построение иерархии(Алгоритм Ланса и&#xA0;Вильямса)</P>
<P>Пусть X- множество реализаций пронумерованное от 1 до m (множество объектов)</P>
<P><Formula>X={<Limits><M>&#x2192;</M><M>x</M><Z /></Limits><Sub>1</Sub>, <Limits><M>&#x2192;</M><M>x</M><Z /></Limits><Sub>2</Sub>,..., <Limits><M>&#x2192;</M><M>x</M><Z /></Limits><Sub>m</Sub>}</Formula></P>
<P><Font Color="#0000FF">1.</Font>Вычисляется множество всех расстояний между объектами <Formula>{d(ij), 1&#x2264;i&#x2264;m,1&#x2264;j&#x2264;m}</Formula>-таблица расстояний.</P>
<P><Font Color="#0000FF">2.</Font>Определяется d(p,q)=min (d(ij))-т.е. минимальное расстояние &#x2014; это 1-е иерархическое объединение.</P>
<P>Столбцы и строки p и q из таблицы удаляются и вводятся (столбец и строка) r расстояний , определяемых по закону:</P>
<P><Formula>d(i,r)=<Limits><Z /><M>min</M><M>i</M></Limits>{d(i,p),d(i,q)}</Formula> &#x2014; критерий min</P>
<P>или</P>
<P><Formula>d(i,r)=<Limits><Z /><M>max</M><M>i</M></Limits>{d(i,p),d(i,q)}</Formula> &#x2014; критерий max]</P>
<P><Font Color="#0000FF">3.</Font>Если число столбцов и строк в сокращенной таблице &gt;1 &#x2192; идти к 2, иначе &#x2192; 4.</P>
<P><Font Color="#0000FF">4.</Font> Конец</P>

<Example ID="EUD45KGQ">
<P>Пример иерархической группировки.</P>
<P>Дано: 4 объекта {<Limits><M>&#x2192;</M><M>x</M><Z /></Limits><Sub>1</Sub>,...,<Limits><M>&#x2192;</M><M>x</M><Z /></Limits><Sub>4</Sub>}</P>
<P><Font Color="#0000FF">1.</Font> Расстояние между объектами</P>

<Table Col="5" ID="EUD47QHR" TTop="Y" TLeft="Y">
<P /><P><Formula>x<Sub>1</Sub></Formula></P>
<P><Formula>x<Sub>2</Sub></Formula></P>
<P><Formula>x<Sub>3</Sub></Formula></P>
<P><Formula>x<Sub>4</Sub></Formula></P>
<P><Formula>x<Sub>1</Sub></Formula></P>
<P>0</P>
<P>5</P>
<P>0.5</P>
<P>2</P>
<P><Formula>x<Sub>2</Sub></Formula></P>
<P>5</P>
<P>0</P>
<P>1</P>
<P>0.6</P>
<P><Formula>x<Sub>3</Sub></Formula></P>
<P>0.5</P>
<P>1</P>
<P>0</P>
<P>2.5</P>
<P><Formula>x<Sub>4</Sub></Formula></P>
<P>2</P>
<P>0.6</P>
<P>2.5</P>
<P>0</P>
</Table>
<P><Font Color="#0000FF">2.</Font><Formula>d(x<Sub>1</Sub>,x<Sub>3</Sub>)=0.5 &#x2192; min &#x2192;</Formula> 1-е иерархическое объединение <Formula>{x<Sub>1</Sub>,x<Sub>3</Sub>}=a</Formula></P>
<P>По правилу min d{a,<Formula>x<Sub>2</Sub></Formula>}=min{d(x<Sub>1</Sub>,x<Sub>2</Sub>),d(x<Sub>3</Sub>,<Formula>x<Sub>2</Sub></Formula>)}=1</P>
<P>d{a,<Formula>x<Sub>4</Sub></Formula>}=min{d(x<Sub>1</Sub>,x<Sub>4</Sub>),d(x<Sub>4</Sub>,<Formula>x<Sub>3</Sub></Formula>)}=2</P>

<Table Col="4" ID="EUD4HP5N" TTop="Y" TLeft="Y">
<P /><P><Formula>x<Sub>2</Sub></Formula></P>
<P><Formula>x<Sub>4</Sub></Formula></P>
<P>a</P>
<P>x<Sub>2</Sub></P>
<P>0</P>
<P>0.6</P>
<P>1</P>
<P>x<Sub>4</Sub></P>
<P /><P>0</P>
<P>2</P>
<P>a</P>
<P /><P /><P>0</P>
</Table>
</Example>
<P>Новая группировка b={x<Sub>2</Sub>,x<Sub>4</Sub>}</P>

<Table Col="3" ID="EUD4K3T5" TTop="Y" TLeft="Y">
<P /><P>a</P>
<P>b</P>
<P>a</P>
<P>0</P>
<P>1</P>
<P>b</P>
<P>1</P>
<P>0</P>
</Table>
<P>Окончательное объединение С={a,b}</P>
<P>Построение удобно отображать на графике (<Link To="EUZ6WBVO" />):</P>
<Image ID="EUZ6WBVO" DDImg="АЗЙЖsrбЦ6-8-з+++Д+++++++Ж+++++++х++++++АяАААЬАaКярярФявlЯяФCяЖлянsИяeZяeK+ЬG+tъ+-Kв+уК+Рьm+ягФяЗzlяfCяDлЙяуИяЧZяYХ+ЬЙ+tx0+Kl+уZ+шРN+яФФяzllяCCялGляИИяZZЙю++Ь++t2++K++у+р+Р++яФгяяlЗяCfяaлDяИуяZGЧя+ХЬ+Й7t+xK+lуа+ZР+NяФяряlвяCФнялЖяИsяqZeя+eЬ+HGt+ъK+вАу+КР+mяяФяяlяяCЫяяляяИяняZяю+юЬq+Ьt+tK+-Kу+уР+РярФявlяФrCяЖляsИЫяeZяe+яZG+Ьъ+tв0+KК+уm+юРгФяЗlяjfCяDляуGИяЧZяХ+ЙяЙ+Ьx+t2l+KZ+уNь+РФФяllПяCCялляYИИяZZя+G+ю++Ь++7t++K++уш++РФгяlЯЗяCfялDЙяИуяZЧяY+Хя+ЙЬ+Gxt+lK+Zру+NРФряzlвяCФялЫЖяИsяZeня+eя+GЬY+ъt+вK+аКу+mРФяяяlяяCяяqляяИяяZЫяя+юю+ЬнЬ+tt+KKА+уу+РРФяярlявCянФляЖИяsqZяe+яe+ЛЬG+tъ+K+в+уК+РmяФягlяЗCЫяfляDИяYуZяЧ+яХG+ЬЙ+tx+-Kl+уZ+РюNФяФlяlLCяCлялИЙяИZяZ+юY++Ь++t+0+K++у++ьР+гяФЗяzlfяCDялGуяИЧяZХЙя+ЙЬ+xt2+lK+Zу+шNР+ряФвяяlФяCЖяqлsяИeяZPeя+GЬ+ъ7t+вK+Кур+mР+яяФяяяlяяCяняляяИяяqZюю+ЬЬ+Ptt+KK+уау+РР+ттятжжжЪЪЪяОООВВВqяqqeeeSSяSGGG444+ъъъооов+ввЦЦЦКК+Кyyymmm+aaaOOOCьCCяырUUTY+++я++O+я+яя++Ц+яя+я+яjяяяяVщ26+++я+g+6+++Ц-8-I+6ю+я7QSИkUБ16HьeЬИkVГ5иEXКQИlWгЕ9MnкЬИПlXЗDUГ8wQЙmYЙHcъУeЬЙmZЛЩLkгКQЙnзaНPsукЬЯЙnbПTА1ш8RКocСXmИHeЭum-Л+b+юsuАjoeХfШDuН3OХF2+3nm8RЛqмКфлTкEъ5цуDdD+ФORyЛriЭ6ЧШФcG6цпzbWТп8SМШмkЮГьzшэbQБобЗEXLyнл6hв-ОэГКЮМtnНеjбыв4лtboйУbNo+oаcjЯoCСЫЛSНЫWкcъыriiНvrлп1иtyZуzиrсгzrGюЗОwtзj-ХRЛTiщfЧbШФnлrvХysлнаГюгыxэIvшуин7SqжZxыХчАук4ПzщюН5ЛнлЯъzТЪt2Nсжbа+P3чФoояFЖа0AфЖдUчеhХnа2Iqд+чЬ6Цcб44FbГб5JюJVБ6YqиRФСPJcW-ЭЭbЛб8kкчв20lЦ6Tе0ЭKГД9qцMSdCy47SEВ+KdRы1FйbдGЗxиИ5+dmdепDтЦJеIШЦцVКрщейZнКyJчеMХНЗЯжNZН6MOАмЖqXЧXqаdbЩGДчaдщужщХRJhэZЧ3шкdаиТАqEиUС6G8еTLOзNиXЙЙEЯF3ЧВкйРLЗоJЧрвЮкрйРХOmZXDTKuHхлоyNbdgкдФzLюhЖuУpШРфeлhkdьцciwioZл9x4ЫIbдмэbмlYБЖmг08WлgЗpiRYЪZПЦвЫСб6tkfnpЬuIhohjEЪнsC-4zisдaPРнxYqqguрWЛФRЯPТPпщx1нКZhшxцлР7иъPеjхЫ8ьпjуВhйрzКюБXjЧ-jмhсG0ЩLlДХeККjЖ0fцЦlЗрOъiИсчOШkЙЬywЙXКйжpЬp9fnмнr2ьнъmМsт7eуzSпЬmLuWыAп1k86xlЬЮJнфйp6уuotr8dэoiiпwъpmС97нХсВ4з6GяЬQжjЧaжхеiрfGэdН2ipgqgжчЩeР+пЛкiБOxЧRлюнNQкvmЮSKfNХЦг1ДDzP+ГШZУdR3CшвlВbчXг5ГCвХlОtюsеOжRРX98УоsзшJъBqШHPDYщжYnMчYБи9yълB1mRдЪяPyqъеojшuБqфfyvлx9РшчБщLФщfтДLzTЯ4йщэGу0соЗw+0vВшкьWСяDхЧуСrs+ТлЮэчга5zUдIщTzРъкПЙяvхрЗTЮвшTыДяжхЫQяЮУЮЙЯЗDъзzыэаtВA600Ш+JЕPBkщ3фПTrqalJEkЧ0вNUиGHnqEЬE1ащсRи2Goц-еEyжOбШВЛZGDSРvrАБМ3HYАCjsр3ЩсКЮвmеkKsР4нюEДVшьУEГsЩk6ВQ8GТuиБYaрсМrьвIWQcЕдcgрXБVвJя1АcзФр-Ы2DЫI4meX4сvpqH6кКЧx4bSСsegИBXЪиЖrтСжкБPЮRниСPNGдCaдNXуSoPйсСDYЪIдйЖе5PKYТFn+СЩЬтзyИ-05ж5GSну8хЕЛк972OщдЭФKuКЛЪДIх-I-2ЮеpУжочD2СJDЬе5КPUтiLeаеhутЛnРКтLwйZЩРdВЖаОДMгУБQlх0Мl7AlsRЬжPiСГyШЙуYlтБИnЕтkЕЖЭHYщtФЖqR7oгэHcYЫeЯsПdpRKЩлRмддОuсбО1А8nSрюЬIгlOеПШвУxжгмзпИрПХDcуUч2вЭкKКР4uф7VBZ-ДZ8PС8ЪфW9э-WCJтs6щ7фUSхCИГweQAOфY9сZcza8ТKzWф7tдczь1ЙH7ю1UшpЙcЩC5РлNWДbMlйЬdэЪv+8ФбKДx7О5OДДГКIbАНwКФTqСbWБХrУЭЪМhЧКФЮдХиzВМИЧbmЦaFIJрз3ИЪzHmЦrppVEпpКЬtqЧпiЦaiУГfТqHЪMxiНZjЗеBа3qкШ0Iqb5ЕgЩвzЗЧВg3Kе9эgjPЖPБИТЦkGКZNеlъЩяyнЦfRpЯзь3PЪшBцiZZХЯййHЩуEhцqhеюСШлеHЫТNУAG2tFiЯЩLЪk0KуЕОъКЕuЩПГэцK6QpЬaОТХJ225-ЖhEЪмСУЫUЛэЕбЖэгШу30И0МчОoХ3ФOнЕnУOlР+ЯpшНшTpХ-IEчoяUПощо9ХгKеx60mкыf4+ш66зХйhBюQ5pЮqбCsФИЫHУДйЯ+Рqшg1KФEХ5Та1grDrЕZпХя9чsцGрvИ9PihaмЭ5гWYВiБсSwЗwПщuхoу0BkзФwbDkЧMпh6ТюмNЫЯд0CДДWКИБпЬвМSЛХZИОтСмЪцЮюKHАэlIfzИъ0I1РN+XBKйKpЬEfпаNВЯ4уLd9gдmvoЮkpГCюDуЕАAXКЩИЦЩjЙBtДSfЭчwЯРNj4vO6зHЧGуmaT8QэЬjАDЦеРhnoРЦПщвDМЩР8GCКuЙgzВ3гfТАЩзчkRнйЛЭKVhБJоSуЪйMnоYgQqШЩcj4АШUУлМkqйЛЖйЩmНglТ0vсрzcхИДkXlXTRn2воНм8ОupeHЙДкO7ЬяЙЭtlvТНЪKъ7иIbЦr0TюVЬЛНаEFгsаPCgОЩtнагп2яЧоез7ЙhAbKпMlхАЗЗmjДнцjЫЫЬN-aцхowо4RшЫ62ViщмХпЙLЫvИNщRчхХэFЗУЩЫБrvIfzЧПэ0зъаЖХ6JoBМр9sьeГIaтВюOiнсTФхPОK7RИPCсqйlMkxy6ВЖЛiсе1+IkFtщйЧМЯBQzдгOтчС4JВтКкЪфvШМщЛЭ5иF1йжВЕмmryмAсиJPLзwiИsеVщtнnДз7Uз-XcUQидюэйз0тНт-oцqуHжюLбйvZЮGaжeжлИ9uКЕ+ЮVНйжФfмФpфmiQхHfmЩхЗХvДшЮVozо6лМmТкааоFМCQсCжФwТvqпЙъxPUQмdЗ+Л9nГouXOаzшWBSЪОэDЖзCЙxХЙpDgКПдХUЮунвByЗъСзPiлТчLЩнккЩчfyрOйвЗэwпнЮHОцIбщJсШьпжпfющgчюоPjюDимуzЧуЪrQфb9ъпггTщжЯyюъЕпэхLхЯbAзУшбaAюпГоюPДЦzьйяgьЯуtюоLsюмЗкеrяЗr0чьLыиЧн1Э5ю4иэ-э6Цнч+ъ5+Ш7Mg1ИHxmЗ-мз+KWШ+TшюИзРяфIючr-мVШ-Бф-xЯG-Зo+gs4Eс5aicHоPM06o1цЦС1j20fc0ЗOгhw6HЦrш1zpuП0m2yИУsшН2Л4-cи2GesHуJСhШШмШM3Ъsн3ЬШ3Юc1bЪс3вs4двШ4ж6лсВIхкoOГЗGOкsВЛrVAИхkнзчulYжцcWЦ6jHбoKБaHэBsПkЗTыcKkt2оюvсV6UaGпИiRФХ6eqмъoLHдl7ЙЧB5Нц6а6WOKуHR6Нyлд5нrHBИJ4sфЬhдHPcMG8Mфm5-5N6H+oZ6цHзyVЫМdС7dиH-гш5jlyiИYfР5+ХЗLbнk9elAХеrdKsFTшвHhMуcб9ЛрВхTзNoгИ6hULП4qK6б+БиUцрСAmV9I3MгТШhщШkбСaHлинкAА3ЕFDИYИFsИбfБhCdсAZСWТжТc+1бМБqiqзaPrkркбИzтчЖЮ2DсВйП3nOVузuВм6GР4RСCЩьХКфиFКhMTЩд+ЩШWGfиGeуOEйFC7HMЬVБпbЙЖЖGБюauoXхkKААGUуЕэMQвBо+ЫrUV-XЙфЫcV88KMRщNNqШG5LUтgсPClаЛGuоЪ3GVИЯТбсv9ЙЯW7qППrьуЗ8VoТDo-щWбbUWчIгМЙyДcoWЙфFпsлЯlIИ9ЧКc4ъи+ИEdзNкFе6ОЦdРзLw8ТLРжHBэВ+оECwИФ0M7гхфBеAFIVбBЕИхчQстлзlMYqy9VьЫЯСНуFыйeqFтlsCсoРYТ+EЩGВнdGZoHпhШZo0D9й4ажVГЖЕвЪ0rцAфI6gБSШ-ыяжВNЛVрНщLКeв+ьЖH4ЩЩbGEQTСfOеcFMakOLd-2йhggРotшдOрЙdтhkPРЙZRшЙOгФиHBцuHKыE7щVLйHиFМKBUDM-RЦz-OбtFaY7Нщ7LяШКЬоWSk7TFXИв2ЪцS7qСutVwщnRзsЙtИВОВlQЛЩUБW7LТFР6иnJoЙ6iчбИюБЛДYaP7жбЫЕУщdпMОгBГlUЦяFOЦLTTЛшL9ЗПMЪШЬm8LЛFWК9ччШVчYuСSГdXцУфgЮзGБеWГжеR8XрCЧGPCБOGтsvPZYВЩdЮBHPOВ0бMШРJСSSс0WJтWКHкZLbEUцExMДQ8raЪЪдNдкLиКZcUбBЗcbUЪmVцObъuRbьЪbТFE++v" /><P>Таким образом - разбиение на 2 класса.</P>
<P>Классификация по max дает :</P>
<P>a={x<Sub>1</Sub>,x<Sub>3</Sub>}&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;b={x<Sub>2</Sub>,x<Sub>4</Sub>}  &#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0; &#xA0;&#xA0;&#xA0;c={a,b}</P>
<Image ID="EUZ70YH6" DDImg="АЗЙЖsrб38-j+з+++Д+++++++Ж+++++++х++++++АяАААЬАaКярярФявlЯяФCяЖлянsИяeZяeK+ЬG+tъ+-Kв+уК+Рьm+ягФяЗzlяfCяDлЙяуИяЧZяYХ+ЬЙ+tx0+Kl+уZ+шРN+яФФяzllяCCялGляИИяZZЙю++Ь++t2++K++у+р+Р++яФгяяlЗяCfяaлDяИуяZGЧя+ХЬ+Й7t+xK+lуа+ZР+NяФяряlвяCФнялЖяИsяqZeя+eЬ+HGt+ъK+вАу+КР+mяяФяяlяяCЫяяляяИяняZяю+юЬq+Ьt+tK+-Kу+уР+РярФявlяФrCяЖляsИЫяeZяe+яZG+Ьъ+tв0+KК+уm+юРгФяЗlяjfCяDляуGИяЧZяХ+ЙяЙ+Ьx+t2l+KZ+уNь+РФФяllПяCCялляYИИяZZя+G+ю++Ь++7t++K++уш++РФгяlЯЗяCfялDЙяИуяZЧяY+Хя+ЙЬ+Gxt+lK+Zру+NРФряzlвяCФялЫЖяИsяZeня+eя+GЬY+ъt+вK+аКу+mРФяяяlяяCяяqляяИяяZЫяя+юю+ЬнЬ+tt+KKА+уу+РРФяярlявCянФляЖИяsqZяe+яe+ЛЬG+tъ+K+в+уК+РmяФягlяЗCЫяfляDИяYуZяЧ+яХG+ЬЙ+tx+-Kl+уZ+РюNФяФlяlLCяCлялИЙяИZяZ+юY++Ь++t+0+K++у++ьР+гяФЗяzlfяCDялGуяИЧяZХЙя+ЙЬ+xt2+lK+Zу+шNР+ряФвяяlФяCЖяqлsяИeяZPeя+GЬ+ъ7t+вK+Кур+mР+яяФяяяlяяCяняляяИяяqZюю+ЬЬ+Ptt+KK+уау+РР+ттятжжжЪЪЪяОООВВВqяqqeeeSSяSGGG444+ъъъооов+ввЦЦЦКК+Кyyymmm+aaaOOOCьCCяырUUTY+++я++O+я+яя++Ц+яя+я+яjяяяяVщ26+++я+g+c+++3-j+I+6ю+я7QSИkUБ16HьeЬИkVГ5иEXКQИlWгЕ9MnкЬИПlXЗDUГ8wQЙmYЙHcоУeдЗПZЛЩLkгКQЙужWЛKpукЬLЙnbП5rяШ8RКocСCрrЩSЭКodXУVЙсyRКfpeХEСjкчЭКpfВYяlIъRЛqмСhkвНeЭЛqфaЪdнгКRЯ9oZШoфуЧкЭvРйЭsMь19ОлLbrЮБ6HLэvzрkвЗEdmuKиsmеЛРzZahAtnз9SQz9SНnioйУcПOОvНuхЗХiгуЛS6ыqнЫQ7лгЮxЫrЗпЯmэ1TSwЪsсгWBXрЯюЩtуз8ЕRГTSШuхpлфhгЯОЦцvчпдxю1тTzХwщуGК-XЯЯЭxыTчбЭГTЯЮюyэыйслЧ8кSh1K+2ъШИюbхbKE2-a6+V2-CжаЩC+Р+5V0p++RЭDoшЩ1гэUrVБGьcб0ЫяdcUГQcъJV1XоJHV7WeIвЧYVТШвЮЦьг+VДnоJгЭCrТхTWo3ЩrШpg+NсYЬFCИXFH0еMгC+sFtYЩVW1Uа+яs0II04VШеzФGщИZЩИOшб4Gc0NШO8eUщжЧK0NaZ9эtNMJ-евtbяhANчзT2ъ2YUЪmкЩиWAэй5ио8mКис83ЕижUGюжuE3LюHпaJ7aЖ0aтФЭdР7R4ШъO7gGuJn3юayeeПъСХклhsжхOffYрУfГiА4fмЦiмiФв7DlYужm-SДgOtОyлвkФЦЬЫfjymкнXqЦKPТDMt-лFjhоYLifзЦIоЕrXцoоaпyЭ7ЪwAТ9FpxЧбЛcyBпсPTrTщ9Аdй0ЯЩkYСуЖ8рm8fГЦkа55NсkБHjХс6LВHIсСPHШасШDЧLтВЛnOvтЮTлХчсКzlьЯBКbлеmэkДbМтлlяPШуцvЯЬШПТSНAOРyЧ2ЬUСrPНkdТYfнUУ9КvRQФ+ЛxiVХзсNгВS6ц7kvШjИKqшЗa6кsБрaиbЖгbfЫqЧВnжЙкzFККEJъvюbзюПoЫyЭХЬdV6гbIqSФrLs0pЙlЯтSзRdЮм82аdЩ1эъеЯq6ЛКd6ХWднбTЗiЭEХFS-ОOб3НxCE0рMMefЫMvОcдчaяkхАьmиыбнь1RщW7QKДvБуЛ9yаЧAЗдъЮНЛ9qщАTАXiь9т4zВшмЛлюwзvWTOcфяШнШxИШzhxлTГPдcшeЮЯпvмА1РЦd0jЧSддяйDSьxыbbДня+2ЛцGgчD2нhхOЬтТ7Ж5m2йpfUC2АГoSpБ8ВР--JЬЦ4pшшБй3р1Ьъ8CgGopЛFиYн-eЯп4ФKTaoПfЗчGJаAТpнaэB3гЩЮ9ZбзmKЪgяnюФVЭy+и7FRжпэрXbWЫ8ZДfwEиэuгWG53цrWЩDfУчoAЦ8LEmХNн3xМVСcILЕфшlуA8щF0вYS4EuFЪmщРщBДвДlМнФр7щСдAW6gжNдЩпAЖYkв6oYСабHTИбРm1шMN82х6YNТЙOчKguOиzNШGWxлтSьpПрUиДЮFNdwUЛ0BЦжЪRТLГЕКДwПmшIPИKqYЮfниРIPБАXgttSИКвmI3Бб+дmдЛЦmAEOХVGcЮЙКтЧдПL3dHPХ8ЗyZюENшNtIшИcFQuте8ЮvаВLz5ЖКOZKаэFYоGNwЛл05NСых6qЛЩКCISН3XюДaЖBДЗEьpуwХМфYГUИNdHxИB7mЫayЭТnHюGНTIсжЦЮйPП-kУV3ЭАиЖwдXYсвОXjlDTQШIVс0IvайYЯВАЙАA7uHXTgUkdя7HуU7F+IkСvПuАОKUС+ыAaoПЩ2eэсoЙLGЪZНр79FяM0ПaЭFкщЖMUMбNoВкeZБПзtgcKЙTзGoжавИyPeCYмlgaЖлcuU0цHdbJIвСZWМH0+nXиIлЧzфъPpвД5EFXG1X8TЧkКхZJFнgАаoУВ0NJгьеBЯll0Р3pцfAРхбдыnХYOCуFМYйИаrыГННЦkлNxauufЪыOGЦIfRюmлЛ89ЩГuTqpXХgнlЮPЧФцKФbГhhпС9ЬЦxюqrs3LсП79ЬгeЧq3еуЙhчлОPбuЦrlЕgSСт8ЭвВLл7НеоуpPvNЗочpq7хощНЫЮмЮГЦtfБjTежPQеЪrwчкRпыЕPЯоDOЦyлRоюэйcСacrxйЧНi-3sQA193v8SЙVhOAа2гr1АсB8сQwТЫцyш8HоСfUЗМвGPXшДcОс-НvaвKvшЕkыCс5zГСnц0иmkdlчGж8TЫxУюл9хdCгвРrKeAШгсcV3ФeIZЛIЛWи7съЦYТЛVРt-ZСбсzКoдyшМMyЗткОВдQФFIЩИZrУрюэuЦеГOkNZОжmпПК0rmыYНОdtmВщW2еiПЩVpQ7gО0RGmTPеМwюnЕjХ2+к3ХOнFknМКЪиZZZЙМKщуСбвAдЕTYЖФ0ZУ5UЬиМKьИFtвE01цьFwjЕrПауфEСsxw3ж2+oг6+LmYлЙЯу2РЛlogыM7UzНрOД8U22ЪwGЫЩятнxц6ZФRнгpэДУrГC6pЬVФНWИ+ФG-хгцEoU5+ЫaZiОqДi-Ь3ЯчдeOБТppPkaиуq2ШJuчTNnаCШH3ЬQЮсqсUxлSаМыпОХrзуфhHуzдЫwьqхGНКоДьkЫзCEфУMыhtBяYЬ-TB7wЮJбoмBфЫбЛIqКC4Ф+МФы2дbПсlсtЧVЕkЫЭfmЮцМXSФLJАwdьцДЭРJоOяЬQрauDTГ7юNMФvЕ9ЛзфuвКKтVYкЬку4oОlpюsCуэлаоDvШЗОц3+32+v" /></Modul>
