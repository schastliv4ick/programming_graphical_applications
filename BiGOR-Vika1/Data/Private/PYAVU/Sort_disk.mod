<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="C83NTL6D47VH3SCGJMFO" Author="Волосатова Т.М., Родионов С.В." Level="0" ADate="F1RZF9P8">
<Title>Сортировка дисковых файлов с произвольной выборкой</Title>
<P>Дисковые файлы бывают двух типов: с последовательной выборкой (доступом) и с произвольной выборкой. Если дисковый файл любого типа достаточно мал, его можно считать в память и отсортировать одной из процедур сортировки массивов, представленных выше. Однако многие дисковые файлы слишком велики для того, чтобы сортировать их в памяти, а поэтому требуют особенных приемов сортировки. Многие приложения баз данных работают с файлами с произвольной выборкой. Рассмотрим один способ сортировки таких файлов.</P>
<P><Term Type="Out">Дисковые файлы с произвольной выборкой доступа</Term> имеют два больших преимущества перед файлами с последовательной выборкой. Во-первых, с ними легко работать. Для обновления информации не нужно копировать весь список. Во-вторых, их можно рассматривать как очень большой массив на диске, что значительно упрощает сортировку.</P>
<P>Тот факт, что файл с произвольной выборкой можно рассматривать как массив, означает, что к нему можно применить <Term Type="In">быструю сортировку</Term> лишь с небольшим количеством изменений. Вместо обращения к элементам массива по индексу, дисковая версия быстрой сортировки должна пользоваться функцией <Operator>fseek()</Operator>, чтобы найти соответствующую запись на диске.</P>
<P>В каждой реальной ситуации сортировка определяется конкретной структурой сортируемых данных и ключом сортировки. Тем не менее, общую идею сортировки дисковых файлов с произвольной выборкой можно понять на примере короткой программы, сортирующей структуры типа address &#x2014; почтовые структуры, описанные ранее. Эта программа, приведенная ниже, сначала создает дисковый файл, содержащий неупорядоченные адреса. Затем она сортирует этот файл. Количество адресов, подлежащих сортировке, указано <Term Type="In">константой</Term> NUM_ELEMENTS (которая равна 4 в данной программе). Однако в реальной жизни количество записей придется отслеживать динамически. </P>

