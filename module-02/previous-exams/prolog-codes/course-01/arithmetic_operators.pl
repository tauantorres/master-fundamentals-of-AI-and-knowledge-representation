% ----------------------------
%       Terminal Code:
% ----------------------------
% swipl -s arithmetic_operators.pl
% consult('arithmetic_operators.pl').

% ----------------------------
%       Queries:
% ----------------------------
% density(china, X).


% ----------------------------
%           Facts:
% ----------------------------

% 1. Population:
population(china, 100).
population(india, 85).
population(usa, 30).
population(germany, 9).

% 2. Area:
area(china, 10).
area(india, 4).
area(usa, 12).
area(germany, 2).

% ----------------------------
%           Rules:
% ----------------------------

density(Country, Density_value) :- population(Country, Population_value),
                                    area(Country, Area_value),
                                    Density_value is Population_value / Area_value.


