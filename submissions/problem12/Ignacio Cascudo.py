#My Python code is next, but after the code I explain an alternative ``more algebraic'' way of solving it with little computation, based on a solution for a similar problem that I developed in one article of mine.

import itertools

def consecutivefive(w):
	if sum(w[j] for j in range(5))>2:
		return 0
	else:
		return 1

def transitions(v):
	s=v[1:]
	t=s[:]	
	w=s[:]
	t.append(0)	
	l=[]
	l.append(t)
	w.append(1)
	if consecutivefive(w):
		l.append(w)
	return l

def endtransitions(v,i,b):
	s=v[1:]
	t=s[:]
	w=s[:]
	t.append(0)	
	l=[]
	l.append(t)
	w.append(1)
	flag=1
	if consecutivefive(w):
		for j in range(i+1):
			S=sum (w[k] for k in range(5-j-1,5))+ sum(b[k] for k in range(i-j+1)) 
			if S>2: 
				flag=0
				break
		if flag==1:
			l.append(w)
	return l
		
def count(M,startfive,end,i,S,L):
	T=S	
	newL=L[:]
	final=[]	
	if i<end-4:
		l=transitions(M)
		for v in l:
			nnewL=[]
			for mem in newL:
				memn=mem[:]
				memn.append(v[4])
				nnewL.append(memn)
			[a,H]=count(v,startfive,end,i+1,T,nnewL)
			S+=a
			final=final+H
	elif i<end:
		l=endtransitions(M,i-(end-4),startfive)
		for v in l:
			nnewL=[]
			for mem in newL:
				memn=mem[:]
				memn.append(v[4])
				nnewL.append(memn)
			[a,H]=count(v,startfive,end,i+1,T,nnewL)
			S+=a
			final=final+H	
	else:
		S+=1
		final=newL
	
	return S, final	


def rot_orbit(v):
	flag=1
	l=set()
	i=1
	w=v[:]
	while flag:
		w.append(w[0])
		del w[0]
		if w[:]==v[:]:
			flag=0
		else:
			u=w[:]			
			l.add(tuple(u))
		
	return l

end=21
numbers=[list(seq) for seq in itertools.product([0,1], repeat=5)]

numberstemp=numbers[:]
for M in numberstemp:
	if consecutivefive(M)==0:
		numbers.remove(M)
		
u=0
totallist=[]
for M in numbers:
	H=M[:]
	[a,L]=count(M,M,end,5,0,[H])
	totallist=totallist+L
	u+=a

totalorbits=set()
for s in totallist:
	orbits=rot_orbit(s)
	if (set(orbits) & totalorbits)==set():
		totalorbits.add(tuple(s))
	       
print 'Result:', len(totalorbits)

#
#

#ALTERNATIVE WAY
#In a paper of mine, for certain reasons I needed to compute the number of sequences with the restrictions of this exercise, but where rotations count as different solutions, instead of the same. The approach is explained in https://arxiv.org/abs/1703.01267 section 5.2 where for this exercise s=5, m=2, and results are in section 6.2. The idea is to represent the problem as a directed graph (a finite automata), where the nodes are the allowed sequences of 5 values (all sequences of 5-bits with at most 2 ones) and the transitions represent moving one position to the right in the collar (i.e. you for example can go from 10010 to 00100 or to 00101). Then a 21-pearl collar is a closed walk of length 21 (after 21 steps you are in the same node). If A is the incidence matrix of the graph, then the number of closed walks is the trace of A^21. But it turns out that using a theorem in linear algebra (Cayley-Hamilton) you can relate the traces of succesive powers of A by some polynomial equation. This gives a recurrence for the number of n-pearl collars in terms of the number of (n-1)-pearl,...,(n-t)-pearl collars for some t. In factin the paper I make an optimization of this argument by using a graph where nodes are 4-bit sequences instead of 5-bit, and including the at most "2 black pearls" condition in the construciton of the edges too. Eventually after some computation, itturns out t=10  in this case, and the recurrence is given by http://oeis.org/A293344 where someone has computed the 1000 first values http://oeis.org/A293344/b293344.txt . For n=21, this is 25820, which is the value of u in my code.
#Then in order to include the rotation-equivalent condition one can use a very cute theorem in group theory called Burnside's lemma, see https://en.wikipedia.org/wiki/Burnside's_lemma where X is the set of 25820 possible collars when rotations are not considered equivalent, and G is the group of 21 rotations (shifts by g positions for g=0,...,20). One can then compute the number of "orbits" (which is just the solution we are looking for, the number of rotation-equivalent collars). For that one needs to calculate the values X^g that are the number of collars that are fixed by a g-shift. For g=0 this is all collars. For g coprime with 21, this is only the all-white collar. For g non-coprime with 21, there are only certain collars, for g=3,6,9,12,15,18, it is all collars of the form abcabcabcabcabcabcabc that satisfy the color condition, everything with regexp (000|001|010|100){7}. For g=7,14, it is all collars of the form abcdefgabcdefgabcdefg satsifying the condition. It turns out that one can easily count the number of those as the value for n=7 in the non-rotational-equivalent problem. Finally apply the Burnside formula one obtains the amusing result 1234.


