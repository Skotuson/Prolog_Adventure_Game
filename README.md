# Textová adventura v Prologu

V Prologu implementujte textovou adventuru, která podporuje inventář postavy, nepřátele, mapy, apod.
## Naimplementováno:  
**Definice prostředí a pohyb hráče** - lze procházet mezi místnostmi, každá místnost má různé možnosti a popis.  
**Inventář** - Pomocí predikátů *vezmi*, *poloz* a *pouzij* lze manipulovat s věcmi v místnostech a inventáři.  
**Zamčené dveře** - Některé průchody jsou zamčené a vyžadují předmět v inventáři, který pomocí *pouzij(klic)* dveře odemkne.  
**Nepřátelé a zbraně** - V některých místnostech se nachází nepřátelé, kteři jsou zranitelní pouze vůči jednomu typu zbraně. Hráč pomocí *pouzij(zbran)* může na nepřítele zaůtočit.   
**Teleport** - Hráč může po nalezení teleportu někde teleport položit pomocí *poloz(teleport)* a následně pomocí *pouzij(teleport)* se přemístit do dané místnosti.

# Popis rozhraní

## Spuštění
**Soubor lze spustit pomocí:**
<pre>
swipl text.pl 
</pre>
Případně spuštění s přepínačem -q, který umlčí uvítací zprávu:  
<pre>
swipl -q text.pl  
</pre>  

Samotnou hru lze zahájit predikátem 
<pre> ?- start. </pre>

Pokud je v zájmu pouze otestovat základní funkčnost, je možné před zavoláním *start* spustit testy pomocí predikátu
<pre> ?- run_test. </pre>

## Ovládání 
- K pohybu slouží predikáty *sever*, *jih*, *zapad* a *vychod*. Hráč si může vybrat směr podle toho, který je zrovna dostupný.
- K manipulaci s inventářem slouží *vezmi*, *poloz* a *pouzij*.
    - **vezmi(Predmet)** - Pokud hráč použije tento predikát a předmět se nachází v dané místnosti a zároveň ho již nemá v inventáři, předmět se přidá do inventáře.  
    - **poloz(Predmet)** - Pokud má hráč tento předmět v inventáři a nenachází se v místnosti, tak se z inventáře odebere a bude k nalezení v dané místnosti.  
    - **pouzij(Predmet)** - Tento predikát má více využití, záleží na kontextu použití v dané místnosti:
        - Pokud se hráč nachází v místnosti kde jsou zamčené dveře a *Predmet* je nějaký klíč, který sedí ke dveřím, tak **pouzij(predmet)** odemkne dané dveře.
        - Pokud se hráč nachází v místnosti s nepřítelem a *Predmet* je zbraň, **pouzij(Predmet)** se zbaví nepřítele. V závislosti na typu zbraně buďto nepřítel bude okamžitě zabit (nepřítel byl zranitelný vůči danému typu), a nebo bude zahnán, ale s újmou na hráčově zdraví (nepřítel byl imunní vůči danému typu).
        - Pokud *Predmet* je nějaký lečivý předmět, hráč ho pomocí **pouzij(Predmet)** zkonzumuje a zvyší si zdraví o 1.  
        - Pokud *Predmet* je teleport, potom mohou nastat 3 možnosti:
            - Hráč teleport ještě nenašel, tedy teleport nelze použít.  
            - Hráč teleport našel, ale má ho v inventáři, tedy se na něj nelze teleportovat.  
            - Hráč teleport našel, pomocí predikátu *vezmi* si ho dal do inventáře, pomocí *poloz* ho uložil do nějaké místnosti do které se chce připadně teleportovat a predikátem
*pouzij* se na něj následně teleportuje.  

## Ukázkové vstupy na rychlé vyzkoušení hry
V této sekci se nachází vstupy na rychlé vyzkoušení hry. Pro podrobnější ukázky s vysvětlivkami lze využít další sekci "Ukázka herní obrazovky s popisky"

Vstupy předpokládají, že se jedná o právě spuštený soubor a byl zavolán predikát *start*.

### Výhra, používání inventáře, odemykání dveří
<pre>
?- vychod().
?- jih().
?- vezmi(isic).
?- sever().
?- pouzij(isic).
?- sever().
?- zapad().
?- vezmi(klicenka).
?- zapad().
?- sever().
?- pouzij(klicenka).
?- sever().
</pre>

