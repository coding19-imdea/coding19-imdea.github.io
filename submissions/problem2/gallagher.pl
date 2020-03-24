:- module(coins,_).

main :-
	bagof(L, gen(L), Sols),
	length(Sols,N),
	write('Number of solutions = '),
	write(N),
	nl.	
	
gen([N200,N100,N50,N20,N10,N5,N2,N1]) :-
	member(N200,[1,0]),
	member(N100,[2,1,0]),
	N200*200 + N100*100 =< 200,
	member(N50,[4,3,2,1,0]),
	N200*200 + N100*100 + N50*50 =< 200,
	nlist(10,L20),member(N20,L20),
	N200*200 + N100*100 + N50*50 + N20*20 =< 200,
	nlist(20,L10),member(N10,L10),
	N200*200 + N100*100 + N50*50 + N20*20 + N10*10 =< 200,
	nlist(40,L5),member(N5,L5),
	N200*200 + N100*100 + N50*50 + N20*20 + N10*10 + N5*5 =< 200,
	nlist(100,L2),member(N2,L2),
	N200*200 + N100*100 + N50*50 + N20*20 + N10*10 + N5*5 + N2*2 =< 200,
	nlist(200,L1),member(N1,L1),
	200 is N200*200+N100*100+N50*50+N20*20+N10*10+N5*5+N2*2+N1.
	
nlist(0,[0]).
nlist(N,[N|Ns]) :-
	N>0,
	N1 is N-1,
	nlist(N1,Ns).
	
