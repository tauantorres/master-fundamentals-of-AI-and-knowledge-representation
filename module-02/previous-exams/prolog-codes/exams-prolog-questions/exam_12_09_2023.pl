% ------------------------------------------
% 		Exam: 12th of September, 2023.
% ------------------------------------------

% KB:
% parent(francesco, federico).
% francesco is the son of federico
%
% Define people/1: 
% people(People).
% People: List of people mentionated in the KB (NO REPETIONS)

parent(francesco, federico).
parent(chiara, federico).
parent(francesco, elena).


% Solution 01:
unique([H|T], Result) :-
    member(H, T),
    unique(T, Result), !.

unique([H|T], [H|Result]) :-
    \+ member(H, T),
    unique(T, Result), !.

unique([], []) :- !.

people(People) :-
    append(Parents, Children, AllPeople),
	findall(Parent, parent(_, Parent), Children),
    findall(Child, parent(Child, _), Parents), !,
    unique(AllPeople, People).


% Solution 02:
people(People) :-
	findall(Person, (parent(Person, _) ; parent(_, Person)), AllPeople),
    sort(AllPeople, People).


% Solution 03:
people(People) :-
	setof(Person, X^Y^(parent(X, Y), (X = Person ; Y = Person)), People).


% L = [francesco, chiara, francesco, federico, federico, elena],
% unique(L, Result).