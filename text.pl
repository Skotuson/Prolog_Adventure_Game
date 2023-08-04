%declare dynamic facts.
:- dynamic(player/1),
   dynamic(inventory/1),
   dynamic(item/2),
   dynamic(locked/3),
   dynamic(enemy/3),
   dynamic(hp/1),
   dynamic(heal/2),
   dynamic(teleport/1).

%:- initialization(init_()).

%=================================ITEMS=================================%
item(1, prak).
item(3, isic).
item(4, kruzitko).
item(7, klicenka).
item(9, pizza).
item(12, teleport).

%inventory(isic).
inventory(zabikuch).

%if teleport(0), it hasn't been found yet or is in player's inventory, so it can't be used.
teleport(0).
%=================================ITEMS=================================%

%=================================COMBAT=================================%
%health
hp(3).
%food to heal
heal(pizza).
%enemy(+Name, +Room, +Weakness)
enemy( "Přerostlá krysa", 9, melee ).
enemy( "Architekt (tvé zkázy)", 18, melee ).
enemy( "Stavař", 10, melee ).
enemy( "Teoretický Informatik", 12, ranged ).

%weapon(+Name, +Type)
weapon(zabikuch, melee).
weapon(kruzitko, melee).
weapon(prak, ranged).
%=================================COMBAT=================================%

%=================================DOORS=================================%
%from which room, which door, which item
%locked(+From, +LockedDoor, +Key)
locked(5, 6, isic).
locked(13, 21, klicenka).
%=================================DOORS=================================%

%=================================ROOMS=================================%
%FSv outside
room(1, "Stojíš na menším nádvoří.", [8, 2, 0, 5], 
    ["Na sever se nachází budova s kryptickým nápisem FSv.",
     "Na jih se nachází budova podivného tvaru.",
     "",
     "Na východě vidíš podivný menhir."]).
%NTK outside
room(2, "Vcházíš před podivnou oválnou budovu.", [1, 0, 0, 4], 
    ["Na sever je menší nádvoři a za ním podlouhlá budova s nápisem, který nepřečteš.",
     "",
     "",
     "Na východ je vstup do oválné budovy."]).
%Cafe Prostoru
room(3, "Vcházíš do malého podniku.", [5, 4, 0, 0], 
    ["Na sever vidíš prosklené dveře, skrze které vidíš podivný menhir.",
     "Na jih jsou dveře, které vedou do vstupní haly oválné budovy.",
     "",
     ""]).
%NTK inside
room(4, "Vcházíš do vstupní haly. Všude po stěnách jsou nápisy NTK.", [3, 0, 2, 0], 
    ["Na sever vidíš vstup do opuštěného podniku.",
     "",
     "Na západ jsou vstupní dveře.",
     ""]).
%FIT outside
room(5, "Jak se přibližuješ k menhiru, zjistíš, že se za ním tyčí vysoká budova. Atmosféra je podivná a opuštěná oblehácí věž to pouze umocňuje.", [6, 3, 1, 0], 
    ["Na sever se nachází vstup do budovy, zdobený nápisem FA. Je vidět, že zde část nápisu chybí.",
     "Na jih se nachází dveře do opuštěného podniku.",
     "Na západ vede cesta na menší nádvoři.",
     ""]).
%FIT inside
room(6, "Vcházíš do chladné vstupní chodby a procházíš turniketem. Vidíš opuštěnou vrátnici a točité schody.", [15, 5, 7, 14], 
    ["Na sever pokračuje chodba.",
     "Na jihu se nachází východ.",
     "Na západ vedou schody, které prodlužuje prosklený most.",
     "Na východě se nachází velká místnost."]).
%Bridge
room(7, "Vcházíš na prosklený most.", [0, 0, 11, 6], 
    ["",
     "",
     "Na západ vidíš chodbu s několika výtahy.",
     "Na východ vede cesta do vstupní haly budovy FA."]).
%FSv inside
room(8, "Vcházíš do velké auly. Kromě zázračně funkčních turniketů to vypadá, že vypadl proud.", [10, 1, 9, 11], 
    ["Na severu se nachází točité schodiště.",
     "Na jihu je východ z budovy.",
     "Na západ vede cesta do jídelny.",
     "Na východ je místnost s výtahy."]).
%Bufet
room(9, "Vcházíš do bufetu. Kromě zkaženého jídla a hejna krys se tu nic zajímavého neděje.", [0, 0, 0, 8], 
    ["",
     "",
     "",
     "Na východ je východ (haha)"]).
%Staircase
room(10, "Vcházíš na schodiště. Jdeš nahoru ale všechny dveře, na které narazíš jsou neprůchozí. Tvá cesta končí ve 12. patře, kde vidíš pootevřené dveře.", [12, 8, 0, 0], 
    ["Na sever jsou dveře.",
     "Na jihu tě čeká dlouhá cesta dolu.",
     "",
     ""]).
