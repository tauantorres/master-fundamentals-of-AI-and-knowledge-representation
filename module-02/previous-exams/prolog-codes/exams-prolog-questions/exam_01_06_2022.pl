

% ------------------------------------------
% 		Exam B: 1st of July, 2022.
% ------------------------------------------

p(1).
p(2).
r(1).
q(X) :- p(X).


solve(true, _, 0) :- !.


solve((A, B), Pred, Count) :-
    !,
    solve(A, Pred, CountA),
    solve(B, Pred, CountB),
    Count is CountA + CountB.

solve(Pred, Pred, Count) :-
    !,
    clause(Pred, Body),
    solve(Body, Pred, CountBody),
    Count is CountBody + 1.


solve(Goal, Pred, Count) :- 
    !,
    clause(Goal, Body),
    solve(Body, Pred, Count).
