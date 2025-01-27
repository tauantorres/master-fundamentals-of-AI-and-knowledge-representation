% swipl
% consult('conjuctions.pl').
% AND == ',', OR == ';'

% Queries:
% likes(mary, john), likes(john, mary).
% likes(mary, X), likes(john, X).


% Facts about Mary:
likes(mary, chocolate).
likes(mary, wine).
likes(mary, burguer).

% Facts about John:
likes(john, wine).
likes(john, mary).
likes(john, burguer).