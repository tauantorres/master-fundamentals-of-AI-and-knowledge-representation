% swipl
% consult('facts.pl').
% IF == ':-'

% Facts:
mother(kristina, pandora).
mother(kristina, anouk).
mother(kristina, desmond).

father(tauan, pandora).
father(tauan, anouk).
father(tauan, desmond).

female(kristina).
female(pandora).
female(anouk).

male(tauan).
male(desmond).

% Rules:
parents(M, F, C) :- mother(M, C), father(F, C).
is_sister(X, Y) :- female(X), parents(M, F, X), parents(M, F, Y).