### Souboj, léčení, pokládání věcí
<pre>
?- vezmi(prak).
?- sever().
?- zapad().
?- pouzij(prak).
?- vezmi(pizza).
?- pouzij(pizza).
?- poloz(zabikuch).
</pre>

### Souboj, smrt hráče
<pre>
?- vezmi(prak).
?- sever().
?- zapad().
?- vezmi(pizza).
?- vychod().
?- zapad().
?- pouzij(prak).
</pre>

### Souboj, více typů zbraní, teleport.
<pre>
?- vezmi(prak).
?- sever().
?- sever().
?- pouzij(zabikuch).
?- sever().
?- pouzij(prak).
?- vezmi(teleport).
?- poloz(teleport).
?- jih().
?- jih().
?- pouzij(teleport).
</pre>

## Ukázka herní obrazovky s popisky: 
### Pohyb
<pre>
Životy: 3 <-- Životy hráče
Inventar: isic, zabikuch <-- Inventář hráče

Jak se přibližuješ k menhiru, zjistíš, že se za ním tyčí vysoká budova. Atmosféra je podivná 
a opuštěná oblehácí věž to pouze umocňuje. <-- Popis místnosti

- Na sever se nachází vstup do budovy, zdobený nápisem FA. [Zamceno, potrebujes isic] <-- Zamčené dveře
- Na jih se nachází dveře do opuštěného podniku. <-- Možnost jít na jih
- Na západ vede cesta na menší nádvoři. <-- Možnost jít na západ

?-
</pre>

Pokud například hráč použije predikát *vychod()*, hra ho upozorní že směr neexistuje:  
<pre>
?- vychod(). <-- použitý predikát
Životy: 3
Inventar: isic, zabikuch

Jak se přibližuješ k menhiru, zjistíš, že se za ním tyčí vysoká budova. Atmosféra je podivná 
a opuštěná oblehácí věž to pouze umocňuje.

- Na sever se nachází vstup do budovy, zdobený nápisem FA. [Zamceno, potrebujes isic]
- Na jih se nachází dveře do opuštěného podniku.
- Na západ vede cesta na menší nádvoři.

Timto smerem nic není! <-- chybová hláška

?-
</pre>
Pokud hráč použije predikát *sever()*, hra ho upozorní že dveře tímto směrem jsou zamčené a jakým předmětem je lze odemknout:
<pre>
?- sever().
Životy: 3
Inventar: isic, zabikuch

Jak se přibližuješ k menhiru, zjistíš, že se za ním tyčí vysoká budova. Atmosféra je podivná 
a opuštěná oblehácí věž to pouze umocňuje.

- Na sever se nachází vstup do budovy, zdobený nápisem FA. [Zamceno, potrebujes isic]
- Na jih se nachází dveře do opuštěného podniku.
- Na západ vede cesta na menší nádvoři.

Dvere jsou zamcene! Potrebujes pouzit isic.

?-
</pre>
Hráč tedy může použít predikat *pouzij(isic)* a dveře odemknout:
<pre>
?- pouzij(isic).
Životy: 3
Inventar: zabikuch <-- klíč zmizel z inventáře

Jak se přibližuješ k menhiru, zjistíš, že se za ním tyčí vysoká budova. Atmosféra je podivná 
a opuštěná oblehácí věž to pouze umocňuje.

- Na sever se nachází vstup do budovy, zdobený nápisem FA. <-- dveře jsou odemčené
- Na jih se nachází dveře do opuštěného podniku.
- Na západ vede cesta na menší nádvoři.

Odemkl jsi dveře pomocí isic. <-- informace o odemčení

?-
</pre>
A nyní již lze použít *sever()* a dveřmi projít:
<pre>
?- sever().
Životy: 3
Inventar: zabikuch

Vcházíš do chladné vstupní chodby a procházíš turniketem. Vidíš opuštěnou vrátnici a točité schody.

- Na sever pokračuje chodba.
- Na jihu se nachází východ.
- Na západ vedou schody, které prodlužuje prosklený most.
- Na východě se nachází velká místnost.

?-
</pre>
### Inventář
Hráč může pomocí predikátu *vezmi(predmet)* vzít předměty z místnosti.
<pre>
Životy: 3
Inventar: isic, zabikuch

