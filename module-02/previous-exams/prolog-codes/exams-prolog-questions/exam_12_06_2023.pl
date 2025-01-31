% ------------------------------------------
% 		Exam: 12th of June, 2023.
% ------------------------------------------

% KB:
% parent(francesco, federico).
% francesco is the son of federico
%
% Define filter/3: 
% filter(L1, L2, L3).
% L3 contains the terms of L1 that appears strictly more than once in L2.


equal(X, Y) :- X == Y.
    
count(X, [H|T], N) :-
    equal(X, H),
    count(X, T, N1),
    N is N1 + 1, !.

count(X, [H|T], N) :-
    \+ equal(X, H),
    count(X, T, N), !.

count(_, [], 0) :- !.


filter([H| T], L2, [H|L3]) :-
    count(H, L2, N),
    N > 1,
    filter(T, L2, L3), !.


filter([H|T], L2, L3) :-
    count(H, L2, N),
    N =< 1,
    filter(T, L2, L3).

filter([], _, []) :- !.

% ?- filter( [a, 3, b], [a, a, p(X), 3], L3).
% L3 = [a, 3] ;