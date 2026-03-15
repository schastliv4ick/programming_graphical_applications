<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="QYKO4LUCU240IV2TVW0H" Author="kylagin" Level="1" ADate="ETIURI5S">
<Title>Быстрые алгоритмы ДПФ и ДПУ</Title>
<P>Впервые <Term Type="Out">БПФ</Term> разработан Кули и Тьюки в 1965г. и дал толчок к использованию <Term Sp="rk6.bmstu.ru-Computers" Type="In">ЭВМ</Term> для спектральных преобразований.</P>
<P>Основная идея:</P>
<P>Рассмотрим</P>
<P><Formula>V(k)=<Fraction><M>1</M><M>N</M></Fraction><Matrix Col="1" Row="3" Alg="0"><M X="0.49" Y="1.2" Kh="1.0">N-1</M><M X="0.49" Y="2.6" Kh="1.0">&#x2211;</M><M X="0.49" Y="4.0" Kh="1.0">n=0</M></Matrix>U(n)exp(-2&#x3C0;&#x3AF;<Fraction><M>nk</M><M>N</M></Fraction>)</Formula></P>
<P>Если принять, что экспоненты вычислены заранее, то количество умножений &#x223C;N, количество сложений &#x223C;N</P>
<P>Для вычисления всего спектра 0&#x2264;k&#x2264;N-1</P>
<P>  количество умножений &#x223C;N<Sup>2</Sup></P>
<P>количество сложений &#x223C;N<Sup>2</Sup></P>
<P>Рассмотрим преобразование:</P>
<P><Formula>V(k)=<Fraction><M>1</M><M>N</M></Fraction>U(n)exp(-2&#x3C0;&#x3AF;<Fraction><M>nk</M><M>N</M></Fraction>)</Formula></P>
<P><Formula>n=2m   m<Fraction><M>.</M><M>.</M></Fraction>0..<Fraction><M>N</M><M>2</M></Fraction>-1=0...N<Sub>1</Sub>-1;  N<Sub>1</Sub>=<Fraction><M>N</M><M>2</M></Fraction></Formula></P>
<P><Formula>V(k)=<Matrix Col="1" Row="3" Alg="0"><M X="0.49" Y="1.2" Kh="1.0">N<Sub>1</Sub>-1</M><M X="0.49" Y="2.6" Kh="1.0">&#x2211;</M><M X="0.49" Y="4.0" Kh="1.0">m=0</M></Matrix>U(2m)exp(-2&#x3C0;&#x3AF;<Fraction><M>km</M><M>N<Sub>1</Sub></M></Fraction>)+(<Matrix Col="1" Row="3" Alg="0"><M X="0.49" Y="1.2" Kh="1.0">N<Sub>1</Sub>-1</M><M X="0.49" Y="2.6" Kh="1.0">&#x2211;</M><M X="0.49" Y="4.0" Kh="1.0">m=0</M></Matrix>U(2m+1)exp(-2&#x3C0;&#x3AF;<Fraction><M>km</M><M>N<Sub>1</Sub></M></Fraction>))exp(-<Fraction><M>k2&#x3C0;&#x3AF;</M><M>N<Sub>1</Sub></M></Fraction>)</Formula></P>
<P><Formula><Matrix Col="1" Row="3" Alg="0"><M X="0.49" Y="1.2" Kh="1.0">N<Sub>1</Sub>-1</M><M X="0.49" Y="2.6" Kh="1.0">&#x2211;</M><M X="0.49" Y="4.0" Kh="1.0">m=0</M></Matrix>U(2m)exp(-2&#x3C0;&#x3AF;<Fraction><M>km</M><M>N<Sub>1</Sub></M></Fraction>)=S<Sub>0</Sub>(k)  ;    <Matrix Col="1" Row="3" Alg="0"><M X="0.49" Y="1.2" Kh="1.0">N<Sub>1</Sub>-1</M><M X="0.49" Y="2.6" Kh="1.0">&#x2211;</M><M X="0.49" Y="4.0" Kh="1.0">m=0</M></Matrix>U(2m+1)exp(-2&#x3C0;&#x3AF;<Fraction><M>km</M><M>N<Sub>1</Sub></M></Fraction>)=S<Sub>1</Sub>(k)</Formula></P>
<P>Эта процедура называется децимацией по времени.</P>
<P>Таким образом: <Formula Br="Y" Num="Y" ID="ETJXJEZE">V(k)=S<Sub>0</Sub>(k)+S<Sub>1</Sub>(k)exp(-<Fraction><M>k2&#x3C0;&#x3AF;</M><M>N</M></Fraction>)</Formula></P>
<P><Formula>V(k+N<Sub>1</Sub>)=S<Sub>0</Sub>(k)-S<Sub>1</Sub>(k)exp(-<Fraction><M>k2&#x3C0;&#x3AF;</M><M>N</M></Fraction>)</Formula></P>
<P>При этом 0&#x2264;k&#x2264;N-1</P>
<P>(Использовали <Formula>exp(-&#x3C0;&#x3AF;)=-1</Formula>)</P>
<P>Этот процесс принято представлять графически</P>
<Image ID="ETIQ03WV" DDImg="АЗЙЖsrбz8-Ы+г+++Д+++++++Ж+++++++х++++++АzАА+++я+o++я+яя+g++яя+я+ЯяяяяяVщE2+++я+gР++++z-Ыs++2юрЙЙыfxsлНvяYаcCдйSиPeiмлyрgйПфнЯшiпSьпяАUрИЬgODИYтЙQмuTРcфКЕhЪjШb0АtеOО5Ач+ЬUдВЯgъНОоHИЭs+сфKЛqйМАм5оыямб+щ+G-Ь5X-ьРD1уOBф+rGHIЛB2HЭLWB63+RQMдMJYэшВObJиGд9JeцZLQLбк2URdDpriKplzоhOL4wfч1NыХАJEM8V8ыUВH02СЛХШЧvMtHПЫNCъбШЫqъdOHtХМTvЩоФДОнIяnЮуoИо4ьеаЧаFлШ6ЕъЗРЙn9йЭSфЫKкPZyswyYAb2иUxс3naАБЧVS3яюHgшСnI5дАqБЭgъsИАeЪЕсepКВQGРбyрMзФFwMlЫy7PRM4oEРЦKЖNИ-МыИиодУяh-kmuКрЯcnqТсмыЪсЮfТjx2ОНd-х-ЕГlЩкGмдкГВЖеeCcхЪHgЭsPSхNQeтбЧЛ9уЙнZДKчZФГьКЙблыrсBKиQЫтХpcc-АещfcqмЯFVU6FR9HK-ОgеСЪ3tМцФчТиkыщ2lKUЦfФЕСNЗлцnFкхНsq0йPaZыKQa+58UВрХнХдЦrкWАkТъrЭбy+LAЕьAсТарXдc4p+Uтян2жWеЩвjvхЖv0уэн3wчлЯбЗШУИCкwжULц7юдУХaеАЕаыЯVе3Реы-JЪо6ИlЗBяBSHMБаaьIH30аБЕJнЗ2xЧШlKжoфАмХбMМ5kYшш65W-ЩrWaкBУDРЭ-AДRshFхТЦ7ыUkтQAЙнБв+qЭсВK7C3AАS-qщ+Лc8дфmNFШМЖ708ntйпН4oНa9MDзь6еыЬO+3aТ1фт+JNДИчaхrвтUегGOХйгEEОйЭRMPМNг9МAлйзоКфEищVЕИЗиXEШWсЯYIЦъL1QKжeйBЬэокйbgsy5кcYOаияdcaъ6NerqккьjЖeплgoЦклhяsжeлiwцяклjАuOАfkБKfPlGoUлgгГюabkfnKАыОыnЛЮUgmqЬКЛ-qЛЬЛзhlЯyEоfчг8PНsеъMehcйeЪочv+A9jiлКSАоqIkАЗАqЭжkjiRлyUпА2LжмрБ6bgрtВArмрГEAЗgсДIЧмтсВ7cQсЕoQHьSoццЦgтИYLмтxЙcbМАЖMэfQсЗФШЫ5ЙzYтvkqnТЮw-НшТЭГпqЧкыiнАВяwguПАWЫokgЧАЧуhФa9hjOuяmkoСЧПvуФzЦН8-ОЩлhц3ЮCУmфШигРШqUзbнqЩЮныlцЫфПrН4ЭфzBrgKызнцЬкzфнчЯыqVушайTю2вj6XНшGDrДyцдЗРitчШюKDFщеwЪпю1зQЧш9uD+5ОщхиtIоъй3yv-ъкЛeЮ5ДлkPЛыAУrЧЮмоhрЭiыkybEьупАCЯ0сДФчhvCИbjцьлTjпькtНуРэфКЗмDxцШЛDvУчЬУDy9гR5пъхщопцyчиHhюъnЭLпВырLЪjя6фЧпяxыfдjяюkTрЯямч0-aCE+gkа-DTЧzыhРч3cУа1-szф5ОрчSnаА3lиБBоEП1ьУ+2zsЯvтBE2ZьdА7СMВлщTE3ДлЫ8бuШВEОE4pуwАBсMГфr3E5HgЪCй-иvVBF6kЕwWGHsДQWel7ыыV8IHчnbОlЬЧВIвюJП-ЧqfоСЦуHувLЫ3rlnClФmФвNGHзxpiFуpгугPNcВОtОF-VkгYRTХБvоFV9zфбUяsЭtLкFE68dUTFйeЪRTGFCЙЭWVфЙeЯНGGSВ8ЮXldHгaнGH2йЮbyБ7BлBтСOЖкВ7мд5ЪСBдJjкЯadзITtgйW1ЖsJXа2эЖБGпGtmFAЩ63BЕаФ8Цs0a6JЖйfыМкХUnиФР+йЛ+GЦУнхW96ифТRbYHNьP+зgдoUKC+дvKЙУVeЖsЛ2JгкП4V2ОYGхНШ8УEaЫ2КzsтEбWUnЦrмbOUSВ07oгjAк0иxлшНlvV29r2ЙюеюЬmSpхmFVsEc0ю0ИЛнG4cvFщcxlOu3КGАLpЩ3fH2lWф2ЕРdуkК5+JOKIaйYМРcеLаIPЬm82фc-УnNБЛДFgЙ1пNDUьA3exOIi44e7ГCdХFi6ЙO7эr+8UHПiYkЖАBeeaSГщФLфeАСБфК7iСПaяeвbтcЛJ6ШVФAш4ВmГНYЙp53RщY2PрДGUМкmЧЬKУ+Сж8йЛ6ФрP5нЗhJЬрfE2ъTЬQЖHgюwJlsТъPhхуA6КlCюВФSFл06EQеGeOОЩОВТHcTуw8XsЪСНcьUSцGD0ХЙГ5jNZAxЗdнФ0Ы3dцОТФaFMЛzJюыT0EнжVШХОДxlG5кр5PY+ТлС39eЛBSТtЩtМжБ3ЫЬсYбОn2щgЕеркagфIdДBХIОЭ5DыM-aqIxКeхмыHИЬДLлЭBБSQVЮйяingЯHмZШмYJl6WnБьХеФАсZZwOMoKВнucакdщaпЖ8ZЩ9Н5llJSЙbpиRFжфпe1QйY+РГшjYwMArdфagЙvBЛlZHФleДLyсRБхДTVЦЭSШБРtЕр7kуШplшpvcшСЪиk1ЦUФЩт3нhYGPруИшь6zх-2мuYМJвYRд+roр74kguZзФНWaРEMO9Ь1BZIj1шCМРЩьАszщЛВsрРЭhWюеW0ыиpW+ИA-К9ЭNPUiлюidUнДUXуЮДZдяе+X+У7ТуъЦcБжQr0им-nOйНйЭ6РFс0Э+eDNVQЮБ1ШUж-ТnФРкПP0AэEее9cУ3ЮК9JНWЭ1э3gЫ8zy-PjAЭ1Yхм0rjЛхЭФbн3B5OГшрф7FQЭfн-BзкеfqjгBLтBнN4Ъu3хshениhЫК8О8rIKхС1ЧзвХccЯLЛцНпюыrыЯыжЩБ2qCр1ЙVЧxт+Щ-8Ор4жvьб3bsБWYорPлЫ39хmЧmиRhЭQйаЭhКrсСиppiJвoЭЪгqФQеЕтШИЛмЩPmpЗ7GуKLiЛжYм+ОуяОуюSыьзЬАDuР5CЙYеHRуb0FВхiэфUkъ6xfнuGь9ТаNMИкРsfоТЗXVgzуVxЫчA9Д1мхXkз9МdЗAДЭЪцVTkхваNЗбrЫО0ЙlZb6QЙuВ53чduуаvBmйжИSвЫLл4teюjиJbВММЦnВzЙЧуНDHj0t9bWbзЬДJЖхГцКЧюКQ26РЯгlцQчHЫуnpй1SnУщ0IюIsкЖэкщЩCлзQЮмЗGxт62GZKoSxлдЧэоуТ0DKФЭrСLcю6ТgZCYФыoЗЧytзАсXфДяolRLюUЪСBфьwTыtЧyIУЪFNНмЪьяi0Д6zk5roXЯТEИaySAVLq1MzюэT02йBБРюкgЪOTB4яPвVFсWщтд+1цaBоb+псхycвУbGQйkUъAиRЖТHРрАXфРaoКБ-JMdЮGQbПч-oтЭбнJ49И0JЙmXGUQ8cn0pGщA++Ag61гoE5lАяSи1DGd+3U1wиeXц4шБШ2ЖЪш2ИM2Кs-2TI-+v" /><P>где <Formula>W<Matrix Col="1" Row="2" Alg="0"><M X="0.5" Y="1.2" Kh="1.0">k</M><M X="0.5" Y="2.6" Kh="1.0">N</M></Matrix>=exp(-<Fraction><M>k2&#x3C0;&#x3AF;</M><M>N</M></Fraction>)</Formula></P>
<P>Схема получила название &quot;бабочка&quot;</P>
<P>Для вычисления одной бабочки нужно вычислить:</P>

<List>
<P>2 преобразования Фурье по основанию <Formula>N<Sub>1</Sub></Formula>;</P>
<P>одно умножение и два сложения.</P>
</List>
<P>Количество &quot;бабочек&quot; для вычисления всего спектра равно: </P>

<List>
<P>умножения &#x223C; <Formula>(2N<Sub>1</Sub>+1)N<Sub>1</Sub>=(N+1)<Fraction><M>N</M><M>2</M></Fraction></Formula></P>
<P>сложения &#x223C; <Formula>(2N<Sub>1</Sub>+2)N<Sub>1</Sub>=(N+2)<Fraction><M>N</M><M>2</M></Fraction></Formula></P>
</List>
<P>Если выбрать <Formula>N=2<Sup>e</Sup></Formula> ; <Formula>l=log<Sub>2</Sub>N</Formula> , то процедуру прореживания можно повторить log<Sub>2</Sub>N раз, пока не получаем двухточечное преобразование Фурье.На каждом шаге будет вычисляться <Fraction><M>N</M><M>2</M></Fraction> &quot;бабочек&quot; , каждая из которых требует 1 умножение и 2 сложения. Таким образом , общее число умножений равно &#x223C;<Fraction><M>N</M><M>2</M></Fraction>log<Sub>2</Sub>N, т.е. выигрыш по сравнению с прямым вычислением в <Formula><Fraction><M>2N</M><M>log<Sub>2</Sub>N</M></Fraction></Formula> раз.</P>
<P /><Image ID="ETIY0P9A" DDImg="+ЗЙЖsrбГ60ф-г+++Д+++++++Ж+++++++х++++++АzАА+++я+o++я+яя+g++яя+я+ЯяяяяяVщE2+++я+g+++++Г0фs-+2юрЙЙыfxsлНvяYаcCдйSиPeiмлyрgйПфнЯшiпSьпяАUрИЬgODИYтЙQмuTРcфКЭhЪjШgцЛRнъzаkшМCiPПиoи+2UШШо8ЬНпjЫпш7Врasрхью+эwящ4567Сc35GAHDDяFHB8KLMеNr0G6JQKDS2ъJRуOJbHdR6тХhHUDd5jмf7rs7LtэsфwrKzuуyzp1pFЗTEBКCZPыЯX1UСl1ПЮ-ПpV-яougГJА6бIХгжеHзщйeGленDпiыЧЛGхОmZэFQIцGJьcхeх+ЯoяNHмй6злVцu5мUВHш2WТБяL-КЯИИ-ЪbВюЙWwВWрUОРАШUf7КБTРЭVKтSж-+щ4aНiqAгрдonР-хISOйI3AОЩСBЫCКv6чФTЛBrbрТAГnкMeQmзкьЙфXкЧWэy8Э+ДпиЩЗзzКO-thнxзZРоЪJXLМЭIvчjтMfВНаР-ьqШь+usЯШxнлZJRКссЬ8РAWЛжEаmзеЛMnлЮМPtnзОJБяьSНuoйЙVurbyНupлPХRЧzSНЫlnм4Kш4РuqUEШЮeЪо-пРУfРв6пdдычшгbVАDbдyЭvvuхЫljлхbНЭтчнадзяLwywщПйMЕЙ6+АRr2цобяиУь8юуkbBЖnrпИЕtф3з3юcЮц0+K6Uм4aи6Эщ84чЫовЦш3ШАZgБДB3ЯNжFТыСЙLNu4b2HSоФиmxЩ1NХFWъаТйе3пyБЪMQgyс2АQnNюЖKВS6юMУ6cКKАддYТсвDLKVlW2ЩЭИРдFтХEеo2УВ0АJрUБЧZфaYуPвHЮg4дNмЗЪEЮMMеBФYHOsжБ+gПСАЮWВVКЩзMеOnfМNЮрNПw0ъе4aO6мyу-3qAHbCSc-scLЯПSУОGЧРкПCYчoСHaзOEДV33Кч+ЛRщФЩ9u2DжlиdLwШO3fвAУHНbф-ЪйEzdeFлEsБИКe6kiFgФ4юЭкмAzneиг4vюК1Сg5ь8ыNА7WRлнAП9GFнqНр90нoДAлКУTЧKЫ0rЯшЙ9iGлюvнКEв4pDЬжйЦыВmзаЛЯgyЭт9ВwYp+мБбцKЗьjzшWмaZВЗoЛ0srААм0т4ЧьурmКвь-ГшzрЬ0ДШyFЛ0яKLAgлГyкwlКsпmМ0АT1QъВlaЧw-ЛPeeьmОЖшЕg0Мvbd1VAqLэnОЦЛшAeТtcxК0РЗ9wГJФЖЧxрjдтЖQ0УmрэipФWИмхШНCnнgЩЧгRюiЪИ8RqЧЪдЗэkЦЪАJxoЭvШB1xАРЛнчЮшWгБq4ъЯvъшДUчэчвРЯ5ЮЕбчfZЭ1дoДлqПгюMrhщКwVvЮхбHыЗKщиwРC2ЯйF5оtGPPFоъЮfГ-ЖъФP5wыЗчOxivвlчDЫыЕzPSьцFTноьзГkrьv5cbЭзdФLTjэЦлЙчЬэ6НDмйдвСПпэлyЧ9FэfЛЩHTюйLfюпэчеXЯvнХзHЮyьВvОЫяъшлkyяжпУяВюBмУЪчтrxщчбА+f9TцыQUyуЭD+м22аяEMАjю3B0-2ЬY1VИs7yAЙ1JМ-5НkRБCIE1т1йб2hc1bB+EшSQU8vHcВDeрзиGыб3TИvRVОРHpьЪBс3MwTЪП6дИВвDFVД1Ul9зН2T6DэрВZЪgс6угRюЛWdиАiyB9ЦБYHMбchЗ0щСОУФЮOZГИqnuРч+gфгJЫcГmqOВУcАг63AJeN-егDkkI82-нxVu+й2gSQzцLИjO1т+UлдOYOщ3Щ-ePыOфПвKX59ТcеPw8JхSS7ГЯэйРбцыXBО7ЖGpy8ЬgДГggзk8МN2фФUEE3gдcS9JYВоtААыkIКbBUm7ИУHтYRЗИ5Фс7зOТaЭaв0ЛЮОXLouАpVqщZГеcYZUъ4k-EI8ъFАOaQг6uНЙНJвBщ+kщжЩwУgОkUУ3uooМT4NIa6-еFLЩAcvGС6Ш2фNо6O-ЦCйxKCOnS5IGw1юе5qoЕтИНмъБqУmЙFоюАhОСIзcДNXRщ4GVжIБЮТСtqцВЕ4т0wbXR84ШXVТ7fнБzCflУГYI1и2гМCтФЗZiYЗ0tъйВ6wфN4pc6БAткУLДЛUdЪpoТxРeчeъУA+SIYщйИЧшвmЦONкHуmъHrУuФЦJWЖfрZМХэг8ScТХeОцxf1аN1ZU4pzSаDУЙKGЦCAЕФУJИС5шхтЦxypjCxkCдXЫUЙТСqqDвF9EТГly6GШv9ФEqш6МваътPрЪмEQА2wKСI1ТWOЦЧNчbИжyкqЦШиooV80Б83rpЩw+СumAQХАЕЖsGBои9ющYkрdСйaGиQСш5NJa8rуtенLоЙ0kьSqITХ+-ХSkЮДхIцЛ7ZLWsYRЪjFEI7w9-MТrМХцНоэШh0чнГdЭHAЧЗcsаfDIкQKekJmВыhvпnШКыКСБэ0W5HтЛ2ЪЩЖаwеJрqC88-уmДъС5УзЭж48аLРоЩbKOGfcA3JX2KSQmЦкБмJЮяЬWДкDдOdОСsоvхшЧgЪЕvд0EЬj2щ5Mu4гGpжr6фpЩДЮsЖXBниС3лDFyIZlнД6CЕРtl8юU0kJHKy7iЪщRЦqjHЯn9еokВГгRОЪNЫAЖhщXtжЙуЩLtfРDЕЖЩAкsanjMМюBТСaЩщvwIфaylРzзyмО8ЮVRГHsж2PЪжVadmXл8йИоУOН3ЬЭHYЕBеjQ+xSЧвзaуJиОПУqУдьprfХьаf7щHХй8фзaRpкsОDЕZa91TсhhШЗCIТwiiьчуpзhoOШ+DЦхlHRлеэПЪЦo4qqдбчнTXvIяМoоjOxнЮlTЩ4Фжувv1ШaтLЫЯЬЖжтrн6эPFSИЭпa5тGjxиЛTъЫ5lНrАУеНРбFЬЮ0paиВ5ОрuRыPПЭЖтЕпйrр4rьЬMшys7нRр79ыwyDПoуVяНЯяхыNгcDаИ9CВсАбмящВЪчКСШкЮ5jQЮ64р1зяОуюPЫwТsNЯрq7шyГNчQяMчLСЖЫЮлJrэNиР5tuzRmфbЯщ6Ы8yцФhMфchзэзШ4чVreОцgыьиgмLvХNyцmчvxдХzъЧшjНчqjэнsечVВфCхjnйЩпЪЗыыюYByJПэщйч5uаrОУчюpSззzЪъДfyшNЦвwзсzьШпzAрКHxлXХCwШvzщТОыюПIЬзmцБzLвQQиsЫцъкЩбъОpМSПъ2YаQтDЮЧwsИDУъqьbgСшРfЫуiЙLBйMнАЖЕhшZДLефйvЙыОоюKQ9kжZrпBмшиГtМрЖIЯЫкWq9QоnXп+ГOLeпцу9ЕТШjnFыы0нюDHвOTcKkэсгLЯOYUЮgАMЕIСeзGрV5кдзнЫ8YlгHfрYL3тLaфзa0ъbкяVбk3ЦШSJ-XдpGkрЛ6тU7Я-зeхТЙЕчйD50сBаьФ3юkkGЯOе5uJcГеbСQхЮpИРhдСI5еaЗAFI+6-NUрлкrLйhЧл2ч-HвmeюnСЧ35GtЕЯaш0xХеУZР3дF0ЦбдЬMСТH6---UMMвШ2оЕYLJъUKх4iF4ткsRмШ4b3FЩжE1аJ2ЦхM-я3Ш14БFQaI7+ХЬVpьЙДАSрMUпШ6НXс66sUWЗl6hБRlША0щc7MW0-ДСЦJkРIн1ЦМV8оБТЮюZs6жис6оsЧYM6Хaш80GХeвИ6w2яRеоЩk+7ве1иQИmюЧ7cЕ+эIMbxВmЪз5ГiжlllZtDc+HиенЖзОr3тСFsmzJ723JBRАnQRЦяZе-TшiЬOa2vзЬЫХгКjЦZjСчXhШClkБ0RrПйфAдЕE-cаBЫААnЮZQQmKMя3ЬaЕZЛ0Дб0saаUswl3ЭНшхCiш0сoCUеДПpИ1Dд31яхФДХNBФв-YUZВKtП+рXйм39cЦ4Vе4TК4КМупшZtпLm+pеУМПrЗДгybУзAqВ0zгХ-КFFz+UжnaЯUцkxCУЫzУшbбаC5ЩI4ЬKгWИюпiГх8ИdЛНdG7юшТйшг9сЖщиcщAИцдiзл9bVJеИщДLh+ЮtЙnщ7vЩЙ8a5+КзEрлtхEдЖЗ-чJК7УтUфкsщъenвлкmоcH08xIшsnсjкdMRkQ+61L-йшжчьЦ3cKфЩvНПжGфжoд3XMвnsЩbnЧNdLШДlдWaN74rKиjNiZMv5цЭzи+Dййо44O7ЖtзЙhOпЙNфnчzp7Nм4PаzщORdEвpSюmtOF5м4wгLeйъЪeДMб7Б5NfQeгOAXjмЙиEWrMвь6сгУQОйayottyKgЩЖЩЯEЗАyбЙШpo+wsяRПdOdЩMгнNщurSдDюdQmaБZyl4кNKХцЩJ8чOыNTsЦ5НПдOQжE4щ7juЙЙKнNSЫЙRw0КTжtPцЫtF2+T5uДлоЩiЗmRgBъQЫXM2ъъVTЪRStэCBMPvtQДjЧSWЪrRpKзЧtCЛoяLжЗChУWу8РшkКUHСЙнduNl8НXфАXbШYxаЖX44YфeIWВOnЭЩуRоЙт-щXГVNvНeЖбЙшчм1uЮoГAFHуgъZLПГOБЪЕдHeY9фNФЪоБtВYвъUH8ayтЪьсПd+ИIyбъЛajIIyтGлx0oЛЧbMЫbaеOIъeвfEЩbOecyЭ4aь7UлюeLкжZ58CьYТc8ЪълkЗ2юНдG2оЪdhЕхОКцdЫфИЮкЬГМъdUuZSнNa6rЪЦГtdрЪqEuюс0uemъevkкх18OцъrfIЧPp8Зfm1rнкPЗЕ7gТu3отrgЫЙdДeуfпщpwuMvyOюмИAсzdeСu+ТкЗIНВьИ8hпэdWCudrпЪh+dkТЙуiЙъГдъhqмOinZiыЯкRоeNрdИmъHjШdAЙфeЕюЪopwдэuч3qMт9мбGВЗHtwаьAddыП7j8KИ1ыvjrLVзКz5vGlЧСыШиая2еЙOдвэsoX5СkзeJGАreбdaаакТвруloгбЬuOХfGHhWbЖYРэRрctIгGыIМKйю4яЩШQQlмЬ8p-нtiнVжmПыилLЗkteSrЛfoВ1DsБoYeUmLGЙусZ1O7ЪPйНwY-0жД5Kкu3DЙТ+uЬgпыbЙфhоiъi3кXУM3ЫpБpXРN-ДЛFшVФT-Ш1-oэQХ683А2ЖИVrOfтzщМdкИYрEnчЮvaниAуc+HвvОдЛОKTZ3LtЗYБpK69eKcBsмfrЙOйQ1ЩtжcxДМ72СхVЧЫшРУIvmvsЖФИ1zСK2юЫBXtDВЫФыyMРbц3qлЫEйТ8ФпХ6МлN8шЫwНfxdИ+Ygр5SЖ0пSВ93P7зеNmWЕuбfУОЙЙ8ФыUШuсy6myклюOСюfyEMЩtJFwЪswcOkШ2хsqYщTЯЕгхЛяCеЫyDM8м0w8мЫАTчсyзf5АШ00lcьe9ФwВЛwюv3XeЫzГcKyИмЯЕвgп1RzдPnvХEBvБsZGuРиП9щvВOEFЗ-И3jaМЙр3юЯЛБ1ДнMRмuЯ8RнFqvЦf3eТ93aьВYЬcЭHQJСt-CpNxфmОQлd9SNыUsбoBЖWукu3к11BМLГБwЭЭQяЯМI-iмacл12u7sSраtЦgr5жGьКjЖhЕnыыьYАВЗmЙIЛ3gЮЙЛ1ЙмпБаРHнМcn7uойqVсAЫвjvdГNoAП7CBA7чlЩЗqaЕочйm2AnюYOЪИv4vЙkщKjСKCМЙoЕ1pь7ЙjАfхЖйy58ь+PtЗцOКоFлeеeЛЩaЦeFOзаджШjwnpOjжftjфы+Ыx7DЪvЛтЪыIДtЛКмTнЛgPuмМБциhxКЛакijИulAr5дp7НСкb3цbНФ8ОЮgнК58SЖБНxСQЛНьc5яNNЗALНUЮIиAКМgОзСdjoхgШpЬршEPуwШфэЩКщgРЭhКНmtGтzьПlКОЮм7Й4xcovxбшkK8ЭЙMSeМBЩcкГСpмФBйЩСчяufVocoТPrDRQраНК8нЖсЪТАhЭпЕYЭrЮAТAзТ+ыйТSXУoэПю-bГAЕГыяwюУKйУkKQТВcФwhмАЪOZQBФYSЗФyBХFLнФPKХSgщ8UМХЖЬuYkxИЭэУЪ1xЛuэюLЭщWЯRЦкКТ4хзРMэзУnBЦЬ5rYьПКhкoАNФYрЭУfкКjтvРAиЛхQЕЧЧucHыhынзt2ЭФ0pэзштПпЪяhгьНкwШЬsъШ-nИMxНдLЭШ8ННЩмIЩKIiэORЪЦQЩSihYWншЧмяШaэОbBMhfНОlчТнЮBЛRэЪQoЫNУgЫpЭЛjyAЫщNРIFыйiPОm8ЛЬБtlPxЧеУuЫAНЫИщнццxЬOмЯТХRdОRЭLSbСЕнИдюэСЪxЭ5QЫУдэХПRЮъTч9+юrФцзuЮUfИtXАИDЛAуэ010ФЛ3лыэFxjCЙPяG7КЮмЗВgdаXgЗьAНЮЛбpЩч4w+ЧЛэ6ЬпWдю1sЪПWФuЫ8qdСqЬюЬДъНбузЕбfkяRщ-Угf-7hэц9З74fQGiнGХьTЙкKo8ХE3юГROSДpюACAж+SыЗRc1IRбFHWПЖAыяi+AiCэvИИuжxГoФgВCdбZТAвЫPЖPрЧv-9KдтефwCбbV1Яз2qТШKЕмЙB8кЕШgУcsRwЕигХGоеЧE3TCЧзР+Тцр54ВШv6хIХНШиTДVп4нwPAy6QАд2ЬА8ЬиiyшА8ОАЙbШ1ГpOHШз3ютEЦUеBaaЕ3NТЖpюИи8оwйыЩйт3кWSкяaюйсvЕPp3ЪMM9эkБвNFФDCГмИV9oCАWюиy3SиПЛzлZОиvОХsnаРС6zЧЯОкЗБxeюъЭN4Ея6гaKBШ2RfsHn2TWКxk7vЭНФЙ1l5ШSнcЬНлcZЪZS-ДyWXsИENВDоHКгПlбтzvРCэЛАQпШФД0ХЦЧмпЭTпrЗР0О3рlЬiAOBгОв5еVщтwмy9ЖбяiкjкОвwлЯлGtшНeьжuУПOrЖЪ2QЩUpcаМбФnНhQрщцsX+cDяqЫzGМЕWДщПDhiYэШЬeMМЭin+зМнЦЩzgIRРФVюnХ+VтKtЮОQZДНwDexHDЯьhZНJтrZО9-dsjЖПЧЮИpыЯЧСЕdWSКCDИ7зwJиSуьЕLЫvЭЫhтЧAMяYlG7EщOg8уeFQлы+S6frzz28ЩРнпЩЩRХОКФюСПц84е0mLЙQПfOeЭТцяЬЛnХAрУхwNyеSОЩЯtЧьнfпыhгXъпдзYNКыЪЕLЭЬEнЛouЭkЬuцBПXiFМщlгИЮrЭЭSпщАuйXjдZXГрЬЪНТзнwЬЗЭXуЩсЧлэaуzШгxXrDfYэПlyiЪьКMxQО3ХжRГйоИчИПAУЪjYEяcЗПУЛBЭZНzgq9disПшбэбyпйьYoзжюSzUХDЮЖRDгHъfХыuшQBnаjю4vzuwЬЯтйХс9NЖmПяхn7ФEАЮYpХЦKхyЭпUjIjрoПсЕHРqхbХГbвхpпwЧчУyчяаРWГmF7iXbcIМyФНУHuZаХлУмЦvеSцxИгfФвfBГаaРкЭМяэЦfЫybfЧнуmsQПУнПhyUqhСАvPsГДЕiЕЖЖCzАoФMЙFzИmКЧUВaНЗDsФБПССТТxоМIАОNКХкyФTЧSЩСeeЦРУЬЭЭгЗЛФФЯЦПYsoВаSЪЮУЫЗеЮззиtiджагНйfGгЩнZШЪпOЯMисттuRобвЫEХ3мVпШчHЬСТжМсуьэbэхюPнЯяерeVvbDRьБuць-гЧ9Рбi2О0жVGJlWO-СsiюСcXгГХEVпEYKiщYЖхчYFY5KmFJОTЕDОY7ЕWuylЙожьГmЯGx4ЩдЦYЪxФXПKFMаjЫЙЖbДYшp4В-йФкХnAЭОСрщф+ТФдgr8BEeJTЦoйящSтщE1waaОtСnoJгкЩpщ9ъэuкР0ЧyгЩqЭ38K9Эu6tхiirHkЫb2Cп0Ig7hjbЕApHКnРЩуаy3TФDoМp1зПEЫ8Хq-uхyuuM5uоьЭJц0Н9рjMhцффfосiкHJДъДоu9ГНT3ЦFФщ3еoTУ6AОCБ3-+6вфsЮ-БючД71Аzsа+HВ-++oTUФzЮЗфcDаfXьBtюuPQ7UНrwoфO9юaАheуNe8РyOCwХр5чSИоvа9Oo--уwWnjw9coаm+цc6UГ7ПЖыО01YМбпRCKQЖrПBwТпDJrвщлz+Й9BVQeIМР2MЦчРРВтeYБаЗKC+АИф78иРЙуCJМEД1MAFрЙCjcU5йюКиFrhюHизryqgиЖфT0МAЗЛcЧHоsgAДтo-dZYПЙWА-+аwAГмnРИvhsтwS6хgаПbщVИmBlЫIБЮСkE1сkгKЪЛ4tWyGUHOJjх-П0w3ДаПvН-мUК5БфEMwaЙhтwFз3юМу0фмnYТФQSЛF6IЬуХхЧЮ6чэFCЯыJацШвй6цЦТвHХцЩЮDWецЩиПXI-БaФpХw8КТxтХKyhl+ЫtTрцwРexJFВ-2сдq5ЫBBцYЭшhрq4щЛгpЧЧъrИЩчЮю5ЭЧЪфю1ОхЮдmРMrwEГxMQ3ВHЬnбsEnQDЫ2xUXpвRCХбЯV-v4KЧCxПyLгEЕqNm-GПЦЩЩ9Аoэ-вdjОуц3GfEщХNцqoхГмй4xDРрлеnHQыОВFЕKxа1БеgsAeвАЗУЪEй0ЮaоHПВсViщУYеaMЙЦrDKNОTXБSNЛS7ЖiъТWЩОOныeХцЫaэтpТсНEювЖиБлВzCт3шF5ЭТФА5о2FИ6яa+aвQЯЛPZlЫЭ8Q3щWxNЕZm1уАпCуоSЙуc82чшфVЕBбVЭУRьHхw-BoJвмD6ЦФфAvcCmrpHКбOКhtzlуAФtRЧfщ45dшО6ПАRЫфх4jЬзфЮIЧзoy-Upиф0QZP6ЧcpйЬчлwAeыcЮйwQyqнIz+ьНШrКэФhKSUъ6ЛЕa1х9OjУЖшьАTНьГифDшуE9щЪДHQюЩh-ЕТЩUжиЧzДДkкя+МЯTЬьLylШiwrPД8юwггuЙМCтyFoС3zвВ9и1E1fдбвcsшDHSk2юl7ббиШВWlZзxsдбИеюКгoPFkы2чNUъIтЩГByk5ЛQQМBTтВVG5h4зГTHНF+zfжFоИБIVЫтra-yIl8jав4вVaЕoТZArGсTU0VВкPвiBKУV9фжшЗ98СYfщAЗpКИрАzОl7иmMXSBdIjSЖ0+эV4QtядИЕAнEH9IЫSхшГr2S-GzFXOEZЙЙРцПуРаМдШОoГQОъmEVдевьшиКbюlОZPQZ-tиьpEqтEAКIдdXc5ФжЬlцЪУZiVЫШHpКGнКsФYhуGxвwЖnCKмXjВjиМI3УOJЫЬW2ХрМ+ТSРpжаa4rНЙMржmпK0QasrMФ4мSУSUбQZJGющЗХMАmIсQзz1хFОЖЮтkmтьagoйПt2ЦкFДla4UбVБЧQoйVHэ6r7nгОqеiТoEиcЕxOD+eЛсSНHWg7CиЛDaIW9V3IЖбsРлIъСZnZЙИЩнtТъРE3бFБdНэu6ЮIцoGНьAЬЕЙ8ЙTapclgBбfL7ЫЛX45RКZБeKигУгЬNHqbQкoШоX3ЫoпfпGPлПpqОLFuIuRНaбЙШъtдhaiцДNлМJKWuСOZ4zКжиМcXФiЪОaоDыQбlакWчwИ46ЭNEцYцhОщщЗОыКеЫЦЩБoю8т3БТЪОФзщЩF7aYщд+ЭИ8КЫ2ДB7ЙЖOтU6Тvю2ZUбмЭwPчGНqуlhХJiTMhbАhk90эЭojШнамЛФвpВGOqЪфmNуLrчЬHsdяTОBУбUYbГДhкЬзwFЪkФIХ2wЕ0СшMнE1vX3т7ПкGGОЙaaАdG3Э8Ь4ЫPьPЕЫbn7eЙq9хОхtгzLгo9ЮeXkwШАЦаDZAБA9ЖЩ-NQkХKJgЪЫmJеpK5e+ЫANВOiХ3ы4pfЦНЧpфЫКЬ4hЛХBIумБXур8нdZаLTAЖlн4LБUгkm+RAЬaiI2ulцЬЩOлЫь2аПЧksЩнq0AЖaPс5GTХдbnШxЕСЖЧoКPe0оaCфTQВБKPKnВ7пОИЧкCFCSQаюVdДNРЕГоЦlщЧKo32АЯнпчOVEЫP-зЪжfQJ2тvщзGЧ+qРнvрЯИbЫНRДСqBТоиЫIЙЬШ+цZсRцЮRуЦavхy8LhрUadы4SlэNр6RWТKнрЪRТь1НBiиeBQщUtяnтЗgц6e-UКДСХrЫGКrхаи9Ыn3Yuх4ЖЫЛGsZйдiЪШоИSоKкъКU6k5щРМi0зp+ЕхlDПКRАqNХзnв8tоРNuРFмe9UеЬeсnДBрuЭgvCrSЗЭЛЬКчmсБyмxjqЦуCЯCйOЕвощЫ0+MпG+gзbЪExcбwОП1ВbJ9LtQAеMыу0гhкЦйЩiqspхлyjgGnюзqr0ИCиWTgЪпхVQ4GщетХvUДюQeВемSoТьжоTPУЫ+ЕНущQЪPWжуrФNYПлsРN-нРm44-Онщ9уiTУFLжйsbGuХыЛSБrгR3ХLйФFцMпYуxnCЗдtЦЧsхcП5L0SBvЙMjS2MPЭjЖиbtЮ37цCчъCТwшХLИеSKlпСЕнмbvNvъХцUрМЯяПжЛблiLqTlЧIИЗсХЕАEfвmюl-РзиHRН9ДплЬтOЗXгDFъоwzгeZIbxltПм7ФЯoтhеОxиЫпПЧDуЭцПХэийDЯfЫУФфBRrVзЗ-ьа9XЯчцрыоvаыьРYяaГwDзЙхeъЭyЙюЯXФ5кцTLzт6ЫГяцЪDaуPъьЛTOя6нШuvщЩЙэвПцQcaTяШбbпюZюЯжoФOyЭЩПъьХгVх1aыЪЩxдЛzA9SVы9АЭША1YwxHPwxЛAА4oW-o9lWmАЖТАЪюкyцfАnvрА029wHxгЮ9b+2БfДрАлуcCф5fеfzMgБАJм6FМfXY1xАКБпгхБO2wАP68L2xHewNJьБ3OВиXGXEЪvшvВЮYФ5fuБжQЛlЧаeэ+чfmкАэлБшХ6fmuВYЦufНv1гlыБаЪqЛсБТY9OлXfBйуdsfooаАfeВГЯ+HьDмАUkp49рГЫу+ЮЫzjЛТ9ювъЖo5s4Sot5BVpzфД4LlXЧЪwFаБg6щgDHlNкlsцАnцsщsuoBycfADу2Гgw0ZgВ8gЕУjonеGSйкеiнгCЙISfФOhВNJрА9uЧY1ЦЬИ3xYju1iЦЕФБoщЕЭюаjеВj0ГiH1гЕt-ЕЗa9ЕЯXDмЩmXtйsOl2zZXm6лlапФKc9ЗJШVЗж7kPPНkВ1JBгЗKхAiзAjжлQHщФmтРOSщFLХвsYеIBInЗюANЗ+фJрQFИиFИ1QMpwАЖкAtSГ9iцфЗоlРkЦ-GFHQжпбЗЮQk2jgl0мИ32t3d1ЙDФ+И0ksIYЙ0ЬA34ЬjCаVюiнIД-ыфИвыqUЛTгХСИИAЕчксЕЪуЙXkLOTлQU20ЬП2lь-ЖLzoGLДДр+тDьЩSR2ДуKМ3АIВRУДPД9OЗwдogиoШQЕTYмnlМИБаЫsGtXiмсiДPgjooЭqYДНVДgЮьЛРбp47СvE+ЛQьИtl7Oэ7ЙнMьГГAГRСyГroqpмКчВQ0оГCdgILwAEчsmMДtXzdЙЪГбrЖ+TuщвМГQrVдЪ5ПwgNфИ6KшМз-rШmtsаHqТйЯ0оЩUЩAГuJкSzуsэzИЗйсlытсНDPr29В7ЫлtвФSHiPНгgeеЬТОо+VЮфОлSЛМйo-VпФЛкюФeЬ3МОWиQwСGКоY3БAПпOcМi-П5YиR0vКтмБПЕАQкЬКЙw+DSdvцgфПьo1l-х+ъAОXшF9ЦщmOшJк4ГКьФdПыФЗ3Е8lсЗN4ь6cwCWЫtП1хb5GnTнI7y2Нo6BrzщЛ8wНdьБМИмШ6Z8+7dСyЭИЗlсПEoxbАмEЕgя8cМЙEрUХmЫРLRbАчISсI7UЙFСГу6ЪЩuОPЭС2uXЪЦйОN6L-ИРwыф6ьБD+лССYxYGжхКoиMЩVъSlQ5pМСВNxТй8Oщ2NУWиMIэwОUНlсшСcmBZzгТaNЭHRЪVVхг6gСLcщТ6sBZмфСБEOНОzB4pQеDДБОzнXZлДПW3ОтfХ3tБwбШЬФЛх0ЖZй7thФЛнФIГ8ФИхФС0еWМRХУxАХФНХХp5+6++v">прореживание по 4 бабочкам</Image>
<P />
<Listing>
<L>Тестовый пример БПФ:</L>
<L>procedure PPT(var x:mas;sign, NP:integer; T:real);</L>
<L>var</L>
<L>nmax,i,nn,mm,lr,nw,ii,j,loc,nw1:integer;</L>
<L>zz,W,delta:real;</L>
<L>MSK:array[1..20] of integer;</L>
<L>cs:array[1..2] of real;</L>
<L>cxcs;xa,hold:complex;</L>
<L>label 1,2;</L>
<L>#include &lt;stdio.h&gt;</L>
<L>#include &lt;math.h&gt;</L>
<L>struct complex {float re, im;};</L>
<L>void fft(struct complex x[], int sign, int np,float t);</L>
<L>struct complex cmplx(float x,float y);</L>
<L>struct complex add(struct complex x,struct complex y);</L>
<L>struct complex red(struct complex x,struct complex y);</L>
<L>struct complex mult(struct complex x,struct complex y);</L>
<L>int st(int n,int np);</L>
<L>void main()</L>
<L>{</L>
<L>struct complex mas[32];</L>
<L>float remas[32];</L>
<L>int i;</L>
<L>for(i=0;i&lt;32;i++)</L>
<L>{</L>
<L>mas[i].re=0;mas[i].im=0;</L>
<L>if(i&gt;=8 &amp;&amp; i&lt;=23)</L>
<L>mas[i].re=1;</L>
<L>}</L>
<L>fft(mas,1,5,1);</L>
<L>for(i=0;i&lt;32;i++)</L>
<L>{</L>
<L>remas[i]=sqrt(mas[i].re*mas[i].re+mas[i].im*mas[i].im);</L>
<L>printf(&quot;%f&quot;,remas[i]);</L>
<L>}</L>
<L>}</L>
<L>void fft(struct complex x[],int sign,int np,float t)</L>
<L>{</L>
<L>int msk[19];</L>
<L>float cs[2];</L>
<L>struct complex cxcs,xa,hold;</L>
<L>int nmax,i,j,nn,lr,nw,nw1,ii,ij,loc,ll;</L>
<L>float zz,pi,delta,w;</L>
<L>pi=M_PI;</L>
<L>nmax=st(2,np);</L>
<L>zz=2*pi*sign/nmax;</L>
<L>delta=t/nmax;</L>
<L>if(sign&lt;0)</L>
<L>delta=1/t;</L>
<L>msk[0]=nmax/2;</L>
<L>for(i=1;i&lt;np;i++)</L>
<L>msk[i]=msk[i-1]/2;</L>
<L>nn=nmax;</L>
<L>mm=2;</L>
<L>for(lr=1;lr&lt;=np;lr++)</L>
<L>{</L>
<L>nn=nn/2;</L>
<L>nw=0;</L>
<L>for(i=1;i&lt;=mm;i=i+2)</L>
<L>{</L>
<L>ii=nn*i;</L>
<L>w=nw*zz;</L>
<L>cs[0]=cos(w);</L>
<L>cs[1]=sin(w);</L>
<L>cxcs=cmplx(cs[0],cs[1]);</L>
<L>for(j=1;j&lt;=nn;j++)</L>
<L>{</L>
<L>ii=ii+1;</L>
<L>ij=ii-nn;</L>
<L>xa=mult(cxcs,x[ii-1];</L>
<L>x[ii-1]=red(x[ij-1],xa);</L>
<L>x[ij-1]=add(x[ij-1],xa);</L>
<L>}</L>
<L>for(loc=2;loc&lt;=np;loc++)</L>
<L>{</L>
<L>ll=nw-msk[loc-1];</L>
<L>if(ll&lt;=0) break;</L>
<L>else nw=ll;</L>
<L>}</L>
<L>if (ll==0)</L>
<L>nw=msk(loc);</L>
<L>else</L>
<L>nw=nw+msk[loc-1];</L>
<L>}</L>
<L>mm=2*mm;</L>
<L>}</L>
<L>nw=0;</L>
<L>for(i=1;i&lt;=nmax;i++)</L>
<L>{</L>
<L>nw1=nw+1;</L>
<L>hold=x[nw1-1];</L>
<L>if(nw1-i&gt;0)</L>
<L>{</L>
<L>x[nw1-1].re=x[i-1].re*delta;</L>
<L>x[nw1-1].im=x[i-1].im*delta;</L>
<L>}</L>
<L>if(nw1-i&gt;=0)</L>
<L>{</L>
<L>x[i-1].re=hold.re*delta;</L>
<L>x[i-1].im=hold.im*delta;</L>
<L>}</L>
<L>for(loc=1;loc&lt;=np;loc++)</L>
<L>{</L>
<L>ll=nw-msk[loc-1];</L>
<L>if(ll&lt;=0)</L>
<L>break;</L>
<L>else</L>
<L>nw=ll;</L>
<L>}</L>
<L>if(ll==0)</L>
<L>nw=msk[loc];</L>
<L>else</L>
<L>nw=nw+msk[loc-1];</L>
<L>}</L>
<L>}</L>
<L>struct complex cmplx(float x,float y)</L>
<L>{</L>
<L>struct complex z;</L>
<L>z.re=x;</L>
<L>z.im=y;</L>
<L>return(z);</L>
<L>}</L>
<L>struct complex add(struct complex x,struct complex y)</L>
<L>{</L>
<L>struct complex z;</L>
<L>z.re=x.re+y.re;</L>
<L>z.im=x.im+y.im;</L>
<L>return(z);</L>
<L>}</L>
<L>struct complex add(struct complex x,struct complex y)</L>
<L>{</L>
<L>struct complex z;</L>
<L>z.re=x.re+y.re;</L>
<L>z.im=x.im+y.im;</L>
<L>return(z);</L>
<L>}</L>
<L>struct complex red(struct complex x,struct complex y)</L>
<L>{</L>
<L>struct complex z;</L>
<L>z.re=x.re-y.re;</L>
<L>z.im=x.im-y.im;</L>
<L>return(z);</L>
<L>}</L>
<L>struct complex mult(struct complex x,struct complex y)</L>
<L>{</L>
<L>struct complex z;</L>
<L>z.re=x.re*y.re-x.im*y.im;</L>
<L>z.im=x.re*y.im+x.im*y.re;</L>
<L>return(z);</L>
<L>}</L>
<L>int st(int n,int np)</L>
<L>{</L>
<L>int m,i;</L>
<L>m=1;</L>
<L>for(i=1;i&lt;=np;i++)</L>
<L>m=m*n;</L>
<L>return(m);</L>
<L>}</L>
</Listing>
<P><Font Color="#0000FF">3.</Font>Прит выполнении процесса <Link To="ETJXJEZE" /> вплоть до двухточечного ДПФ происходит процесс двоичного разложения частоты к вплоть до значения к<Sub>0</Sub>=0 на начальном шаге(см NW=0) На каждом следующем этапе к значению к добавляется следующий двоичный разряд. Этому отвечает процедура цикла по параметру &quot;LOC&quot;.</P>
<P>При этом окончательное значение параметра к получается в инверсном порядке.</P>
<P><Font Color="#0000FF">4.</Font>На последнем завершающем этапе происходит упорядочение массива значений в правильном порядке,&#xA0;т.е. инверсия двоичного кода числа к.</P>
</Modul>
