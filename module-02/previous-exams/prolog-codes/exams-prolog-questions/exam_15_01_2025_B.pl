% ------------------------------------------
% 		Exam B: 15th of January, 2025.
% ------------------------------------------

% Define slice/4
% slice(InputList, Start, End, Result).
% - InputList: List.
% - Start, End: Integers.
% - Result: List.

% Goal:
% Given InputList, Start and End, return a sublist of elements
% whose position in the input list is from the Start to the End.

% Conditions:
% 1. The firs element of the list is in position 1.
% 2. The element in position Start should be returned.
% 3. The element in position End should NOT be returned.
% 
% Constraints:
% 1. :- Start = 1 and End = 1 -> [] 	 PASSED
% 2. :- End == Start -> [] 				 PASSED
% 3. :- Start < 0; End < 0 -> fail 	     PASSED
% 4. :- Start> End -> fail 				 PASSED
% 5. :- Start > size(InputList) -> fail  PASSED
% 
% Example:
% ?- slice([1, 2, 3, 4, 5, 6, 7, 8, 9], 3, 6, Result).
% Result = [3, 4, 5]

slice(_, 1, 1, []):- 
    write('Test 01: PASSED '), !.

slice(_, X, X, []) :- 
    write('Test 02: PASSED '), !.

slice(_, Start, End, []) :-
    (Start < 1; End < 1), !,
    write('Test 03: PASSED '),
    fail.

slice(_, Start, End, _) :-
    Start > End, !,
    write('Test 04: PASSED '),
    fail.

slice(L, Start, End, _) :-
    length(L, L_size),
    (Start > L_size ; End > L_size), !,
    write('Test 05: PASSED '),
    fail.
    

slice([_|T], Start, End, Result) :-
    Start > 1, % ListStartPos is 1.
	Start1 is Start - 1,
    End1 is End -1,
    slice(T, Start1, End1, Result), !.

slice([H|T], 1, End, [H|Result]) :-
    End > 1,
    End1 is End - 1,
    slice(T, 1, End1, Result).











