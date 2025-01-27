% ----------------------------
%       Terminal Code:
% ----------------------------
% swipl -s family_relationship.pl
% consult('family_relationship.pl').


% ----------------------------
%           Facts:
% ----------------------------

parent(kristina, pandora).
parent(kristina, anouk).
parent(kristina, desmond).

parent(tauan, pandora).
parent(tauan, anouk).
parent(tauan, desmond).

female(kristina).
female(pandora).
female(anouk).

male(tauan).
male(desmond).

% ----------------------------
%           Rules:
% ----------------------------

haschild(Parent) :- parent(Parent, _).
mother(Parent, Child) :- parent(Parent, Child), female(Parent).
father(Parent, Child) :- parent(Parent, Child), male(Parent).

sister(Child_01, Child_02) :- parent(Parent, Child_01), 
                            parent(Parent, Child_02),
                            female(Child_01), 
                            Child_01 \== Child_02.

brother(Child_01, Child_02) :- parent(Parent, Child_01), 
                            parent(Parent, Child_02),
                            male(Child_01), 
                            Child_01 \== Child_02.                 

all_children(Parent, ChildrenList) :-
    findall(Child, parent(Parent, Child), ChildrenList).

people(People) :-
    findall(Person, (parent(Person, _) ; parent(_, Person)), AllPeople),
    sort(AllPeople, People).
