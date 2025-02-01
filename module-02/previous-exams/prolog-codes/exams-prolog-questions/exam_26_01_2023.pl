% ------------------------------------------
% 		Exam: 16th of January, 2023.
% ------------------------------------------

% Define filter/3: 
% filter(L1, L2, L3).
% L3 contains the terms that appears in L1 and L2.

% ?- filter([1, 3, 4, 3], [4, 5, 3, 7, 3], L3).
% L3/[4, 3].



% ------------------------------------------
% 		        Solution 01:
% ------------------------------------------
unique([], []) :- !.

unique([H|T], R) :-
    member(H, T),
    unique(T, R), !.

unique([H|T], [H|R]) :-
    \+ member(H,T),
    unique(T, R), !.


filter([H|T], L2, [H|L3]) :-
    member(H, L2),
    filter(T, L2, L),
    unique(L, L3), !.

filter([H|T], L2, L3) :-
    \+ member(H, L2),
    filter(T, L2, L),
    unique(L, L3), !.

filter([], _, []) :- !.


% ------------------------------------------
% 		        Solution 02:
% ------------------------------------------
filter([], _, []) :- !.

filter([H | T], L2, [H|R]) :-
    member(H, L2),
    filter(T, L2, R),
    \+ member(H, R), !.

filter([_|T], L2, R) :-
	filter(T, L2, R).
    