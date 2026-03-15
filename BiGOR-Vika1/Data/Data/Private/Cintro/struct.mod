<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="BFUHJ2QK1ANY9PNEULI9" Author="Федорук Е.В." Level="0" ADate="EW9BZ0BT">
<Title>Структуры</Title>
<P><Term Type="Out">Структура</Term> &#x2014; это набор элементов, которые могут иметь различные <Term Type="Link">типы</Term>.</P>
<P>Структуру можно представить себе как запись, состоящую из нескольких полей или элементов. Структуры обеспечивают удобный способ структурной организации связанных по смыслу переменных.</P>
<P><Term Type="Link">Массивы</Term> являются <Term Type="Link">производными типами</Term> данных, создаваемыми из существующих <Term Type="Link">типов данных</Term>.</P>
<P><Term Type="Out">Агрегатным типом</Term> данных называется тип, конструируемый из элементов независимых (возможно различных) типов. Структуры являются одновременно агрегатным и производным типом данных.</P>
<SubTitle>Задание шаблонов и объявление структур</SubTitle>
<P>В отличии от основных типов данных, таких, например, как <Operator>char</Operator>, <Operator>int </Operator>или <Operator>float</Operator>, структура является производным типом данных, создаваемых программистом из существующих типов данных.</P>
<P>Новый тип данных создается путем описания шаблона структуры.</P>
<P><Term Type="Out">Шаблон структуры</Term> представляет собой описывающий элементы структуры список объявлений переменных.</P>
<P><Operator>struct [имя_шаблона] {список_элементов};</Operator></P>
<P>Область действия шаблона структуры определяется также, как и для переменной. Если шаблон встречается внутри <Term Type="Link">блока</Term>, то он известен только в пределах этого блока. Однако, обычно шаблон структуры задается в начале файла или в заголовочном файле. Таким способом шаблон можно сделать доступным всем определенным в файле <Term Type="Link">функциям</Term>. Как только шаблон описан, его имя может быть использовано в любом месте файла для объявления соответствующих переменных.</P>

<Example ID="EW9CEBUZ">

