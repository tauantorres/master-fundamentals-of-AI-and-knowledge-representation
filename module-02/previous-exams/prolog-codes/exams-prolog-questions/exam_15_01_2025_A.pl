% ------------------------------------------
% 		Exam A: 15th of January, 2025.
% ------------------------------------------

% Define split/4:
% split(InputList, Start, End, Result).
% - InputList: List.
% - Start, End: Integers.
% - Result: List.

% Goal:
% Given InputList, Start and End, return a sublist of elements
% whose position in the input list is from the Start to the End.

% Conditions:
% 1. The firs element of the list is in position 0.
% 2. The element in position Start should be returned.
% 3. The element in position End should NOT be returned.
% 
% Constraints:
% 1. :- Start = 0 and End = 0   -> [] 	 PASSED 
% 2. :- End =:= Start           -> []    PASSED 
% 3. :- Start < 0; End < 0      -> fail  PASSED
% 4. :- Start >= End            -> fail  PASSED
% 5. :- Start > size(InputList) -> fail  PASSED
% 
% Example:
% ?- split([1, 2, 3, 4, 5, 6, 7, 8, 9], 3, 6, Result).
% Result = [4, 5, 6]

split(_, X, X, []) :-
    write('Test 01 and 02: PASSED '),
    !.

split(_, Start, End, _) :-
	(Start < 0; End < 0), !,
    write('Test 03: PASSED '),
    fail.

split(_, Start, End, _) :-
    Start > End, !,
    write('Test 04: PASSED '),
    fail.

split(L, Start, End, _) :-
    length(L, Size),
    (Start > Size ; End > Size), !,
    write('Test 05: PASSED '),
    fail.

split([_|T], Start, End, Result) :-
    Start > 0,
    Start1 is Start - 1,
    End1 is End - 1,
    split(T, Start1, End1, Result), !.

split([H|T], 0, End, [H|Result]) :-
    End > 0,
    End1 is End - 1,
    split(T, 0, End1, Result).
    