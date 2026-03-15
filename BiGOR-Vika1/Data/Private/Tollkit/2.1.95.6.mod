<?xml version="1.0" encoding="windows-1251"?>

<Modul UId="W4QLDGWC6GRXM1Z1M0X1" Author="Волосатова Т.М." Level="0" ADate="F9QPJAE7">
<Title>Сообщение об ошибке, Структура XErrorEvent</Title>
<P /><P>Структура <Term Type="Out">XErrorEvent</Term> определена следующим образом:</P>
<P /><P><Font B="Y">typedef  struct   { </Font></P>
<P><Font B="Y">int  type; </Font></P>
<P><Font B="Y">Display  *display;</Font></P>
<P><Font B="Y">XID resourceid; </Font></P>
<P><Font B="Y">unsigned long serial;</Font></P>
<P><Font B="Y">unsigned char   error_code;</Font></P>
<P><Font B="Y">unsigned char   request_code;</Font></P>
<P><Font B="Y">unsigned char   minor_code;</Font></P>
<P><Font B="Y">}XErrorEvent;</Font></P>
<P /><P>Структура XErrorEvent соответствует сообщению об ошибке, обнаруженной Х-сервером. После получения такого сообщения на клиентской стороне запускается обработчик ошибок (который может быть установлен с помощью функции <Term Type="Link">XSetErrorHandler</Term>()).</P>
<P>В поле serial записывается последовательный номер запроса, который привел к данной ошибке. Последовательный номер присваивается всем запросам, посылаемым <Term Type="Link" Sp="*">клиентом</Term> с момента открытия соединения (первый запрос имеет номер 1). Значение в поле serial совпадает с тем, которое было бы получено в результате вызова <Term Type="Link" Sp="*">макроса</Term> NextRequestQ непосредственно перед выполнением запроса, приведшего к ошибке.</P>
<P>В поле error code записывается код ошибки (BadWindow, и т.д.).</P>
<P>В поле requestcode записывается старший код запроса (major op-code), приведшего к ошибке; эти коды определены в заголовочном файлеX11/Xproto.h.</P>
<P>В поле minor code записывается младший код запроса (minor op-code), приведшего к ошибке. (Эти коды используются расширениями базового Х-протокола.)</P>
<P>В поле resourceid записывается некорректный <Term Type="Link" Sp="*">идентификатор</Term>, послуживший причиной ошибки.</P>
</Modul>