Stojíš na menším nádvoří.
Nachází se zde prak.
Nachází se zde isic.

- Na sever se nachází budova s kryptickým nápisem FSv.
- Na jih se nachází budova podivného tvaru.
- Na východě vidíš podivný menhir.

?-
</pre>
Při použití *vezmi(prak)* se prak přidá do inventáře a zmizí z místnosti:
<pre>
?- vezmi(prak).
Životy: 3
Inventar: isic, zabikuch, prak

Stojíš na menším nádvoří.
Nachází se zde isic.

- Na sever se nachází budova s kryptickým nápisem FSv.
- Na jih se nachází budova podivného tvaru.
- Na východě vidíš podivný menhir.

?-
</pre>
Při použití *vezmi(isic)* je hráč upozorněn, že ho již v inventáři má:
<pre>
?- vezmi(isic).
Životy: 3
Inventar: isic, zabikuch, prak

Stojíš na menším nádvoří.
Nachází se zde isic.

- Na sever se nachází budova s kryptickým nápisem FSv.
- Na jih se nachází budova podivného tvaru.
- Na východě vidíš podivný menhir.

Předmet už máš! <-- chybová hláška

?-
</pre>
To stejné při použití *poloz(isic)*:
<pre>
?- poloz(isic).
Životy: 3
Inventar: isic, zabikuch, prak

Stojíš na menším nádvoří.
Nachází se zde isic.

- Na sever se nachází budova s kryptickým nápisem FSv.
- Na jih se nachází budova podivného tvaru.
- Na východě vidíš podivný menhir.

Nelze provest!

?-
</pre>
Použitím *poloz(zabikuch)* se akce provede a předmět zmizí z inventáře a objeví se v místnosti:
<pre>
?- poloz(zabikuch).
Životy: 3
Inventar: isic, prak

Stojíš na menším nádvoří.
Nachází se zde isic.
Nachází se zde zabikuch.

- Na sever se nachází budova s kryptickým nápisem FSv.
- Na jih se nachází budova podivného tvaru.
- Na východě vidíš podivný menhir.

?-
</pre>
### Souboje
Pokud hráč narazí na místnost s nepřítelem, má několik možností:  
<pre>
Životy: 3
Inventar: isic, zabikuch, prak

Vcházíš do bufetu. Kromě zkaženého jídla a hejna krys se tu nic zajímavého neděje.
Nachází se zde pizza.
Narazil jsi na nepřítele: Přerostlá krysa <-- informace o nepříteli

- Na východ je východ (haha)

?-
</pre>
1. Hráč zaútočí typem zbraně, vůči které je nepřítel zranitelný, tedy použije *pouzij(zbran)*:
<pre>
?- pouzij(zabikuch)
Životy: 3
Inventar: isic, zabikuch, prak

Vcházíš do bufetu. Kromě zkaženého jídla a hejna krys se tu nic zajímavého neděje.
Nachází se zde pizza.

- Na východ je východ (haha)

Zaútočil jsi na nepřítele a zabil ho. <-- zabitý nepřítel

?-
</pre>
2. Hráč zaútočí typem zbraně, vůči které je nepřítel imunní, tedy dostane poškození:
<pre>
?- pouzij(prak)
Životy: 2 <-- aktualizované zdraví
Inventar: isic, zabikuch, prak

Vcházíš do bufetu. Kromě zkaženého jídla a hejna krys se tu nic zajímavého neděje.
Nachází se zde pizza.

- Na východ je východ (haha)

Zaůtočil jsi, bohužel bez měřitelného efektu. Nepřítele si zahnal, ale byl si zraněn! <-- hláška o nepříteli

?-
</pre>
3. Hráč se pokusí vzít předmět v místnosti, kde je nezabitý/nezahnaný nepřítel. Hráč dostane poškození a nepřítel zůstane v místnosti:
<pre>
?- vezmi(pizza)
Životy: 2 <-- aktualizované zdraví
Inventar: isic, zabikuch

Vcházíš do bufetu. Kromě zkaženého jídla a hejna krys se tu nic zajímavého neděje.
Nachází se zde pizza.
Narazil jsi na nepřítele: Přerostlá krysa <-- nepřítel zůstavá

- Na východ je východ (haha)

Pokusil ses předmět zvednout, ale nepřítel ti dal pěknou ránu. <-- hláška o nepříteli

