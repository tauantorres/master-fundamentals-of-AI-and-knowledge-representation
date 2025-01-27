% ----------------------------
%       Terminal Code:
% ----------------------------
% swipl -s operator_precedence.pl
% consult('operator_precedence.pl').

% ----------------------------
%       Test Queries:
% ----------------------------

operator_precedence :-
    Result is 2 + (8 / 2) * 3,
    write('Result: '),
    write(Result),
    nl.
    Result2 is (2 + 8) / (2 * 3),
    write('Result2: '), 
    write(Result2),
    nl.
