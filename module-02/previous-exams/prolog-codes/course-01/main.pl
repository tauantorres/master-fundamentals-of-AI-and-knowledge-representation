% swipl
% consult('main.pl').
% main.pl - A simple Prolog program

% Define some facts
parent(john, mary).
parent(mary, alice).

% Define a rule
grandparent(X, Y) :- parent(X, Z), parent(Z, Y).

% Test query
main :- 
    grandparent(john, alice),
    write('John is a grandparent of Alice!'), nl.
