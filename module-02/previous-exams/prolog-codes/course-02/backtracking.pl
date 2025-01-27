
% ----------------------------
%       Terminal Code:
% ----------------------------
% swipl -s backtracking.pl
% consult('backtracking.pl').


f(X, 0) :- X < 3, !.
f(X, 2) :- 3 =< X, X < 6, !.
f(X, 4) :- 6 =< X. 