% ------------------------------------------
% 		Exam A: 17th of January, 2024.
% ------------------------------------------

% Define match/4:
% match(House, Out, HouseScore, OutScore).
% match_won_in_home(Team, ListMatchesWonIn). OK
% match_won_out_home(Team, ListMatchesWonOut).
% match_won(Team, ListAllMatchesWon).

match(fortitudo, chiusi, 72, 51).
match(fortitudo, forli, 73, 63).
match(rimini, fortitudo, 74, 82).
match(udine, fortitudo, 87, 56).


match_won_in_home(Team, L) :-
    findall(match(Team, TeamOut, In, Out), (match(Team, TeamOut, In, Out), In > Out), L).


match_won_out_home(Team, L) :-
    findall(match(TeamIn, Team, In, Out), (match(TeamIn, Team, In, Out), Out > In), L).

match_won(Team, L) :-
    append(Home, Out, L),
    match_won_in_home(Team, Home),
    match_won_out_home(Team, Out), !.

% ?- match_won(fortitudo, L).
% L = [match(fortitudo, forli, 73, 63), match(rimini, fortitudo, 74, 82), match(udine, fortitudo, 87, 56)] ;


% Knowledge Base
p :- q, r.
q :- log('In q!!!').
r :- log('In r!!!').


\* Base case: true always succeeds. *\
solve(true) :- !.

% If the goal is a conjunction (A, B), solve A first, then B.
solve((A, B)) :- 
    !, 
    solve(A), 
    solve(B).

% Special case: If the goal is log(Message), print it with "****" prefix.
solve(log(Message)) :- 
    !,
    % Exam A:
    % write('****'), write(Message), nl.
	% Exam B:
	write('++++'), write(Message), write('++++'), nl.

% General case: If there's a rule for A in the KB, fetch its body and solve it.
solve(A) :- 
    clause(A, B), 
    solve(B).