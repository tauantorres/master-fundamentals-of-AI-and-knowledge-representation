% ----------------------------
%       Terminal Code:
% ----------------------------
% swipl -s list.pl
% consult('list.pl').
% NOT == '\+'

% ----------------------------
%       Rules:
% ----------------------------

% Membership Problem:
member(X, [X | _]).                  % 1. X is a member of a list if X is the head of the list
member(X, [_ | T]) :- member(X, T).  % 2. X is a member of a list if X is a member of the tail of the list


% Size of a list:
size([], 0).
size([_ | T], N) :- size(T, Nt), N is Nt + 1.

% Sum of a list:
sum_list([], 0).
sum_list([H | T], N) :- sum_list(T, Nt), N is Nt + H.


% Check if a list is sorted:
is_sorted([]).
is_sorted([_]).
is_sorted([X, Y|T]) :- X =< Y, is_sorted([Y | T]).


% Concatenations of Lists:
concatenation([], L2, L2).
concatenation([H | T], L2, [H | L3]) :- concatenation(T, L2, L3).


% Union of Lists:
union([H | T], L2, L3) :- 
            member(H, L2), 
            union(T, L2, L3).

union([H | T], L2, [H | L3]) :- 
            \+ member(H, L2), 
            union(T, L2, L3).

union([], L2, L2).


% Intersection of Lists:
intersection([H | T], Y, [H | Z]) :-
			member(H, Y), 
            intersection(T, Y, Z).

intersection([H | T], Y, Z) :-
    		\+ member(H, Y), 
            intersection(T, Y, Z).
intersection([], _, []).

% Sort a list:
split([], [], []).
split([X], [X], []).
split([X, Y | T], [X | L1], [Y | L2]) :-
    split(T, L1, L2).
   

merge([], L, L).
merge(L, [], L).
merge([H1 | T1], [H2 | T2], [H1 | T]) :-
    H1 =< H2,
    merge(T1, [H2 | T2], T).
merge([H1 | T1], [H2 | T2], [H2 | T]) :-
    H1 > H2,
    merge([H1 | T1], T2, T).


merge_sort([], []).
merge_sort([X], [X]).
merge_sort(L, SL) :-
    split(L, L1, L2),          % Split the list into two halves
    merge_sort(L1, SL1),       % Sort the first half
    merge_sort(L2, SL2),       % Sort the second half
    merge(SL1, SL2, SL).       % Merge the sorted halves
