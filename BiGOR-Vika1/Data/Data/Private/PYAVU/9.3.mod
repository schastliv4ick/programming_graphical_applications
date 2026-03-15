<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="UDPAFRD8NHY9ZP0GDJCQ" Author="Полякова Виктория" Level="0" ADate="ET6WZVYI">
<Title>Операции со списками при связном хранении</Title>
<P>При простом связанном хранении каждый элемент списка представляет собой структуру nd, состоящую из двух элементов: val &#x2014; предназначен для хранения элемента списка, n &#x2014; для указателя на структуру, содержащую следующий элемент списка. На первый элемент списка указывает указатель dl. Для всех операций над списком используется описание:</P>

<Listing>
<L>typedef struct nd</L>
<L> { float val;</L>
<L>   struct nd * n;  } ND;</L>
<L>int i,j;</L>
<L>ND * dl, * r, * p;</L>
</Listing>
<P>Для реализации операций могут использоваться следующие фрагменты программ:</P>
<P>1) печать значения i-го элемента</P>

<Listing>
<L>r=dl;j=1;</L>
<L>while(r!=NULL &amp;&amp; j++n ;</L>
<L>if (r==NULL) printf(&quot;\n нет узла %d &quot;,i);</L>
<L>else printf(&quot;\n элемент %d равен %f &quot;,i,r-&gt;val);</L>
</Listing>
<P>2) печать обоих соседей узла(элемента), определяемого указателем p (см. рис.1)</P>
<Image ID="ET6X1K25" DDImg="+ЗЙЖstб0И-U++++яГяя+++Vщ+2--+++g+++++0-Uш++0ы2DdпЛня0AkЪЧ9-ФoыD4цвШBМЙNeъtZfЩyтмЫТPсУuузжыеы7Pl7plчмYJЛWI8pДoRsиYфFwкПЦХзОЧЭGVИибIdОгяПbдOИЮднFрлыy1гщсOЕРЮpbc46вЧизЦrsMnИ6рsЗжsсщцШЙd-dgщеdЦЙsйШуqКuфFЖтФeКъРJuQ8л8nЖFлмлoфЩ8Wvн9ЕСPщкPGUзFwPЬAОьМPЫwьМГO-gЬv3RQxhеьLНRFhаASОеэcСЭsОЭiHTQЮоыЮxцДо-ПзDLjЬMЩьНCЬxБ+0X+ДчпиаВdАgНгmЗЖаБ0щc8WЬзисбTрtCJвМшИЖгДDObCwucтСГ4щSЗ8oXiеЕ7YUЗЪДйGШkNяdЬy6IРnbЙсКрЦцМжУ9OSjгOИЬц9ЧМpGmЦNэЙМбcsЫisтИТъILeOЧtQДэЪкgЦMх-ЪрФ0KKeЬWУ5eХчhneШmц9ъZеЙAпЮeфПГSYJФkТLs3уkюbnкlбHDГцhъvtкеА8сСGpЬoуаК+лlлiэsnжЬФYЗяоМЧщтлNGеbъоvtфнЩqогvюнZrзЦuX2чeBЬymиtоAлRpyvtпЮТхрЧзieкhУjЪХЖйSлS1шрD8++V1юпФийуU+ЗЙЖUжйм+еUчбуUб+ууенвме+дUчйфиU+ЗЙЖUГпо+уфтхгфй+поUУефU+жтпнuB8+B8Бмгие+нщUНйод+чптлуUЙ+огiB8Рi+ПiUВпшU+pkkB8Ве+ефпоgUП+офбтйпB+8МkЗUlБ+kB8ГБОБ+ДБiB8B8+ФийуUгп+ннеофUв+мпглUчй+ммUопфU+брребтU+йоUжйме+уUгтебф+едUчйфи+UбUтезй+уфетедU+цетуйпо+UпжUЗЙЖ+UГпоуфт+хгфйпоU+Уеф+v">Схема выбора соседних элементов</Image>