<Listing>
<L>struct emp {</L>
<L>            char name[21];</L>
<L>            char id[8];</L>
<L>            double salary;     /*это шаблон, память не выделяется */</L>
<L>            };</L>
<L>int main ()</L>
<L>{</L>
<L>struct emp prgmr;              /*это объявление: выделяется память под переменную prgmr*/</L>
<L>int num;</L>
<L>...</L>
<L>}</L>
<L>int f(void)</L>
<L>{</L>
<L>struct emp supervisor;         /*это объявление: выделяется память под переменную supervisor*/</L>
<L>...</L>
<L>}</L>
</Listing>
</Example>
<P>Элементы структуры хранятся в памяти в том порядке, в каком они появляются в списке элементов. При этом в структуру могут быть включены неиспользуемые байты, необходимые для соблюдения требований процессора к выравниванию данных. Так числовые типы данных обычно выравниваются на границу слова. Рисунок показывает гипотетическую ситуацию, так как фактический размер структуры машинно-зависим.</P>
<Image ID="EW9DEKQI" DDImg="-7РОЗB8O+8+++BЙИ+ДТ++-Т+2+++60++0+Цqцc++++2зБНБ+K+lD9ьб3++++4вЛЗФД+я+я+яDUxbH++++7рИЩу+++9G++9G-9ТЭюь+++А5фЙНЕ5ЦUAQE4kvdWдо++51ЙрДБФшQнЭbЫGЫeE3бЯQКыzmуV+mЕs7VиOnъяiТnxxиmЖgУЖ5щmьzЯ5АGzVfP+АOl5hМVц+tДSKk5Ш1жEыСАQвDMГмД-у6xаClhЗаTПbыаСцсgБмV-ТуАХVцMA52лччх1рLIfGDHПнеjEnxЖ8aЯъПзуэЩХжYY6xk3жkХМHЕyjwмfZихацNPrz3YьcТBИДмjRрJУQоЧщ4zsэUQBSй0рЙLюлЕы0ъLN6эZНзdDlбгYOZйсСЧj1лZZРLymйшN8kэЦЯNaqш4ЫокNЯ2ЕCгъYвce7БЭЭNШjhГюяЭjЯжхJnйШЗыWэLxDNvГpLФЫЗрпkюОлуZZрjNCxЙЧxыToэбnFъ8сЦнkЖЛbэЙМQАлуJзфпu+sЧъжцrИьr3жГЧXшВПэъПъЙ8eРОбklЫЧKFиeJЪЛпVмfыФгkJrхцжОLMкRОуЗоJCйНН4CСcxpщЯЩЕцмвьouюIЭuDqМЗмbЛSЦсдщzЛцИSOьgЙ2uЛДFЯчGRЮPDБWеRМбъ4NCыmsnSжNьmreDЩnЙпSЬQLьCйиmПwПjщjиОЙppдЗЙЦБnшдвrAптотTйПnRTдLЮd4SШУЯ0щ2ВЙюлЭусgбЬП8цыэЗhRnЖ5о+ZСoPуяyATQьцAИjм2уъЯжЙрIoГЖP7-ыдтv8TэrвcQРхЛyЛagгуяyЩrbZяНUIjп5BыэLЬЯнТОb4AЦenGzдHР7bCEэuэЯIzнЫтФАsозRьlсJл8пRОТУЩМryvжьzh1uЫРрюшжiжRRб1эrыИАeцьлnmzпгзИФqПоОExЭxгYuYеjШТиЮреЬcщВHтМьЧСЧЧaТS9Zq5aПБvQYЯsFHЮОQСЗпюХэs8ХщLumМсутLRгTсhcкщjfOЬueйиWlАкМvюЪЦBzcдrЩй-84тцIЦхЪNJнrGZнNщРфЙлСвИыvGщgЯmихYНйоOfXЪXЧtъМпnМоХJrL9gОют4VIAsdРжsэ2XнHНизXегюХ1oНLтdLhQшMHцъБуЯRйuФПjПьeжocщгhuPuHеAfЗЪJшVHяХГЯтUv0ЫницpщЙд3JЧDыхйO3RrAХqЬH3OYрЭrQыьRяE94фRйЯБгОТЮN+hП-LрвиЪяхчIцPL-eJьлCЯАYf+ЬБГЧsl9SчXУЭыЙWxdtуДnQщюЫyИCSwнрel+RКХWэмqPЩзэoВУzхСBzpЭэЫоqЦTYчuvCKkкюnЖЛЧОвDНше6ЧиыКВoF16qxqФFюГKЫнЯUцШШга-60TVцШuЮэ9яБлцуЭ6xОEhщfNдЛ6xОFЪhФFшGzfмP+AДAЯ0НЩS560zкО6яF6xОEmЭrыщ2яайДSыvНpНПfAк6xцхAиObжDFыvмbjАФьSыlЗОЮ5ЦшЫЩшLir5ОкФ7qлQkЛRмuTСrBШЙЖЩъ+tgйQRcvохфlЧgфьЙ3съWтбЪGpйШ9hlпuRзхoАраД4Я9rбоИyШlFdlqЗнoыZqьGaWякфeяВГц7хlвсv3AFЖГЭчццБbPtКюSoПzкЮюATTмгтнэЙOШИыШrzмJъ+РkЯFBMGЛбщpХытбsNxХсыtdOQeжпelBIШТXДwГ5лc9IячrчдСEьHlBдZяШГМ0XьZuЭDfEAЬIWNLoэкИSFCxшлnmОИьхxnМтLПзhEЖpТoцдЮLЖоNЯWТЩ2gпPLpmЪм-йЯCЬмхDфЭЩТГоRЩЛгmЗнЦxoЬЕOь3гqЦНюУЖЮTrЯzqыиcпeWФzбgяДiоъьыдкуТЦЖW7еФОМ7yЬIzХ1жя9lЪFНЦbЫЦчфuПeя1rmRАЮйОиТpЧХPуoищPьM-n3Qpуф6rwdРйXЭпеЕмU-уsоDMГ7м-у6xаCpl5МVц+tЩДSk5Ш1жwEымVыЖmяZPТsХзятjДhol-мMХVhL8ФОчqRЮиЕMнxVЭцЪыЖ9стЛT5хЫАЦRDШГvVщcЬюhBeДStзnЮТb6xКцвbнЗrKVСу1ЬZ6xЩqFJкZPЛrIKоЙyЗКiyцEэтSЭ9ЙзvьhжыuмUтмhyЦдLyNХxDCХ+цZPЭoЮТШaтУOи1cцEыАQ8ьСАQвDMГмД-у6xаClЪ5МVц+tДgSk5HусЦлцпibbХJщюmвцЬPмgqГrЫч3уеыЪOСъЭиъtЩЗВяZцMМVОЧБ+эияxmwxCыizЙСПjrЯЬъВФ4KPшaдrNэЪцRedщуOIщРсhvMyEHqъЯЯИф6qЙСJWTгI0Ц8т9ЛlЛвЫэюиgTxУ7dээ1IЬьЛймlЖй8tъьДrdРBоЖрFЖuэЭЫыррЖПыЯw-9PкГFDVэVXьцqefсA1zDВP-й0cшХo0ЫыяnGTiTЧrЯЩmэмKXJWWЯzШъ7фKZzЮGLfc+e5U2EыU4ГЙow7ЕyMEvvуCZxuUФшЗSЭRXюd4UЕFDZMГм-у6xФаCl5МVце+tДSk5Шa1жь16M+I1Т0Еф++А++ЙЕОДi2Ва0">Элементы структуры</Image>
<P>Ниже рассматриваются альтернативные способы объявления структур.</P>
<SubTitle>Одновременное задание имени структуры и объявление структурных переменных</SubTitle>
<P>По желанию программиста, переменные типа <Term Type="Link">структуры</Term> могут быть объявлены сразу после описания <Term Type="Link">шаблона</Term>. Если шаблон и объявление переменной задаются вне функции, то переменная является <Term Type="Link">внешней</Term>, в противном случае область ее видимости ограничивается <Term Type="Link">блоком</Term>.</P>

