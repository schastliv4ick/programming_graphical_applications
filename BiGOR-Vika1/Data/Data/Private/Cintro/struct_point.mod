<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="YGXATT6GVLNB463BRMUH" Author="Федорук Е.В." Level="0" ADate="EWJ830VI">
<Title>Указатели на структуры</Title>
<P><Term Type="Link">Указатель</Term> на <Term Type="Link">структуру</Term> объявляется точно так же, как и указатель на данные простых <Term Type="Link">типов</Term>: используется операция <Operator>*</Operator> и указывается <Term Type="Link">тип данных</Term>. Тип данных структуры указывается заданием <Term Type="Link">ключевого слова</Term> <Operator>struct</Operator> и имени <Term Type="Link">шаблона</Term> этой структуры.</P>

<Table Col="2" ID="EWJ87OX2" TTop="Y" Center="Y">
<P>Тип</P>
<P>*идентификатор</P>
<P>int</P>
<P>*ip</P>
<P>struct emp</P>
<P>*sp</P>
</Table>

<Example ID="EWJ8A6TY">

<Listing>
<L>#include &lt;stdio.h&gt;</L>
<L>#define NUM_EMPS 100</L>
<L>void fillarray(struct emp *, int);</L>
<L>struct emp {                              /*это шаблон, память не выделяется */</L>
<L>            char   name[21];</L>
<L>            char   id[8];</L>
<L>            double salary;</L>
<L>            };</L>
<L>int main()</L>
<L>{</L>
<L>struct emp staff[NUM_EMPS], *sp;         /* выделяется память под массив структур*/</L>
<L>double     sal_tot = 0;</L>
<L /><L>fillarray(staff , NUM_EMPS);             /*заполняет массив структур данными */</L>
<L>for (sp = staff; sp != &amp;staff[NUM_EMPS]; sp++)</L>
<L>      sal_tot += sp-&gt;salary;</L>
<L>printf(&quot;total of salaries: %.2f\n&quot;, sal_tot);</L>
<L>printf(&quot;total of salaries: %.2f\n&quot;, sal_tot);</L>
<L>}</L>
</Listing>
</Example>
<Image ID="EWJ8V5L8" DDImg="-7РОЗB8O+8+++BЙИ+ДТ++-Ф++++т60++8+1тyэ++++2зБНБ+K+lD9ьб3++++4вЛЗФД+я+я+яDUxbH++++7рИЩу+++9G++9G-9ТЭюь+++А5фЙНЕ5ЧА-2BtYЛmXВи++BэЙрДБФшQнRUпМQЕTЗя6чQНПт2ЕDоРXyРиgШqЖвpюЙ2YВYЪшиjGEOНЯФWJObXd7йвмСqг6aХPIrыpфOXФ4ocРGЛoБ342pF1яWВнJpЗлХ-q3аПd5чrП9ысЩзTЭxxзxxЫяrzПяfRЩЩЩЩпЛюynnыяЖ5ЦЦЦK62+gБEЖkPЭ+o2БA-НDU5A0жЗEЖБtуX6XUщFh2СРь6Вc+ию2бIoz70k8OTБMц3НDUA0жEЗEЖБуX6ЧXUщF2СР3ь6Вcию2EбIoz0k8бOTБM3НDтUAвlучцБцЦФФшwSPГ5DуHqS8ЬбЭvцJIМIмЮwtG70++дN2бKGHNzOBЦЧuЧЛIрыэю-zяьььккSклЦhьYhшА6V2РнцTццFFFрsЖQDЗPOOвСсsяj0UРуЦЦЖМАХfkЧлккаz4ЫKДоrу9р9HфЪsЭГГwГцvэФdУП2EБББ+иLииEg7UК5иййdjjччvЭБаETд4Ы7KQSSюЛа-5KjЯюырГDяълjamNвгхЖkНуяуНryTлПбрРfjgсgI6сиРVxPпytZZеwбб-6IGМSтJЧЦЦ0АcsQa2ЬtтЬ3+оyыоuх93уfDФС1ССАUРЦЦбЖRлшДкП5ВВВГDxYЬУагЖB+kXooYО828В41щщщыцDмNPPлммаghhxяюwрдaч69жчщщь+ачызЗззян8П3чнЫr1АОRQv-UllСЬъАEIмuоuFл+UOBGВWвlM+sRОrЙGKX9FКo673ВG0ШдЭZедсКщэЛjzРБA4ГфNnз+аэчъхвМTПЗяХЖWщгсшсCRv+Uuu2ЪQOХХХО-bуаа++QЖCЗzнХмюЗеЛL1+эОрЯЬЬ2+00i0ЙGЦWvDeЗйжж4ЪНоtыъъитП8zяY2ghhц-АmеЛДNЙЬРДШozеpЩзT3+XЗ3DGF8УУУпычпLсsМнiхлЦ-Ае1ЛLйx+РЧШЧbЩТдиъsрДбНьЪНрtLKKоxчаЮ+иййщзЭTяъыы-аVЦЫпJзЮцxЫнGpйAб3жЯxъхoOЧRNN-+rЯцьHрФшлjЫzSщжNеЛэKээхЧкМжяиРV+шьГуП7VЯьсГ3ЭоTOOG+gйтoэsКcrnrРфКtgzzяЪлjщтwSЫоtZZdZ3+ЮщзRhЙМЙЪфЖkBу1АHПytДllбрsюьtсЗВ6Ле0ы+TюъdbbЭ5eтеLЯТЯBсссnзППТнЙЙЙВ6аUdРkSDЧЫЦЦyсДHnvnnyTпBrПЮаTЧВбhSйYaPNЛиyoедУФФФsЭЭR9ЕдnаNpz+sRОыiiiOУЩЩhйцvrмЩGvDЗчпЮнцяvлкккллs999tPБdCZNдЧzvvэvсгЖ000EАUUyjОLйNZoBФЦМDjйIHгии5cwwьжжaЬеa9жПiКТJoЦШлEdЫgNToQтЖmвlрsьЮыыпЭюынЬзящGNьцUщЛHWДRЬpzгaFК675ГоoуТZЛ0уьЪИZoULa5ЕIHоLLLИrpp3ВVоJAqPНQdиЧDжLh3щНTПLMYТИрYЛФLlPЪЕKezюдщъЭУZ3F9MоAwNcphhhhЬE6+NUzwЖVяjgяЧmnx6wmВeiбЙsdгpZ4ь4КнРяIЙаРвмоLяLIщMXьsаВь1л5а5VGЖТУYМФPюRлТгНjоkНзLЖй+И7НEgшдv3ГЮXТМc6oсДрZsБ4вYущnpoЙиPjуYwдфЕбCЗuoИwЦJтцyъв+щpЙncvxАц5аUYNЪиJтисАrфnzSCЧPГj4ттР6mVЪ9г47yШDуPMдmtукUr5UзуUzO4цЕЖOOЯмСе4VyqЭфиeJТеЙuжsцэTывмPЯAuZКгюрrYбужLЕ9МцмыXзЭИaщНdaгКМKоaЦй4ЩдС0у8ЯOCD1ЩknzщхМ7ljU6НfаОц0ЬKRWos3куНTЛ-БVзР9В97M1xl+хЫОСвKRclzеъОхQиIсKCВfFц0tKiЩьмQИГьKuЯFЩZЫFTЛСТиюj9дьsuжюsEЪьtЪjWтФxOИМн-Нце-убoДTmNNдХМпЪОЭрIбwOаe8НръsАшseM9aЙPTсRУВMтu+geзИij+бКЗщЬЮgхИDc1Х5XижМIЬGiNэHOTыСТJШмqФНAOCqДЩHVH7HaЪWPБEYxБуX6XШXМьэээПzHяьBrЬаф6ГМBeдgЦяСЯwжzзSкыиъPьeeбeCQsрхкzХgQвД7HXKsЙmиeТqCиXpKЦЯrъjvНывeЭFИдееБKюЮр2ГбmmpmмХ4aСhUЫeеЛThеql7мQaТzьчЮшСХжnП3ЧлНвнжMVЫeеeyЪьгJэHqтФNdУjyшвЙSЙЙйУbЛЛkЛлккОQtиГч31БjЧLЫЪЪOBЖ-sаррреLЯsiddNMMcQeeeddNPCPлппjccbcjjzяюwЖxкУПzЭvaцн8JfqнhЫцнЪpщжkRzюьЫqн5ЕЕЕotnnBnщужJfЦrwфТЛКjнQддYVVVzцzTяСHUсш02ыvvvTyыоtвввDЮzьрaPоmщЩмqPhooЬI+цнЫЗHчГГГЖйKVоК4иXF42нfZфLл-дШтЭ+рЫпz-С0xxxЯэйхJ+gЩn4uИh7ЯЩЩЙSЛцццSwщиG+ЦhЪХСПССЯЯD+л9ЦhX2QxъЕФжnBAAьУрГD+kхл8ЦсЙщДWFАЪbVдооiяmmтdbS8QДWнннЬюЮКД9Ы9PПЭjНwчDzюtU3yщдHDOyшаПSx+DрэчЯHВGЗ7ДOpлОSmwNИYAТhкГJфУЗбэКТBСбк7эyеOFФььHуЗгс+kЫн+ДкНшъчй5ЙZZZоvK-9-АЮЮSVbYmmGшsЬ6iщЭшзпншн3+uИбВЫВ0ту9LrдLrSЯЫКеНоH7ДЭчЭеpчпЮВИдЯддъхлBЧФhHJфУЗбRэТB-бкюээеOVИь0кнщpбZrугуу-UOBКбЛVи1xцъ9лj5+ШgaщiЯ7ьЕнЕнBLФKтtыЫSSSjЧPBДЖ1-АччrЗsНЙIИЩt0uЭmЧЙ5э1ТuЯekkЬbНjzМnТnfzGpбZrЧСiЬ7+Яюы0hНTRRНd+8чмЙЙ7+FQxыЦткеEEgоjЩшоЪГбтч7ДвеОvпwшра4эчЭЗылгmхЛДZЭфСвшzФгаsOДЯяNжYpяJtузиxLjeЮwшсWЭyuра+Эаj7ьT83ицпzhяюбВ3uRЮC5tpЯГVлРyэы+аСьЗTRPPышHгDЯэхХщ0ЭcW+kxxЕxчпЮ+шмуlЗiЯyьЭuчЯdFJv8пювцв3нй+A8+abbZ5LvзiнммTAfцШlгiлLЛAuеcGкоъcwЯeСРЩцCЛиjУчAYжП4ьO9рЙU2QtтодхкХiLлlJЧЮFDNmьBU2wяюыяеее333пгyыоСССFФXЗдDзЧВрhоjЮРSяЯFAGеоd7qДвCvоsфпйGбuеcGЦоъ+0уЛKДЙцUUЯзЩъZПЛМezAештУюДGzTяюvttЩтuLкЖYфСЪCKIRDАяNOсAЯWЫВA+DDLJJRvюцgttЩиqнMFФЗШТХhЯвЯрnKАаUРЫЫыгBЪrЮяяэЖrчЕAUyЖGiЭюsтbБзTАэжфHМBкQгgйкDXzЩ0kКТFTяШFНRcPVUЕмeEqzlУ+DYFДSAЧuхYrнЗюJEБт4ьжЗEgЖЙГьsмXwИiFцИDЭa+0д4sнЗшEЖЙГьЬчС2pлA0UъЙ-Xz0k8OkTБM3НDU5A0жЗEЖБtуX6XUщFh2СРь6Вc+ию2бIoz70k8OTБMц3НDUA0жsЗEЖl+щы+ыыfeewSTПбГ5ЕЙ2CБФFЮЯчзйчbэСиoyбyюииИaATЯппннЭЪРЪтsQвY0тUelмдTRНRэдFЗОTsyhЯgjjDФ+sf9G60BcЖЪьXXXшBBBщщщфQяыъыыЯшBб3DЗnssvихъЛККuМuuшенТIчKKКФыа1аDCCC0пjz-0БUЧлнФннBЖXЬp37Д0fXИWК6GFG9хъшьy+рыэуjуу2rIсЗ6TэI7ДqнщЪ2+нннйsiVccKЦЙAчнЯyR+цуоЬ7+BBBщье4-rТUкU7U6кYНqTDЗчмШ-C+ХХХфэвPyлюющз+6cddщЯhТcшwSщкщхРЦХХtRОuоUtГбEФQeg7U6кYTЫSнцыЫпz0R7ДCSwшЯьшсaaaюbЮ888+аarзUшЕUUЪяюiСССййзйооо+6Е+вКкГEYH5YTщfffLQLLЫЫЫ-UsI8сщфFыАъъO+SяьtсфПKgЪИЮYТЬЬwтеPКpлЧaЫbн0UкEqяшЗшшУПzэеЭКJ5ГlбГь4izffлЪRpлjzюъЩтЩЩЫпxJоBЙ2ХuЬi++MPPPMM6y41999oуC-+777+sWчоQНЮsр0БQДEYXYчTщйibУЩzХХЕПЩpлЯLУйЬkбГDддY8зAБjpRRRоrыЛЛKhсшьчыоЭоrviiziyyykkрDяюэ0З7сфGБEМkppNp30-Iэ2RэфBаяцXОИiUиЛyфшVT+aaaoфмA0UъVИньSD5о6zЛr1U6ЕСфМxЩQнXИоКб-ЯхV6W+3ию2бIoGz0k8OTБмM3НDUA0VжЗEЖБуXi6XUщF2С9Рь6ВcиюU2бIoz0kСКя+OaоФCgчяS+++U+ЙЕОДiВ0а0">Указатель на массив структур</Image>
<P>В <Link To="EWJ8A6TY" /> указатель <Operator>sp</Operator> после инициализации указывает на начало <Term Type="Link">массива структур</Term> <Operator>staff</Operator>, т.е. содержит адрес первой структуры массива. Поскольку <Operator>sp</Operator> &#x2013; указатель на структуру, то результат операции <Operator>*sp</Operator> является структурой, в данном случае <Operator>staff[0]</Operator>. Чтобы обратиться к полю <Operator>salary</Operator> структуры <Operator>staff[0]</Operator>, можно использовать следующие выражения:</P>

