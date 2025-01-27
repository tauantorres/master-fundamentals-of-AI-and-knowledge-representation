% ----------------------------
%       Terminal Code:
% ----------------------------
% swipl -s facts_rules_queries.pl
% consult('facts_rules_queries.pl').



% ----------------------------
%       Facts:
% ----------------------------

% teaches(Professor, Course_id)

teaches(milano, faikr1).
teaches(chesani, faikr2).
teaches(torroni, faikr3).

% student(Student, Course_id)

studies(tauan, faikr1).
studies(tauan, faikr2).
studies(tauan, faikr3).

studies(kristina, faikr1).
studies(kristina, faikr3).

studies(anouk, faikr2).
studies(anouk, faikr3).

% ----------------------------
%       Rules:
% ----------------------------
guide(Professor, Student) :- 
                    teaches(Professor, Course_id), 
                    studies(Student, Course_id).