?-
</pre>
4. Hráč se pokusí odejít z místnosti, kde je nezabitý/nezahnaný nepřítel. Hráč změní místnost, dostane poškození a nepřítel zůstane v místnosti:
<pre>
?- vychod()
Životy: 2 <-- aktualizované zdraví
Inventar: isic, zabikuch

Vcházíš do velké auly. Kromě zázračně funkčních turniketů to vypadá, že vypadl proud. <-- změna místnosti

- Na severu se nachází točité schodiště.
- Na jihu je východ z budovy.
- Na západ vede cesta do jídelny.
- Na východ je místnost s výtahy.

Nechal si nepřítele žít a při odchodu se ti odvděčil ránou do zad. <-- hláška o nepříteli

?-
</pre>
### Léčení
Hráč má možnost se výlečit, pokud má jídlo v inventáři: 
<pre>
Životy: 2
Inventar: zabikuch, pizza

Jsi obklopen výtahy.

- Na severu je jediný funkční výtah.
- Na západ je velká aula.
- Na východ vede cesta na most.

?-
</pre>
*pouzij(pizza)* vyléčí hráče o 1 život:
<pre>
?- pouzij(pizza).
Životy: 3 <-- aktualizované zdraví
Inventar: zabikuch <-- pizza zmizela z inventáře

Jsi obklopen výtahy.

- Na severu je jediný funkční výtah.
- Na západ je velká aula.
- Na východ vede cesta na most.

Cítíš se trochu lépe (+1 život). <-- hláška o léčení

?-
</pre>
### Teleport
Hráč muže při hraní použít teleport pomoci *pouzij(teleport)*. Teleport lze však použít až potom, co ho hráč nalezne a následně někde položí.

Situace 1. Hráč teleport ještě nenašel:
<pre>
Životy: 2
Inventar: zabikuch

Procházíš polootevřenými dveřmi a dostáváš na patro se zkratkou KTI (Katedra Tortury a Intriků).
Nachází se zde teleport.

- Na jihu je cesta zpět.

?-
</pre>
Hra ho upozorní že teleport nelze použít:
<pre>
?- pouzij(teleport).
Životy: 2
Inventar: zabikuch

Procházíš polootevřenými dveřmi a dostáváš na patro se zkratkou KTI (Katedra Tortury a Intriků).
Nachází se zde teleport.

- Na jihu je cesta zpět.

Teleport neni nastaven! <-- informace o teleportu

?-
</pre>
Situace 2. Hráč má teleport v inventáři:
<pre>
Životy: 2
Inventar: zabikuch, teleport

Procházíš polootevřenými dveřmi a dostáváš na patro se zkratkou KTI (Katedra Tortury a Intriků).

- Na jihu je cesta zpět.

?-
</pre>
Opět nelze teleport použít:
<pre>
?- pouzij(teleport).
Životy: 2
Inventar: zabikuch, teleport

Procházíš polootevřenými dveřmi a dostáváš na patro se zkratkou KTI (Katedra Tortury a Intriků).

- Na jihu je cesta zpět.

Teleport neni nastaven! <-- informace o teleportu

?-
</pre>
Situace 3. Hráč již teleport nalezl a položil ho:
<pre>
Životy: 2
Inventar: zabikuch

Procházíš polootevřenými dveřmi a dostáváš na patro se zkratkou KTI (Katedra Tortury a Intriků).
Nachází se zde teleport. <-- teleport byl položen

- Na jihu je cesta zpět.

?-
</pre>
Hráč půjde do jiné místnosti:
<pre>
?- jih().
Životy: 2
Inventar: zabikuch

Vcházíš na schodiště. Jdeš nahoru ale všechny dveře, na které narazíš jsou neprůchozí. 
Tvá cesta končí ve 12. patře, kde vidíš pootevřené dveře.

- Na sever jsou dveře.
- Na jihu tě čeká dlouhá cesta dolu.

?-
</pre>
A nyní se teleport použije a hráč bude přemístěn:
<pre>
?- pouzij(teleport).
Životy: 2
Inventar: zabikuch

Procházíš polootevřenými dveřmi a dostáváš na patro se zkratkou KTI (Katedra Tortury a Intriků).
Nachází se zde teleport.

- Na jihu je cesta zpět.
?-
</pre>
Hráč byl přemísteň do předešlé místnosti.
