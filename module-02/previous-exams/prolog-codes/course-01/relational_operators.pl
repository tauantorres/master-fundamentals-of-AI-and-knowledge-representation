% ----------------------------
%       Terminal Code:
% ----------------------------
% swipl -s relational_operators.pl
% consult('relational_operators.pl').

% ----------------------------
%           Facts:
% ----------------------------

have_been_in_time(jonas, 2019, 2022).
have_been_in_time(jonas, 2053, 2054).
have_been_in_time(jonas, 1920, 1921).

have_been_in_time(martha, 2019, 2020).
have_been_in_time(martha, 1880, 1881).
have_been_in_time(martha, 2021, 2054).

traveled(Person, Year) :- have_been_in_time(Person, From_Year, To_Year),
                            Year >= From_Year,
                            Year =< To_Year.
