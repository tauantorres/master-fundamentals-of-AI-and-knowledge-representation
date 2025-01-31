% exam_15_01_2025.pl

% :- Start is 0, End is 0 -> Result is [].
split(_, 0, 0, []).
% :- End =:= Start -> Result is [].
split(_, Start, End, []) :- 
    Start =:= End.
% Start >= 0, End >= 0.
split(_, Start, End, _) :-
    (Start < 0; End < 0; End < Start),
    !, fail.

% Recursive case: Skip the first element until Start is 0.
split([_|T], Start, End, Result) :-
    Start > 0,
    Start1 is Start - 1,
    End1 is End - 1,
    split(T, Start1, End1, Result).

% Recursive case: Collect elements between Start and End.
split([H|T], 0, End, [H|Result]) :-
    End > 0,
    End1 is End - 1,
    split(T, 0, End1, Result).

% ---------------------------------------
%         General Solution:
% ---------------------------------------

% cut(In, Pos, Left, Right).
% If start 0 -> slice([a0, a1, a2, a3, a4], 2, L, R).
% 	L = [a0, a1].
% 	R = [a2, a3, a4].
%
% If start 1 -> slice([a1, a2, a3, a4, a5], 2, L, R).
% 	L = [a1].
% 	R = [a2, a3, a4, a5].
%

cut(X, 0, [], X).

cut([H | T], Pos, [H | L], R) :-
    Pos > 0,
    Pos1 is Pos - 1,
    cut(T, Pos1, L, R).


slice(X, Start, End, Result) :-
    cut(X, End + 1, L, _),
    cut(L, Start, _, Result).
    

/** <examples>
 
% cut([1, 2, 3, 4, 5, 6, 7, 8, 9], 6, L, R),
% cut(L, 3, L1, R1).
 
% ------------------------------------
% 		First Position = 1;
% 		End Element = False;
% ------------------------------------

cut(X, 1, [], X).

cut([H | T], Pos, [H | L], R) :-
    Pos > 1,
    Pos1 is Pos - 1,
    cut(T, Pos1, L, R).

slice(X, Start, End, Result) :-
    cut(X, End, L, _),
    cut(L, Start, _, Result).
    

% ?- slice( [1, 2, 3, 4, 5, 6, 7, 8, 9], 1, 3, Result).
% Result = [3, 4, 5].

% ------------------------------------
% 		First Position = 0;
% 		End Element = False;
% ------------------------------------

cut(X, 0, [], X).

cut([H | T], Pos, [H | L], R) :-
    Pos > 0,
    Pos1 is Pos - 1,
    cut(T, Pos1, L, R).


slice(X, Start, End, Result) :-
    cut(X, End, L, _),
    cut(L, Start, _, Result).
    
% ?- slice( [1, 2, 3, 4, 5, 6, 7, 8, 9], 3, 6, Result).
% Result = [4, 5, 6].    

% ------------------------------------
% 		First Position = 1;
% 		End Element = True;
% ------------------------------------
    
cut(X, 1, [], X).

cut([H | T], Pos, [H | L], R) :-
    Pos > 1,
    Pos1 is Pos - 1,
    cut(T, Pos1, L, R).


slice(X, Start, End, Result) :-
    cut(X, End + 1, L, _),
    cut(L, Start, _, Result).
    
% ?- slice( [1, 2, 3, 4, 5, 6, 7, 8, 9], 3, 6, Result).
% Result = [3, 4, 5, 6].   


% ------------------------------------
% 		First Position = 0;
% 		End Element = True;
% ------------------------------------

cut(X, 0, [], X).

cut([H | T], Pos, [H | L], R) :-
    Pos > 0,
    Pos1 is Pos - 1,
    cut(T, Pos1, L, R).


slice(X, Start, End, Result) :-
    cut(X, End + 1, L, _),
    cut(L, Start, _, Result).



% ?- slice( [1, 2, 3, 4, 5, 6, 7, 8, 9], 3, 6, Result).
% Result = [4, 5, 6, 7].  

*/











