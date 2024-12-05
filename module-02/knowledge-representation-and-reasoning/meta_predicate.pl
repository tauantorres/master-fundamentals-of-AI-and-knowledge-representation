:- consult(kinship).
% alternatively, :- [kinship]. would do the same.


% numOfChildren/2
% numOfChildren(X, Num): Num is the number of known children of X in the current kb
numOfChildren(X, Num) :-
    findall(Child, parent(X, Child), ListOfChildren)
    , length(ListOfChildren, Num).

%--------------------------------------

% offSprings/2
% offSprings(X, Offsprings): Offsprings is the list of offsprings of X
% works with X a term indicating a person, or with X a list of term indicating persons
offSprings([], []) :- !.
offSprings([X| Tail], Offsprings) :-
    !
    , findall(Y, parent(X, Y), Partial)
    , offSprings(Tail, Remaining)
    , append(Partial, Remaining, DirectOffsprings)
    , offSprings(DirectOffsprings, FurtherOffsprings)
    , append(DirectOffsprings, FurtherOffsprings, Offsprings).
% The following is just syntactic sugar:
offSprings(X, Offsprings) :-
    offSprings([X], Offsprings).
% Notice that cuts are not really needed: they do not cut out any "unwanted" solution;
% rather, they simply avoid to explore useless branches.