%Elevators
room(11, "Jsi obklopen výtahy.", [13, 0, 8, 7], 
    ["Na severu je jediný funkční výtah.",
     "",
     "Na západ je velká aula.",
     "Na východ vede cesta na most."]).
%KTI
room(12, "Procházíš polootevřenými dveřmi a dostáváš na patro se zkratkou KTI (Katedra Tortury a Intriků).", [0, 10, 0, 0], 
    ["",
     "Na jihu je cesta zpět.",
     "",
     ""]).
%KAM
room(13, "Nastoupíš do výtahu a zmáčkneš tlačítko. Ačkoliv si zmáčkl tlačítko 2, výtah jede do 14. patra a nereaguje. Dveře se otevírají a před sebou vidíš nápis KAM (Katedra Aplikovaného Mučení).", 
    [21, 11, 0, 0], 
    ["Na sever vidíš zesílené dveře.",
     "Na jihu je cesta zpět, honem!",
     "",
     ""]).
%Piano room
room(14, "Vcházíš do haly s klavírem.", [20, 0, 6, 0], 
    ["Na sever se nachází chodba.",
     "",
     "Na západě je východ z budovy.",
     ""]).
%Left hallway
room(15, "Vcházíš do protáhle chodby.", [16, 6, 0, 20], 
    ["Na sever je vstup do místnosti s číslem 155",
     "Na jihu se nachází východ z budovy.",
     "",
     "Na východ pokračuje chodba."]).
%Room 155
room(16, "Vcházíš do místnost. Vidíš několik řad lavic a dole velkou tabuli. Místností se ozýva bzučení rozbitého projektoru.", [0, 15, 0, 17], 
    ["",
     "Na jihu je východ z místnosti.",
     "",
     "Na východě dole pod schody se nachází průchod."]).
%Room 105
room(17, "Vcházíš do místnosti, která je velmi podobná te předešlé, jenom je trochu větší.", [0, 0, 16, 0], 
    ["",
     "",
     "Na západ je cesta zpět.",
     ""]).
%Room 107
room(18, "Vcházíš do mísnosti, která na tebe nedělá dobrý dojem. Asi za to může ta prasklina ve zdi.", [0, 20, 0, 19], 
    ["",
     "Na jihu je cesta zpět na chodbu.",
     "",
     "Na východě je ta divná prasklina."]).
%Room 111
room(19, "Dotýkáš se praskliny a najednou se přemístíš do místnosti, která je stejná, akorát zrcadlově otočená. Haluz. Hlava ti to nebere.", [0, 20, 0, 0], 
    ["",
     "Na jihu jsou dveře ven.",
     "",
     ""]).
%Right hallway
room(20, "Jsi na podlouhlé chodbě.", [18, 14, 15, 0], 
    ["Na sever je vchod do místnosti 107.",
     "Na jihu se nachází koncertní sál s klavírem.",
     "Na západ pokračuje chodba.",
     ""]).
%Final room
room(21, "Vcházíš do místnosti a vidíš před sebou štost papírů, všechny označené písmenem F. Najednou se za tebou vynoří dlouhovlasá postava a se slovy \"dnes za F pane kolego\" tě přetáhne pravítkem.",
    [0, 0, 0, 0], 
    ["",
     "",
     "",
     ""]).
%=================================ROOMS=================================%

%=================================IMPL==================================%
%ansi sequence to clear screen.
clearScreen :- write('\33\[2J'),write('\033[H').

refresh :-
    player(X),
    clearScreen, info(X), nl. 

%start predicate which initializes the player and room
start :-
    clearScreen,
    assert(player(1)),
    info(1), !.

%run basic tests and then ends the program
run_test :-
    assert(player(1)),
    %vezmi predicate test
    %item is in the room  
    item(1, prak),
    not(inventory(prak)),
    vezmi(prak),
    not(item(1, prak)),
    inventory(prak),
    %item is not in the room
    not(item(1, mince)),
    vezmi(mince),
    not(item(1, mince)),
    not(inventory(mince)),

    %add items for testing
    assert(item(1,mince)),
    assert(inventory(mince)),
    assert(inventory(bankovka)),

    %poloz predicate test
    %item is not the room  
    poloz(bankovka),
    item(1, bankovka),
    not(inventory(bankovka)),
    %item is in the room
    poloz(mince),
    item(1, mince),
    inventory(mince),

    %moving and locked door test
    retract(player(1)),
    assert(player(5)),
    locked(5, 6, isic),
    assert(inventory(isic)),
    sever(),
    player(5),
    pouzij(isic),
    not(inventory(isic)),
    sever(),
    player(6),

    %combat test
    retract(player(6)),
    assert(player(9)),
    hp(3),
    pouzij(mince),
    hp(3),
    vychod(),
    player(8),
    hp(2),
    zapad(),
    player(9),
    vezmi(pizza),
    hp(1),
    not(inventory(pizza)),
    pouzij(zabikuch),
    not(enemy( "Přerostlá krysa", 9, melee )),
    hp(1),
    pouzij(pizza),
    hp(1),
    vezmi(pizza),
    pouzij(pizza),
    hp(2),

    %teleport test
    retract(player(9)),
    assert(player(12)),
    enemy( "Teoretický Informatik", 12, ranged ),
    pouzij(prak),
    not(enemy( "Teoretický Informatik", 12, ranged )),
    hp(2),
    teleport(0),
    vezmi(teleport),
    teleport(0),
    poloz(teleport),
    teleport(12),
    jih(),
    jih(),
    hp(1),
    jih(),
    player(1),
    pouzij(teleport),
    player(12),

    %final printout
    clearScreen,
    writeln("Testing was success."),
    halt.

