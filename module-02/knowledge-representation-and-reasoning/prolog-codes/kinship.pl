%------------------------------------
% male/1
% male(X): X is a male
male(george).
male(spenser).
male(philip).
male(charles).
male(mark).
male(andrew).
male(edward).
male(william).
male(henry).
male(peter).
male(james).

%------------------------------------
% female/1
% female(X): X is a female
female(mum).
female(kyd).
female(elisabeth).
female(margareth).
female(diana).
female(anne).
female(sarah).
female(sophie).
female(zara).
female(beatrice).
female(eugenie).
female(louise).

%------------------------------------
% parent/2
% parent(X,Y): X is the parent of Y
parent(mum, elisabeth).
parent(george, elisabeth).
parent(mum, margareth).
parent(george, margareth).

parent(kyd, diana).
parent(spencer, diana).

parent(elisabeth, charles).
parent(philip, charles).
parent(elisabeth, anne).
parent(philip, anne).
parent(elisabeth, andrew).
parent(philip, andrew).
parent(elisabeth, edward).
parent(philip, edward).

parent(diana, william).
parent(charles, william).
parent(diana, henry).
parent(charles, henry).

parent(anne, peter).
parent(mark, peter).
parent(anne, zara).
parent(mark, zara).

parent(sarah, beatrice).
parent(andrew, beatrice).
parent(sarah, eugenie).
parent(andrew, eugenie).

parent(sophie, louise).
parent(edward, louise).
parent(sophie, james).
parent(edward, james).

%------------------------------------
% mother/2
% mother(X,Y): X is the mother of Y
mother(X,Y) :- female(X), parent(X,Y).

%------------------------------------
% father/2
% father(X,Y): X is the father of Y
father(X,Y) :- male(X), parent(X,Y).

%------------------------------------
% sibling/2
% sibling(X,Y): X is a sibling of Y.
sibling(X, Y) :-
    parent(Z, X)
    , parent(Z, Y)
    , X \== Y.

%------------------------------------
% brother/2
% brother(X,Y): X is the brother of Y
brother(X, Y) :-
    sibling(X, Y),
    male(X).

%------------------------------------
% child/2
% child(X, Y): X is the child of Y
child(X, Y) :-
    parent(Y, X).

%------------------------------------
% daughter/2
% daughter(X, Y): X is the daughter of Y
daughter(X, Y) :-
    child(X, Y)
    , female(X).

%------------------------------------
% son/2
% son(X, Y): X is the son of Y
son(X, Y) :-
    child(X, Y)
    , male(X).

%------------------------------------
% spouse/2
% spouse(X, Y): X is the spouse of Y
spouse(george, mum).
spouse(spencer, kyd).
spouse(elisabeth, philip).
spouse(diana, charles).
spouse(anne, mark).
spouse(andrew, sarah).
spouse(edward, sophie).

% a case of infinite looping when asked for all solutions:
% spouse(X, Y) :- spouse(Y, X).

% a better solution:
% spouse will be considered as lower-level predicate
% let us introduce then married/2
married(X, Y) :- spouse(X, Y).
married(X, Y) :- spouse(Y, X).