<Listing>
<L>/* дисковая  сортировка  структур  типа  ddress.   */ #include  &lt;stdio.h&gt;</L>
<L>#include  &lt;stdlib.h&gt;</L>
<L>#include  &lt;string.h&gt;</L>
<L>#define  NUM_ELEMENTS  4    /*   Количество элементов - произвольное число, которое должно </L>
<L>определяться динамически для каждого списка.  */</L>
<L>struct address   {</L>
<L>char name [30];</L>
<L>char street[40] ;</L>
<L>char city[20];</L>
<L>char state[3];</L>
<L>char zip[ll];</L>
<L>}   ainfo;</L>
<L>struct address addrs[NUM_ELEMENTS] = {</L>
<L>&quot;A. Alexander&quot;, &quot;101  1st St&quot;, &quot;Olney&quot;, &quot;Ga&quot;, &quot;55555&quot;, &quot;B. Bertrand&quot;, &quot;22 2nd Ave&quot;, &quot;Oakland&quot;,</L>
<L>&quot;Pa&quot;, &quot;34232&quot;, &quot;C. Carlisle&quot;, &quot;33   3rd  Blvd&quot;, &quot;Ava&quot;, &quot;Or&quot;, &quot;92000&quot;, </L>
<L>&quot;D.Dodger&quot;, &quot;4  Fourth  Dr&quot;, &quot;Fresno&quot;, &quot;Mi&quot;, &quot;45678&quot;</L>
<L>};</L>
<L>void quick_disk (FILE *fp, int count);</L>
<L>void qs_disk(FILE *fp, int left, int right);</L>
<L>void swap_all_fields (FILE *fp, long i, long j); </L>
<L>char *get_zip(FILE *fp, long rec);</L>
<L>int main(void) </L>
<L>{</L>
<L>FILE *fp;</L>
<L>/* сначала создадим файл с данными, подлежащий сортировке */ if ((fp=fopen(&quot;mlist&quot;,&quot;wb&quot;))= =NULL)</L>
<L>{</L>
<L>printf(&quot;Невозможно открыть файл на запись.\n&quot;);</L>
<L>exit(l); </L>
<L>}</L>
<L>printf (&quot;Запись неупорядоченных данных в дисковый файл.\n&quot;); fwrite(addrs, sizeof(addrs), 1, fp);</L>
<L>fclose(fp);</L>
<L>/* теперь отсортируем файл */</L>
<L>if ( (fp=fopen(&quot;mlist&quot;, &quot;rb+&quot;) )= =NULL) {</L>
<L>printf(&quot;Невозможно открыть файл на чтение/запись.\n&quot;);</L>
<L>exit(l); </L>
<L>}</L>
<L>printf(&quot;Сортировка дискового файла.\n&quot;);</L>
<L>quick_disk(fp,   NUM_ELEMENTS);</L>
<L>fclose(fp);</L>
<L>printf(&quot;Файл   отсортирован.\n&quot;);</L>
<L>return   0;</L>
<L>} </L>
<L /><L>/* Быстрая сортировка файлов. */</L>
<L>void quick_disk(FILE *fp, int count)</L>
<L>{</L>
<L>qs_disk (fp, 0, count-1) ;</L>
<L>}</L>
<L>void qs_disk(FILE *fp, int left, int right)</L>
<L>{</L>
<L>long int i, j;</L>
<L /><L>char x[100];</L>
<L>i = left; j = right;</L>
<L>strcpy!x, get_zip(fp, (long)(i+j)/2)); /* получить средний почтовый</L>
<L>индекс */</L>
<L>do {</L>
<L>while((strcmp(get_zip(fp,i),x) &lt; 0) &amp;&amp; (i &lt; right)) i++;</L>
<L> while((strcmp(get_zip(fp,j),x) &gt; 0) &amp;&amp; (j &gt; left)) j--;</L>
<L>if(i &lt;= j) {</L>
<L>swap_all_fields(fp, i, j); </L>
<L>i++; </L>
<L>j - -;</L>
<L>}</L>
<L>} while(i &lt;= j);</L>
<L>if(left &lt; j) qs_disk(fp, left, (int) j); </L>
<L>if(i &lt; right) qs_disk(fp, (int) i, right);</L>
<L>}</L>
<L>void swap_all_fields(FILE *fp, long i, long j)</L>
<L>{</L>
<L>char a[sizeof(ainfo)], b[sizeof(ainfo)];</L>
<L>/* считать в память записи i и j */</L>
<L>fseek(fp, sizeof(ainfo)*i, SEEK_SET);</L>
<L>fread(a, sizeof (ainfo), 1, fp);</L>
<L>fseek(fp, sizeof(ainfo)*j, SEEK_SET); fread(b, sizeof(ainfo), 1, fp);</L>
<L>/* потом записать их на диск, поменяв местами.*/ </L>
<L>fseek(fp, sizeof (ainfo) *j, SEEK__SET) ; </L>
<L>fwrite (a, sizeof (ainfo) ,&quot; 1, fp) ;</L>
<L>fseek(fp, sizeof(ainfo)*i, SEEK_SET);</L>
<L>fwrite(b, sizeof(ainfo), 1, fp);</L>
<L>}</L>
<L>/* Получение указателя на почтовый код записи */</L>
<L>char *get_zip(FILE *fp, long rec)</L>
<L>(</L>
<L>struct address *p;</L>
<L>p = &amp;ainfo ;</L>
<L>fseek(fp, rec*sizeof(ainfo),  SEEK_SET);</L>
<L>fread(p,   sizeof(ainfo),   1,   fp); return  ainfo.zip;</L>
<L>}</L>
</Listing>
<P>Для сортировки адресных записей пришлось на&#xAC;писать две вспомогательные функции. Во фрагменте сравнения используется функция <Operator>get_zip()</Operator>, возвращающая указатель на поле zip сравниваемых записей. Функция <Operator>swap_all_fields() </Operator>выполняет обмен данных двух записей. Порядок операций чтения и записи оказывает большое влияние на скорость выполнения сортировки. При обмене двух записей программа перемешает указатель текущей записи в файле сначала на запись <Operator>i</Operator>, а потом на запись <Operator>j</Operator>. Пока головка диска находится над записью <Operator>j</Operator>, записываются данные записи <Operator>j</Operator>. Это значит, что в этот момент головку не придется перемешать на большое расстояние. Если бы код был составлен так, что первой записывалась бы запись <Operator>i</Operator>, понадобилось бы еще одно перемещение головки.</P>
<P /></Modul>