%test has failed
run_test :- clearScreen, writeln("Testing failed."), halt.

%writeRoomInfo(+LstA,+LstB)
%predicate which prints out available rooms
writeRoomInfo([], []).

%room doesn't have doors in this direction
writeRoomInfo([X | Xs], [_ | Ys]) :-
    X =:= 0, writeRoomInfo( Xs, Ys ).

%room has locked doors in this direction
writeRoomInfo([X | Xs], [Y | Ys]) :-
    player(Player),
    locked(Player, X, Item), write("- "),write(Y),write(" [Zamceno, potrebujes "),write(Item),writeln("]"), writeRoomInfo( Xs, Ys ).

%room does have doors in this direction
writeRoomInfo([_ | Xs], [Y | Ys]) :-
    write("- "),write(Y),write("\n"), writeRoomInfo( Xs, Ys ).

%information about enemy in the room.
writeEnemyInfo(Room) :-
    enemy(Name, Room, _),
    write("Narazil jsi na nepřítele: "), writeln(Name).

writeEnemyInfo(_).

info(Num) :-
    room(Num, Text, [0, 0, 0, 0], _),
    %print HP
    hp(HP),
    write("Životy: "), writeln(HP),
    %print inventory
    write("Inventar: "), findall(X, inventory(X), Inv), print_inventory(Inv),nl,
    writeln(Text),writeln("Hra zde končí, díky za zahrání!"), halt.

info(Num) :-
    room(Num, Text, Rooms, Direction),
    %print HP
    hp(HP),
    write("Životy: "), writeln(HP),
    %print inventory
    write("Inventar: "), findall(X, inventory(X), Inv), print_inventory(Inv),nl,
    %print if an item is available in current room. Uses findall to work with a list.
    findall(Y, item(Num,Y), Itm),
    write(Text),items(Itm), !,
    %print info about enemies.
    writeEnemyInfo(Num),
    %print rooms and direction
    nl, writeRoomInfo(Rooms, Direction).

items([]) :- writeln("").
items([X | Xs]) :- write("\nNachází se zde "),write(X),write(.),items(Xs).

%empty inventory.
print_inventory([]) :- writeln("Nic nemas.").

%last item in inventory.
print_inventory([X]) :- writeln(X).

%recursive print inventory.
print_inventory([ X | Xs ]) :-
    write(X),write(", "),print_inventory(Xs).

updateHealth( N ) :-
    hp(HP),
    retract(hp(HP)),
    NewHP is HP + N,
    NewHP > 0,
    assert(hp(NewHP)).

%player has 0 HP and dies
updateHealth( _ ) :-
    writeln("Zemřel jsi!"), halt.

removeItem(Item) :-
    retract(inventory(Item)).

%pickup an teleporter
vezmi(teleport) :-
    %get player room
    player(X),
    item(X, teleport), 
    %no enemy in the room
    not(enemy(_, X, _)),
    %no teleport in inventory
    not(inventory(teleport)),
    %get teleport room
    teleport(Y),
    %remove old teleport fact
    retract(teleport(Y)),
    %invalidate teleport
    assert(teleport(0)),
    %add teleport
    assert(inventory(teleport)),
    %remove item fact
    retract(item(X, teleport)), 
    refresh, !.

%pickup an non-teleport item
vezmi(Item) :-
    player(X),
    item(X, Item), 
    not(enemy(_, X, _)),
    not(inventory(Item)),
    assert(inventory(Item)),
    retract(item(X, Item)), 
    refresh, !.

%attempt to pickup an item which is already in player's inventory
vezmi(Item) :-
    player(X),
    item(X, Item), 
    not(enemy(_, X, _)),
    refresh,
    writeln("Předmět už máš!"), !.

%attempt to take item when there is an enemy around
vezmi(Item) :-
    player(X),
    item(X, Item),
    updateHealth(-1),
    refresh,
    writeln("Pokusil ses předmět zvednout, ale nepřítel ti dal pěknou ránu."), !.