<List>
<P><Operator>staff[0].salary</Operator></P>
<P><Operator>(*sp).salary</Operator> (круглые скобки требуются в этом контексте, чтобы учесть <Term Type="Link">приоритет операций</Term>).</P>
</List>
<SubTitle>Операция доступа к элементу структуры через указатель</SubTitle>
<P>Ввиду того, что указатели на структуры используются очень часто , в языке Си есть специальная <Term Type="Out">операция доступа к элементу структуры через указатель</Term><Operator>(-&gt;</Operator>), позволяющая сослаться на элемент структуры, заданный указателем на нее:</P>
<P><Operator>имя_указателя-&gt;имя_элемента</Operator></P>
<P>Эта операция является первичной и находится в самой верхней строке <Term Type="Link">таблицы приоритетов</Term> операций языка Си.</P>
<P>После того, как указатель <Operator>sp</Operator> инициализирован и указывает на элемент массива структур <Operator>staff[0]</Operator>, следующие выражения эквиваленты:</P>

<List>
<P><Operator>staff[0].salary</Operator> <Operator>/*имя_структуры.имя_элемента*/</Operator></P>
<P><Operator>sp-&gt;salary</Operator> <Operator> /*имя_указателя-&gt;имя_элемента*/</Operator></P>
</List>
</Modul>
