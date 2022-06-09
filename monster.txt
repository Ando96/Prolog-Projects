%Facts for the different types a pokemon can be
type(fire).
type(water).
type(grass).
type(electric).
type(normal).


%Facts for the different monsters - their names and the type they are 
monster(charmander , fire).
monster(bulbasaur , grass).
monster(squirtle , water).
monster(pikachu , electric).
monster(eevee , normal).


%Facts for all the different abilities a pokemon can have - the ability name and its type
ability(scratch , normal).
ability(fireFang , fire).
ability(firePunch , fire).
ability(thunderPunch , electric).


ability(tackle , normal).
ability(vineWhip , grass).
ability(razorLeaf , grass).
ability(solarBeam , grass).

ability(tackle , normal).
ability(waterPulse , water).
ability(aquaTail , water).
ability(bodySlam , normal).


ability(thunderPunch , electric).
ability(surf , water).
ability(grassKnot , grass).
ability(thunderbolt , electric).


ability(rainDance , water).
ability(sunnyDay , fire).
ability(bite , normal).
ability(lastResort , normal).


%Facts for the different abilities of charmander and the abilities type
monsterAbility(charmander , scratch).
monsterAbility(charmander , fireFang).
monsterAbility(charmander , firePunch).
monsterAbility(charmander , thunderPunch).


%Facts for the different abilities of bulbasaur and the abilities type
monsterAbility(bulbasaur , tackle).
monsterAbility(bulbasaur , vineWhip).
monsterAbility(bulbasaur , razorLeaf).
monsterAbility(bulbasaur , solarBeam).


%Facts for the different abilities of squirtle and the abilities type
monsterAbility(squirtle , tackle).
monsterAbility(squirtle , waterPulse).
monsterAbility(squirtle , aquaTail).
monsterAbility(squirtle , bodySlam).


%Facts for the different abilities of pikachu and the abilities type
monsterAbility(pikachu , thunderPunch).
monsterAbility(pikachu , surf).
monsterAbility(pikachu , grassKnot).
monsterAbility(pikachu , thunderbolt).


%Facts for the different abilities of eevee and the abilities type
monsterAbility(eevee , rainDance).
monsterAbility(eevee , sunnyDay).
monsterAbility(eevee , bite).
monsterAbility(eevee , lastResort).


%Facts for the effectiveness of a ability type used against a specific monster type and its effectivenss
%Facts for normal ability effectiveness
typeEffectiveness(normal,fire,ordinary).
typeEffectiveness(normal,water,ordinary).
typeEffectiveness(normal,electric,ordinary).
typeEffectiveness(normal,grass,ordinary).
typeEffectiveness(normal,normal,ordinary).

%Facts for fire ability effectiveness
typeEffectiveness(fire,fire,weak).
typeEffectiveness(fire,water,weak).
typeEffectiveness(fire,electric,ordinary).
typeEffectiveness(fire,grass,super).
typeEffectiveness(fire,normal,ordinary).

%Facts for water ability effectiveness
typeEffectiveness(water,fire,super).
typeEffectiveness(water,water,weak).
typeEffectiveness(water,electric,ordinary).
typeEffectiveness(water,grass,weak).
typeEffectiveness(water,normal,ordinary).

%Facts for electric ability effectiveness
typeEffectiveness(electric,fire,ordinary).
typeEffectiveness(electric,water,super).
typeEffectiveness(electric,electric,weak).
typeEffectiveness(electric,grass,weak).
typeEffectiveness(electric,normal,ordinary).

%Facts for grass ability effectiveness
typeEffectiveness(grass,fire,weak).
typeEffectiveness(grass,water,super).
typeEffectiveness(grass,electric,ordinary).
typeEffectiveness(grass,grass,weak).
typeEffectiveness(grass,normal,ordinary).


%abilityEffectiveness is a rules used to represent the idea that E is the
%effectiveness of an ability A against a monster M.
%I first get the type of the monster, then type of the ability and then put all 3 into the
%typeEffectiveness
abilityEffectiveness(A,M,E) :- 
    monster(M,Y) , ability(A,X), typeEffectiveness(X,Y,E).


% superAbility is a rule used represent the idea that ability A is a super
%effective ability for monster M1 to use against monster M2.
%I get the type of ability one, and type of the monster and put it into typeEffectiveness 
%however I only want the results that are super effective
superAbility(M1,A,M2) :-     
    monsterAbility(M1,A) , ability(A,X) , monster(M2,Y), typeEffectiveness(X,Y,Z) , Z = super.


% typeAbility is a rule represent the idea that ability A is an ability of
%monster M and that M and A have the same type
%I get the type of the monster and ability and compare 
typeAbility(M,A) :-
    monster(M,X), ability(A,Y), X = Y.


%moreEffectiveAbility(A1,A2,T) is a rule used to represent the idea that ability A1 is
%more effective than ability A2 against monsters of type T: ordinary is more effective than weak, and
%super is more effective than ordinary and weak.    
%I get the types of the 2 abilities and put both into typeEffectiveness against their respective
%type, I then make comparisons on the result
moreEffectiveAbility(A1,A2,T) :-
    ability(A1,X), 
    ability(A2,Y), 
    typeEffectiveness(X,T,Z), 
    typeEffectiveness(Y,T,A), 
    (Z = A -> false; A = super -> false; Z = weak -> false; true).


%determineEffectiveness is rule I created to help me determine which type effectiveness is greater
determineEffectiveness(E1,E2) :-
   ( E1 = weak -> X = 1 ; E1 = ordinary ->  X = 2 ;  E1 = super ->  X = 3 ),
   ( E2 = weak -> Y = 1 ; E2 = ordinary ->  Y = 2 ;  E2 = super ->  Y = 3 ),
   (X > Y -> true; false).


%counterAbility is a rule used to represent the idea that if monster M1
%performs ability A1 and monster M2 performs ability A2 that A2 is a more effective than A1: ordinary is
%more effective than weak, and super is more effective than ordinary and weak.
%First I get the types of both monsters, and then the types of their abilties used, I then put the results
%into the typeEffectiveness and then compare the result to see which one is greater
counterAbility(M1,A1,M2,A2) :-
    monster(M1,A),
    monster(M2,B),    
    ability(A1,C),
    ability(A2,D),   
    typeEffectiveness(C,B,X),
    typeEffectiveness(D,A,Y),    
    determineEffectiveness(Y,X).