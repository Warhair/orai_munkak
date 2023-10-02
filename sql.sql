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