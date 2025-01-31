% ----------------------------
%       Terminal Code:
% ----------------------------
% swipl -s cut-ex-01.pl
% consult('cut-ex-01.pl').
% ---------------------------
% 			Rules:
% ---------------------------

% ---------------------------
% 		Example 01:
% ---------------------------
max_cal(X, Y, Max) :- X >= Y, !, Max = X; Max = Y.

% ?- max_cal(200, 300, M).
% M=300


% ---------------------------
% 		Example 02:
% ---------------------------
list_member(X, [X|_]) :- !.
list_member(X, [_|T]) :- list_member(X, T).

% ?- list_member(3, [1, 2, 3, 4, 3]).
% true


% ---------------------------
% 		Example 03:
% ---------------------------
% Version 1:
% add(X, L, L1) :- \+ list_member(X, L), !, L1 = [X|L]; L1 = L.

% Version 2:
add(X, L, L) :- list_member(X, L), !.
add(X, L, [X|L]).

% ?- add(1, [2, 3, 4], L).
% L=[1, 2, 3, 4]

% ?- add(3, [2, 3, 4], L).
% L=[2, 3, 4]


% ---------------------------
% 		Example 04:
% ---------------------------
    
animal(dog).
animal(cat).
animal(elephant).
animal(tiger).
animal(cobra).
animal(python).

snake(cobra).
snake(python).

% Rules:

% Version 01:
likes(_, Animal) :- \+ snake(Animal), !, \+ fail.

% Version 02:
%likes(mary, Animal) :- snake(Animal), !, fail.
%likes(mary, Animal) :- animal(Animal).

% ?- likes(mary, dog).
% true
% 
% ?- likes(mary, python).
% false

% ---------------------------
% 		Example 05:
% ---------------------------

different(X, Y) :- X = Y, !, fail; true.

% ?- different(a, a).
% false

% ?- different(a, b).
% true


% ---------------------------
% 		Example 06:
% ---------------------------

% not(Goal) is true if Goal is not true.

not(P) :- P, !, fail; true.

% ?- not(true).
% false

% ?- not(fail).
% true


% ---------------------------
% 		Example 07:
% ---------------------------
%
% Link: https://www.youtube.com/watch?v=BvaHMEGm8po&list=PLWPirh4EWFpEYxjEJyDoqplBhJF91Mwkp&index=32&ab_channel=TutorialsPoint
% 
% 
%
% var(X)
% ?- var(X). -> true
% ?- X=5, var(X). -> false
% ?- 
%
% nonvar(X)
% atom(X)
% number(X)
% integer(X)
% float(X)
% atomic(X)
% compound(X)
% ground(X)
%
%
%% ---------------------------
% 		Example 08:
% ---------------------------
%
% ?- functor(D, data, 3), arg(1, D, 6), arg(2, D, ago), arg(3, D, 1995).
% D = data(6, ago, 1995).
%
% ?- f(a, b) =.. L.
% L = [f, a, b]
%
% ?- T =.. [lovers, tauan, kristina].
% T = lovers(tauan, kristina)
%
% ?- f(2, 3) =..[F, N|Y].
% F = f, N = 2, Y = [3]
%
% ?- f(2, 3) =..[F, N|Y], N1 is N * 3.
% F = f, N = 2, N1 = 6, Y = [3]
%
% ?- f(2, 3) =..[F, N|Y], N1 is N * 3, L =.. [F, N1|Y].
% F = f, N = 2, N1 = 6, Y = [3], L = f(6, 2).
%
%
%
%
%
%
%
%


% ---------------------------
% 	Build-in Predicates:
% ---------------------------

% member(X, L).
% findall(X, P, L).
% setof(X, P, L).
% bagof(X, P, L). 

% ---------------------------------------------
% 		Example 01: findall(X, P, L).
% ---------------------------------------------

% member(X, [X|_]).
% member(X, [_|T]) :- member(X, T).


