% ------------------------------------------
% 		Exam: 2nd of September, 2022.
% ------------------------------------------

% Define: solve(Goal) 

% KB:
p(1) :- write('I am solving P.').
r(1) :- write('I am solving R.').
q(X) :- p(X), r(X).


% ------------------------------------------
%                Solution 01: Chesani
% ------------------------------------------

solve(true) :- !.
solve(write(X)) :- !, call(write(X)), nl.
solve( (A,B) ) :- !, solve(B), solve(A).
solve(A) :- clause(A, B), solve(B).

% ?- solve(q(X)).
% I am solving P.
% I am solving R.
% X = 1 ;