<Listing>
<L>if((r=p-&gt;n)==NULL) printf(&quot;\n нет соседа справа&quot;);</L>
<L>else printf(&quot;\n  сосед  справа  %f&quot;,  r-&gt;val);</L>
<L>if(dl==p) printf(&quot;\n нет соседа слева&quot; );</L>
<L>    else { r=dl;</L>
<L>           while( r-&gt;n!=p ) r=r-&gt;n;</L>
<L>           printf(&quot;\n левый сосед %f&quot;, r-&gt;val);</L>
<L>         }</L>
</Listing>
<P>3) удаление элемента, следующего за узлом, на который указывает р (см. рис.2)</P>
<Image ID="ET6X36T5" DDImg="АЗЙЖstбuИ+X++++яГяя+++Vщ+2--+++gE++++u+Xш++0ы2DdыЛнDXQoЪЧ9nЮbрD4щвMъд7aквзiiOшс9ЧДцЭ0шЭп4узЛ3нoOdсзМеsЛWгМ2ьpRwЗ6Фух8юСЧ0цСеьlгhФHЪЮТВЙnЪтЖЦiУbuшPwoАнUе4РЖbцчlKLзJреsGsRcзЕШ5И31ЙТиБdZйqdqt4aчLweOYЩсdnщOuЪ8cкOаbl3ЗИЖeс1чЫБйЗdАЫPPКfмЪхучщЛgАsСvlыwм6бэм7RfьAэW9ЙЬH-JНRRмлBЬЬxPБ9CiЮэO3оЫtSvОZWПЮюBпzЯKЯНrЬОOx+f-nм9c2GНyчAj+wжbiБrюэДШсйl9FVv76NrKcnНаXВWА2О9ОЧтVoЧи0AС2GeYeQЬjбmgd9YGA6gИ0mщxDДИHыТфlфcТaGXБ9ххТйI9ПGйHюCgMХSWО3жqЮнMКoлjYФСЙGZиРfyo0зlКХPСgOЫtЬГqЕкоLпЭuъЭхкhЛдкЬsЬт+яRмEZваeдKj4жшгж10+Vюп+ФийуUЗЙ+ЖUжймеU+чбуUбуу+енвмедU+чйфиUЗЙ+ЖUГпоуф+тхгфйпо+UУефUжт+пнuB8B8+Бмгиенщ+UНйодчп+тлуUЙог+iB8РiПi+UВпшUpk+kB8Вееф+поgUПоф+бтйпB8М+kЗUlБkB+8ГБОБДБ+iB8B8Фи+йуUгпнн+еофUвмп+глUчймм+UопфUбр+ребтUйо+UжймеуU+гтебфед+UчйфиUб+Uтезйуф+етедUце+туйпоUп+жUЗЙЖUГ+поуфтхг+фйпоUУе+ф+v">Схема удаления элемента из списка.</Image>

<Listing>
<L>if ((r=p-&gt;n)==NULL) printf(&quot;\n  нет  следующего&quot;);</L>
<L> p-&gt;n=r-&gt;n; free(r-&gt;n);</L>
</Listing>
<P>4) вставка нового узла со значением new за элементом, определенным указателем р (см. рис.3)</P>
<Image ID="ET6X4B44" DDImg="АЗЙЖstбyИ+c++++яГяя+++Vщ+2--+++gE++++y+cш++0ы2DdСЛBFQ9DЪЧ9nЮШъD4ЙвИuФ6xеKdmе9ЗmкШрцКuUyчГюTЫЕшSWlД6МeJИ4сZtЩhbФeKo6pкrЬХvqХB9HРЕsЩсSfЧ5зу33уЧiмuwRxфКуьoВ0йчbMтXQЧгVТЗIszM1nZHGзлШKsчсHЩФИЦГJЩdчRЦ7uшr7IмкеДиЕгIзАКKNrepАК5ЖшъДшiиыъZfwP-pXцPмwМУAqA7мOBйЙЬМAgнМвЛЭмцsыhQйЪR9hн4ЯCОVAЧКоpЮCPiЯFЭZNwBNЮCпrzНЭэj6AЮЙsQЕeунPЭuLdк7IlзDKo3ь4ИKЬ6QjвЖ6юITОа3ТнWЖ6яuOn4MрдЖя7RHe2FmШБЩ2HЭOАNHPWQIfыькщдnZРГГЗБХьnУGJИHЩцBьWПдwцщтъСxкЛGaТфaOКеHMФfYlMэ6qйШqвЙuьЙЭеIOжhлЦFpУъдщdХcЭvjХSsJЪчпЭt+ozЮфfsпа-yОJvОЬs0пдMтNГKJЩsиЗgХjDзгAоГ-+4VюпФийу+UЗЙЖUжй+меUчбуU+бууенвм+едUчйфи+UЗЙЖUГп+оуфтхгф+йпоUУеф+UжтпнuB+8B8Бмги+енщUНйо+дчптлуU+ЙогiB8Р+iПiUВпш+UpkkB8В+еефпоgU+Пофбтйп+B8МkЗUl+БkB8ГБО+БДБiB8B+8ФийуUг+пннеофU+вмпглUч+йммUопф+Uбрребт+UйоUжйм+еуUгтеб+федUчйф+иUбUтез+йуфетед+Uцетуйп+оUпжUЗЙ+ЖUГпоуф+тхгфйпо+UУеф+v">Схема вставки элемента в список.</Image>

