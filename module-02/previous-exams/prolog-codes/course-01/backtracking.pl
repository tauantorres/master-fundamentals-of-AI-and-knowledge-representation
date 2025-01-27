% ----------------------------
%       Terminal Code:
% ----------------------------
% swipl -s backtracking.pl
% consult('backtracking.pl').

% ----------------------------
%       Facts:
% ----------------------------
boy(harry).
boy(ron).

girl(hermione).
girl(gini).


% ----------------------------
%       Rules:
% ----------------------------
possible_pairs(Boy, Girl) :- boy(Boy), girl(Girl).


is_integer(0).  % Base case: 0 is an integer.
is_integer(X) :- 
    X > 0,       % Check if X is positive.
    Y is X - 1,  % Decrement X to approach 0.
    is_integer(Y).  % Recursively check if Y is an integer.
is_integer(X) :- 
    X < 0,       % Check if X is negative.
    Y is X + 1,  % Increment X to approach 0.
    is_integer(Y).  % Recursively check if Y is an integer.