% ?- L = [1, 2, 3, 4], findall(X, member(X, L), R).
% R = [1, 2, 3, 4]
%
% ?- L = [1, 2, 3, 4], findall(X, (member(X, L), X > 2), R).
% R = [3, 4]
%
% ?- L = [1, 2, 3, 4], findall(X/Y, (member(X, L), Y is X * X), R).
% R = [1/1, 2/4, 3/9, 4/16]


% ---------------------------------------------
% 		Example 02: setof(X, P, L).
% ---------------------------------------------

% KB:

age(peter, 27).
age(ann, 25).
age(pat, 28).
age(tom, 25).
age(ann, 25).
  
% ?- setof(Child, age(Child, Age), Children). 
%   Age = 25, Children = [ann, tom]
%   Age = 27, Children = [peter]
%   Age = 28, Children = [pat]
%   
% ?- setof(Child/Age, age(Child, Age), Children). 
% 	Children = [ann/25, pat/28, peter/27, tom/25]
%
% ?- setof(Age/Children, setof(Child, age(Child, Age), Children), AllResults).
% 	AllResults = [25/[ann, tom], 27/[peter], 28/[pat]]
% 
% ?- setof(Child, Age^age(Child, Age), Children).
% 	Children = [ann, pat, peter, tom]


% ---------------------------------------------
% 		Example 03: bagof(X, P, L).
% ---------------------------------------------

% ?- bagof(Child, age(Child, Age), Results).
% 	Age = 25, Results = [ann, tom, ann]
% 	Age = 27, Results = [peter]
% 	Age = 28, Results = [pat]


% ---------------------------------------------
% 		Example 04: Bubble Sort.
% ---------------------------------------------

bubblesort(InputList, SortedList) :-
    swap(InputList, List), !,
    printlist(List),
    bubblesort(List, SortedList).
bubblesort(SortedList, SortedList).

printlist([]) :- nl.
printlist([H | T]) :-
    write(H), write(' '), printlist(T).

swap([X, Y|List], [Y, X|List]) :- X > Y.
swap([Z|List], [Z|List1]) :- swap(List, List1).

% ?- bubblesort([8, 7, 6, 4, 5, 3, 2, 1], Result).
% 	Result = [1, 2, 3, 4, 5, 6, 7, 8]


% ---------------------------------------------
% 		Example 05: Insert Sort.
% ---------------------------------------------

insertionSort([H|List], Result) :-
    insertionSort(List, Temp),
    printlist(Temp),
    insertItem(H, Temp, Result).

insertionSort([], []).

insertItem(X, [H|List], [H|Result]) :-
    H < X, !,
    insertItem(X, List, Result).
insertItem(X, List, [X|List]).

% ?- insertionSort([2, 4, 1, 3, 5, 9, 6], Result).
% 	Result = [1, 2, 3, 4, 5, 6, 9]


% ---------------------------------------------
% 		Example 05: Quick Sort.
% ---------------------------------------------

quicksort([X|Xs], Ys) :-
    partition(Xs, X, Left, Right),
    quicksort(Left, Ls),
    quicksort(Right, Rs),
    listappend(Ls, [X|Rs], Ys).
quicksort([], []).

partition([X|Xs], Y, [X|Ls], Rs) :-
    X =< Y, partition(Xs, Y, Ls, Rs).
partition([X|Xs], Y, Ls, [X|Rs]) :-
    X > Y, partition(Xs, Y, Ls, Rs).
partition([], _, [], []).

listappend([], Ys, Ys).
listappend([X|Xs], Ys, [X|Zs]) :- listappend(Xs, Ys, Zs).


% Link Tree Data Structure: https://www.youtube.com/watch?v=6ms0ZD1jMYY&list=PLWPirh4EWFpEYxjEJyDoqplBhJF91Mwkp&index=42&ab_channel=TutorialsPoint



% append(List1, List2, Result) → Concatenates lists
% length(List, N) → Returns the length of a list
% member(Element, List) → Checks if an element is in the list
% select(Element, List, Result) → Removes an element from a list
% reverse(List, ReversedList) → Reverses a list
% nth0(Index, List, Element) → Gets element at index (0-based)
% nth1(Index, List, Element) → Gets element at index (1-based)








































              







    
    