:- module(passcode,_).

:- use_module(library(iso_char)). 
:- use_module(library(stream_utils)). 

main :-
	iterate(N,6),
	getTries(Tries),
	try(N,Tries,PassCode),
	!,
	write('Length of shortest passcode is '),
	write(N),
	write(' with passcode '),
	write(PassCode),
	nl.

insert([X,Y,Z],PassCode) :-
	append(List3,[Z|_],PassCode),
	append(List2,[Y|_],List3),
	append(_,[X|_],List2).
	
try(N,Tries,PassCode) :-
	length(PassCode,N),
	insertAll(Tries,PassCode).
	
insertAll([Try|Tries],PassCode) :-
	insert(Try,PassCode),
	insertAll(Tries,PassCode).
insertAll([],_).

iterate(N,N).
iterate(N,L) :-
	L1 is L+1,
	iterate(N,L1).
	

% read from the file

getTries(Tries) :-
	open('keylog.txt',read,S),
	get_line(S,Line),
	readLines(S,Line,Tries),
	close(S).
	
readLines(_,end_of_file,[]) :-
	!.
readLines(S,Line,[[X,Y,Z]|Tries]) :-
	decodeLine(Line,X,Y,Z),
	get_line(S,Line1),
	readLines(S,Line1,Tries).
	
decodeLine([C1,C2,C3],X,Y,Z) :-
	char_codes([X,Y,Z],[C1,C2,C3]).
	