<Example ID="EXSRC13W">

<Listing>
<L>struct emp {</L>
<L>            char   name[21];</L>
<L>            char   id[8];</L>
<L>            double salary;</L>
<L>           } prgmr, employee[100], *p;</L>
</Listing>
</Example>
<P>В <Link To="EXSRC13W" /> объявлеются структура <Operator>prgmr</Operator>, массив структур <Operator>employee </Operator>и указатель на структуру <Operator>p</Operator>.</P>
<SubTitle>Пропуск имени структуры</SubTitle>
<P>Другой способ состоит в том, чтобы опустить имя шаблона структуры. В этом случае все переменные данного типа должны быть перечислены после шаблона.</P>

<Example ID="EXSRC13X">

<Listing>
<L>struct {</L>
<L>        char   name[21];</L>
<L>        char   id[8];</L>
<L>        double salary;</L>
<L>       } prgmr, employee[100], *p;</L>
</Listing>
</Example>
<SubTitle>Использование объявления typedef</SubTitle>
<P>Третий способ состоит в том, чтобы использовать <Term Type="Link">оператор typedef</Term>. Это избавит программиста от необходимости писать как <Term Type="Link">ключевое слово</Term> <Operator>struct</Operator>, так и имя структуры при объявлении структурных переменных. Использование оператора <Operator>typedef </Operator>для задания однословного имени нового типа может также способствовать повышению удобочитаемости программы.</P>

<Example ID="EXSRC13Y">

<Listing>
<L>typedef struct emp {</L>
<L>                    char   name[21];</L>
<L>                    char   id[8];</L>
<L>                    double salary;</L>
<L>                   } EMPLOYEE;</L>
<L>EMPLOYEE prgmr, employee[100], *p;</L>
</Listing>
</Example>
</Modul>
