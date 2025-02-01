% ------------------------------------------
% 		Exam: 21th of December, 2022.
% ------------------------------------------

% Define: inOddPosition/2 
% filter(L1, L2).
% L2 contains the terms of L1 that appears in odd positions.

% ?- inOddPosition([2, 4, 6, 8, 10, 12], X).
% X = [2, 6, 10].

% ?- inOddPosition([], X).
% X = []

% ?- inOddPosition([42], X).
% X = [42]

% ?- inOddPosition([1, 2, 3], X).
% X = [1, 3]

% ?- inOddPosition([1, 2, 3], [1]).
% X = no

% ------------------------------------------
% 		        Solution 01:
% ------------------------------------------

keep_pass([], _, []). :- !.

keep_pass([H|T], 1, [H|R]) :-
    keep_pass(T, 0, R), !.

keep_pass([_|T], 0, R) :-
    keep_pass(T, 1, R).


inOddPosition([], []) :- !.

inOddPosition(_, X) :-
    is_list(X), !, fail.

inOddPosition(L, X) :- 
   keep_pass(L, 1, X), !.
	
% ------------------------------------------
% 		        Solution 02: (Chesani)
% ------------------------------------------

inOddPosition([], []).

inOddPosition([X], [X]).

inOddPosition([X, _|T], [X|Rest]) :- 
   inOddPosition(T, Rest).
	
% This Solution fails for the following query:

% ?- inOddPosition([1], [X]).
% X = 1 ;

% ?- inOddPosition([X], [X]).
% true ;

