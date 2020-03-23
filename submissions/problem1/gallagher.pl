:- module(sierpinski,_).

main([M]) :-
	atom_number(M,N),
	checkArg(N).
	
checkArg(N) :-
	(N > 5; N < 0), write('N should be between 0 and 5 inclusive').
checkArg(N) :-
	N >= 0, N =< 5,
	height(N,H),
	initState(S),
	sierpinski(31,H,S).
	
sierpinski(K,H,S) :-
	K >= 0, 
	writeState(S,user_output),
	generate(K,H,S,S1),
	K1 is K-1,
	sierpinski(K1,H,S1).
sierpinski(K,_,_) :-
	K < 0.

generate(K,H,S,S1) :-
	0 is mod(K,H),
	reinitState(0,S,S1).
generate(K,H,S,S1) :-
	J is mod(K,H),
	J > 0,
	nextState(0,S,S1).
	
nextState(L,[Me,R|S],[Me1,R1|S1]) :-
	rule(L,Me,R,Me1),
	nextState(Me,[R|S],[R1|S1]).
nextState(_,[Me],[Me]).

reinitState(L,[Me,R|S],[Me1,R1|S1]) :-
	initRule(L,Me,R,Me1),
	reinitState(Me,[R|S],[R1|S1]).
reinitState(_,[Me],[Me]).
	
% 1-d cellular automata rules

rule(0,0,0,0).
rule(0,0,1,1).
rule(0,1,0,1).
rule(0,1,1,1).
rule(1,0,0,1).
rule(1,0,1,0). 	
rule(1,1,0,1).
rule(1,1,1,1).

initRule(0,0,0,0).
initRule(0,0,1,1).
initRule(0,1,0,0).
initRule(0,1,1,0).
initRule(1,0,0,1).
initRule(1,0,1,0). 	
initRule(1,1,0,0).
initRule(1,1,1,0).

height(N,H) :-
	H is 32 // truncate(2**N).
	
initState([0|S]) :-
	makeState(2,32,S,[]).
	
makeState(0,_,S,S).
makeState(M,W,S0,S2) :-
	M > 0,
	Toggle is mod(M,2),
	makeSegment(W,Toggle,S0,S1),
	M1 is M-1,
	makeState(M1,W,S1,S2).

makeSegment(1,0,[1|S],S).
makeSegment(1,1,[0|S],S).
makeSegment(W,Toggle,[0|S0],S1) :-
	W > 1,
	W1 is W-1,
	makeSegment(W1,Toggle,S0,S1).

writeState([_|St],S) :-
	writeState1(St,S).
	
writeState1([0,C|St],S) :-	
	write(S,'_'),
	writeState1([C|St],S).
writeState1([1,C|St],S) :-	
	write(S,'1'),
	writeState1([C|St],S).
writeState1([_],S) :-
	nl(S).
	
	
	
