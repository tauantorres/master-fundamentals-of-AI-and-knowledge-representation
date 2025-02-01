% ------------------------------------------
% 		Exam: 09th of June, 2023.
% ------------------------------------------

% Define filter/2: 
% filter(L1, L2).
% L2 contains all terms in L1, but whenever the term is of the type p(X),
% with a ground number Xm then it should be turn into p(Y), Y is X + 1.
% ?- filter([p(1), 3, p(4), p(X)], L2).
% L2 = [p(2), 3, p(5), p(X)] ;

% ------------------------------------------
%                Solution 01:
% ------------------------------------------
filter([], []) :- !.

filter([H|T], [H|Result]) :-
    number(H),
    filter(T, Result).

filter([H|T], [P|Result]) :-
    \+ number(H),
    add_functor(H, P), 
    filter(T, Result), !.

add_functor(Pin, Pout) :-
	Pin =.. [P, X],
    (number(X) -> Y is X + 1; Y = X ), !,
    Pout =.. [P, Y].


% ------------------------------------------
%                Solution 02:
% ------------------------------------------
filter([], []).

filter([p(X)|T], [p(Y)|R]) :-
	number(X), !,
    Y is X + 1,
    filter(T, R).

filter([H|T], [H|R]) :-
    filter(T, R).
