% ----------------------------
%       Terminal Code:
% ----------------------------
% swipl -s structures.pl
% consult('structures.pl').

% ----------------------------
%       Queries:
% ----------------------------
% owns(tauan, book(_, author(_, assis))). // Returns {true, false} whether Person owns a book written am Author with Surname == assis;
% owns(tauan, book(Book, author(Name, assis))). // Returns {Book_Name, Author_Name} of all books own by a Person with Surname == assis;
% owns(tauan, book(Book, author(Name, Surname))). // Returns {Book_Name, Author_Name, Author_Surname} of all books own by a Person with those parameters;

% ----------------------------
%       Facts:
% ----------------------------

% Author:
author(machado, assis).
author(jose, alencar).

% Books:
book(helena, author(machado, assis)).
book(o_alienista, author(machado, assis)).
book(dom_casmurro, author(machado, assis)).

book(iracema, author(jose, alencar)).
book(senhora, author(jose, alencar)).
book(o_guarani, author(jose, alencar)).

% Owns:
owns(tauan, book(dom_casmurro, author(machado, assis))).
owns(tauan, book(o_guarani, author(jose, alencar))).