<Listing>
<L>r=malloc(1,sizeof(ND));</L>
<L>r-&gt;n=p-&gt;n;   r-&gt;val=new;   p-&gt;n=r;</L>
</Listing>
<P>5) частичное упорядочение списка в последовательность значений , s+t+1=l, так что K1&apos;=K1; после упорядочения указатель v указывает на элемент K1&apos; (см. рис.4)</P>
<Image ID="ET6X5B9B" DDImg="+ЗЙЖstбNИ-i++++яГяя+++Vщ+2--+++g+++++N-iш++0ыADdыЛнDXQoЪЭ9DШwыD4свИоБ7aкLКqо9ЗmрщОцЫЯъОчзюяЙ-яВGс-ЦQeLМaabйIБЕЗгчф8НКpnйхуФхтЗдgFswuXFаpЭъBЯtгQpЬpМПлеыXbl4ЧbscmЭLbokqKKLСиш67FзЪИ56ВcИcBNВtФ7зщvЩKN3kЙ5ОъъФсщеZDъъuТ8ДЫЪKЪbfkLЫцклуv4ЛлиJwI6ndКdКgcvКg6qFYwмТQЫFQНКЕRкНб1RRвььЬВBэЦоaоxMОфОоhCSШЮЧяBTюяzнЮyьоЦwMo-ЛэnLйЛ09d+GЖШzmDTГ54aШОXlыgCMШд9v8mrлGЕkYРeрМWЦсY9vgSнcA7гWМLаoеKG7ТПъКQMяддДKузЗПoЖтtЪcIеНYМzехь7WcЗYпД1ЪНHпLжОIНLв3NЪJмШ1ПйеCЕbpYЧo4ЮСкдfKiыЩjжеuBfщqhЮxLшywxЛЧdЭmTВНE2gшлaЬшХbЮн9хЩjЭн-чЪЦR6tWдcsЗ8N4wsтnvаИГjдИштНжjЬmyнg+фСFАхгkщGРЫIXФQы-NOMaoЯNZ7ШГЖиVХeрХkвЕSHыMQ3ГBчмXоN6Bхв3Чг0xytu1фДЭoкрэЯфtиУзPeвLzOэпУдDNzjeпt5jmЖаЫ4WэoTиЭBrЮьПVхLЯз8Ъv0аьxьФа+ьЧNИTрKТКИPВъ-и-MэиxsЫоQ3О6б63тIИа4зрbW8ьиЕMбуhЕвLTЙ1ЮsйWчkO6бAк0KчXжКtвIдБfqвгп3нмивGьЪsйHHшJoк6IПGbеD2ТШд+eЬцлdYнЫэЙЭcЭдmUПOЪЛetaPоOфЪжHсОЩ1JТъШЙзSБQ7Йз30I++4VюпФийу+UЗЙЖUжй+меUчбуU+бууенвм+едUчйфи+UЗЙЖUГп+оуфтхгф+йпоUУеф+UжтпнuB+8B8Бмги+енщUНйо+дчптлуU+ЙогiB8Р+iПiUВпш+UpkkB8В+еефпоgU+Пофбтйп+B8МkЗUl+БkB8ГБО+БДБiB8B+8ФийуUг+пннеофU+вмпглUч+йммUопф+Uбрребт+UйоUжйм+еуUгтеб+федUчйф+иUбUтез+йуфетед+Uцетуйп+оUпжUЗЙ+ЖUГпоуф+тхгфйпо+UУеф+v">Схема частичного упорядочения списка.</Image>

<Listing>
<L>ND *v;</L>
<L>float k1;</L>
<L>k1=dl-&gt;val;</L>
<L>r=dl;</L>
<L>while( r-&gt;n!=NULL )</L>
<L> { v=r-&gt;n;</L>
<L>   if {(v-&gt;valn=v-&gt;n;</L>
<L>        v-&gt;n=dl;</L>
<L>        dl=v;</L>
<L>       }</L>
<L>    else r=v;</L>
<L> }</L>
</Listing>
<P>Количество действий, требуемых для выполнения указанных операций над списком в связанном хранении, оценивается соотношениями: для операций 1 и 2 &#x2014; Q=l; для операций 3 и 4 &#x2014; Q=1; для операции 5 &#x2014; Q=l.</P>
</Modul>