vezmi(_) :- refresh, writeln("Nelze provest!"), !.

%placing an teleport
poloz(teleport) :-
    %teleport is in inventory
    inventory(teleport),
    player(X),
    %no teleport in current room
    not(item(X, teleport)),
    %remove from inventory
    retract(inventory(teleport)),
    assert(item(X, teleport)), 
    retract(teleport(0)),
    assert(teleport(X)),
    refresh, !.

%placing an item which isn't already in the room (non-teleport)
poloz(Item) :-
    inventory(Item),
    player(X),
    not(item(X, Item)),
    retract(inventory(Item)),
    assert(item(X, Item)), 
    refresh, !.

%item was in the room or player doesn't have the item in his inventory.
poloz(_) :- refresh, writeln("Nelze provest!"), !.

%attempt to use a teleport
pouzij(teleport) :-
    %teleport is either in player's inventory or hasn't been found yet
    not(teleport(0)),
    teleport(X),
    player(Y),
    retract(player(Y)),
    assert(player(X)), 
    refresh, !.

%teleport hasn't been set
pouzij(teleport) :- refresh, writeln("Teleport neni nastaven!"), !.

%player unlocks door
pouzij(Item) :-
    %get current room
    player(X),
    %check if player has item in his inventory
    inventory(Item),
    %find locked door
    locked(X, Y, Item),
    %remove fact (unlock the door)
    retract(locked(X, Y, Item)),
    %item is used and removed
    removeItem(Item),
    refresh,
    write("Odemkl jsi dveře pomocí "),write(Item),writeln("."), !.

%player attacks with correct type of weapon
pouzij(Item) :-
    %get current room
    player(X),
    %check if item is in inventory
    inventory(Item),
    %find enemy in the room
    enemy(Name, X, Type),
    %check if the weapon has the correct type
    weapon(Item, Type),
    %remove the fact (kill the enemy)
    retract(enemy(Name, X, Type)),
    refresh,
    writeln("Zaútočil jsi na nepřítele a zabil ho."), !.

%player attacks with incorrect type of weapon
pouzij(Item) :-
    player(X),
    inventory(Item),
    enemy(Name, X, Type),
    %check if the item is a weapon (has to be the wrong type since unification failed with previous pred)
    weapon(Item, _),
    %remove fact (enemy flees)
    retract(enemy(Name, X, Type)),
    %damage player
    updateHealth(-1),
    refresh,
    writeln("Zaůtočil jsi, bohužel bez měřitelného efektu. Nepřítele si zahnal, ale byl si zraněn!"), !.

%player uses healing item
pouzij(Item) :-
    inventory(Item),
    heal(Item),
    updateHealth(1),
    %healing item is consumed.
    removeItem(Item),
    refresh,
    writeln("Cítíš se trochu lépe (+1 život)."), !.

%player uses item in inventory, but it has no usage in current room
pouzij(Item) :-
    inventory(Item),
    refresh,
    writeln("Předmět zde nelze použít."), !.

%player doesn't have item in inventory
pouzij(_) :- refresh, writeln("Takový předmět nemáš!"), !.

%change direction
changeDirection(N) :-
    %get player room info
    player(X),
    %get room info
    room(X, _, Rooms, _),
    %find room in selected direction
    nth0(N, Rooms, Elem),
    %check if there is a room in selected dir
    Elem =\= 0,
    %doors are not locked
    not(locked(X, Elem, _)),
    %no enemy in the room
    not(enemy(_, X, _)),
    %update player location
    retract(player(X)),
    assert(player(Elem)),
    clearScreen, info(Elem), !.

%unavailable direction
changeDirection(N) :-
    player(X),
    room(X, _, Rooms, _),
    nth0(N, Rooms, Elem),
    Elem =:= 0,
    refresh,
    writeln("Timto smerem nic není!"), !.

%door is locked
changeDirection(N) :-
    player(X),
    room(X, _, Rooms, _),
    nth0(N, Rooms, Elem),
    locked(X, Elem, Item),
    refresh,
    write("Dvere jsou zamcene! Potrebujes pouzit "),write(Item),write(".\n"), !.    

%player attempts to leave when there is an enemy inside the room
changeDirection(N) :-
    player(X),
    room(X, _, Rooms, _),
    nth0(N, Rooms, Elem),
    enemy(_, X, _),
    retract(player(X)),
    assert(player(Elem)),
    updateHealth(-1),
    clearScreen, info(Elem), nl,
    writeln("Nechal si nepřítele žít a při odchodu se ti odvděčil ránou do zad."), !.    

sever() :- changeDirection(0).
jih() :- changeDirection(1).
zapad() :- changeDirection(2).
vychod() :- changeDirection(3).
%=================================IMPL==================================%