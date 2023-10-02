KÖNYVESBOLT fh. funkciói

könyvek kezelése
kiadványok kezelése
	beszerzés(egysz/össz)
	készletmozfás(raktárból eladótérbe vagy vissza)
	selejtezés
	eladás (nyugtaadással)...
	akciós árak... +1
	szerzö nyrt.

f: az x egyért meghat. 1 f(x)-et

1NF: legyen kulcs
	(minden tul függ a kulcstól)
2NF: ne részlegesen
3NF: közvetlenül
...


-raktár vezető
-raktaros
-eladó/pénztáros

funkciók:
 beszerzés
 mozgatás
 selejtezés eladás(nyugtaadással)
 könyvek kezelése...
 árszabás
 extra: műfaji bontással, kiadókkal. szerzőkkel
 
AKCIóZÁS VERZIÓI
 -akciós ár tól-ig meghat
 -n-et fizet, (n+1)-et kap
 -végösszegre jár engedmény
 -végösszegre jár ajándékkönyv
 -törzsvásárlóival az eddig elköltött összeg alapján jár mindig
 -pontgyűjtéssel műk. kártyával fizetés(x FT után 1 pont, és pontokkal is lehet fizetni)
 
 +nyereményjátékban való részvétel?
 
 ? Dolgozók kez. munkakörrel és dolgozással (műszak van_e)
 
 Szüks. egyedek kialakítása:
 MŰFAJ(mazon, elnevm főműfaja) 2 mélységig
 KÖNYV(kv_id, cím, alk_éve, műfaj)
 SZERZŐ(szkód, név, nemzet, sz_éve, ha éve)
	SZERZŐ:KÖNYV=N:M ezért kell SZERZI(szerzö, könyv)
KIADÓ(kazon, elnev,)
KIADVÁNY(kki:id,könyv, kiadás_éve, kiadő kötés_tipus, elad_ár)
 
 BESZERZÉS(kiadvány, mikord, darab)
 MOZGAATÁS(kiadvány, mikorDT, honnan, hova, darab) honnan, hova: R/E
 SELEJTEZÉS(kiadvány, mikorDT, honnan, darab)
 XOR KÉSZLETMOZGÁS((kiadvány, mikorDT, honnan, darab, mozgásnem)honnan,hova: R/E/S/null)
 
 NYUGTA(ny_szám, dátum, végösszeg)
 NY_TÉTEL(nyugts, kiadvány darab)
 XOR NY_TÉTEL nem lesz de az E mozgásnemű készletmozgásba kell hivatk. a nyugtára
 
 6
 kartyák
 email
 el_osszeg
 
 engedmenyek
 el_osszeg
 engedmény
 
 PÉKSÉG
 
 ANYAG <- ALKOTJA
 PEKSUTI <- ALKOTJA
 PEKSUTI <- TERMEK <- RECEPT
 TERMEK <- GYARTAS
 BOLT <- KISZALITVA 
 GYARTAS <- KISZALITVA

ANYAG[Aid(PK),nev,(keszlet),mertekegyseg
PEKSUTI[Pid(PK),nev]
ALKOTJA[Anyag(KK,OK),Peksutemeny(KK,OK)]
TERMEK[tkod(PK), meret, súly, Peksutemeny(KK), ar, hanyadagosR, idokorlat{óra}]
RECEPT[Termek(KK),Anyag(PK),szukmennyiseg]
GYARTAS[mikor(OK,){datum-ido},Termek(OK,KK),hanyTepsi]
BOLT[Bid(PK),cim...]
KISZALITVA[Bolt(KK,OK),Gyartras(KK,OK),hány,SZmikor]
 
 
  create Function meghaladja
 (
	@tant char(5),
	@oszt char(2)
 )
 return bit
 
 as
 begin
	declare @vissza bit =0
	declare @korlát tinyint, @van tinyint
	
	select @korlát= heti_óraszám from tantárgy where tant=@tant
	select @van = Select cont(*) from órarend where osztály=@oszt and tant = @tant
	if @korlát < @van
		set @vissza = 1
	return @vissza
 end
 Select db.meghaladja('mat1','1a')
 
 create Function heti_óraszám
 (
	@tant char(5)
 )
 returns tinyint
 as
 begin
     return (select heti_oraszám from tantárgy where tant = @tant)

create view nézet1 as
select *, dbo.heti_oraszám(tant) as előírt from tanít

select * from nézet1

create function tanar_utkozes
(
 @tant char(5),
 @oszt char(2),
 @nap  tinyint,
 @ora  tinyint
	
)
returns bit
as
begin
	declare @tanar int
	select @tanar= tanár from @tanar where osztaly= @osztály and tant=@tant
	select from óranrend inner join on osztál
end