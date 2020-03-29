

#Strategy: define a list of right neighbours, ordered pairs of wormholes such that if you walk from the first one to the right, you get to the second one. This defines a directed graph G. Given a pairing (or perfect matching) M, I compute the products of the incidence matrices. This gives the graph representing a walk from a wormhole to another one plus a teleportation. Then I compute the diagonal of the transitive closure of that graph, which represents from which wormholes I can come back to the same wormhole after a number of steps walk+teleportation. If that diagonal has a 1, it means there is a cycle.
	

#ELEMENTARY VECTOR AND MATRIX OPERATIONS

def vectoror(v,w): #Componentwise OR of vectors
	r=[]
	for i in range(len(v)):
		r.append(v[i]+w[i]-v[i]*w[i])
	return r

def innerprodor(v,w): #Inner product of vectors where sum is OR
	r=0
	for i in range(len(v)):
		r+=v[i]*w[i]*(1-r)
	return r

def transpose (M): #Transpose of a matrix
	T=[]
	for i in range(len(M)):
		v=[]
		for j in range(len(M)):
			v.append(M[j][i])
		T.append(v)
	return T

def matrixprodor(A,B): #Product of matrices where sum is OR
	M=[]
	B=transpose(B)	
	n=len(A)
	for i in range(n):
		row=[]
		for j in range(n):
			row.append(innerprodor(A[i],B[j]))
		M.append(row)
	return M

def diag(A): #Diagonal of a matrix
	v=[]
	for i in range(len(A)):
		v.append(A[i][i])
	return v

def diag_transitive_closure(G,m): #Computes the diagonal of the transitive closure
	G_pot=G[:]
	d=diag(G)
	for i in range(m+1):
		G_pot=matrixprodor(G_pot,G)
		d=vectoror(d, diag(G_pot))		
	return d


#GRAPH BUILDING AND COMPUTING

def rightwormhole(point, whl): #Outputs index of closest wormhole to right of point
	x=1000000000
	result=None
	
	for l in (whl):
		if l[1]==point[1] and l[0]>point[0] and l[0]<x:
			x=l[0]
			result=whl.index(l)
	return result

def rightneighbour(whl): #Outputs incidency matrix of graph of closest wormhole to right of other wormhole.
	rng=[]
	edge = lambda i: rightwormhole(whl[i], whl)
	for i in range(len(whl)):
		row=[]
		for j in range(len(whl)):
			if edge(i)==j:
				row.append(1)
			else:
				row.append(0)
		rng.append(row)
	return rng


def cycle_completion (rng,M,n): #Given incidence matrices rng and M of two graphs, computes whether one has a cycle consisting of steps where 					#in each step we first apply rng and then M 
	G=matrixprodor(rng,M)
	d=diag_transitive_closure(G,n)
	return innerprodor(d,d)


def pairingperm(L): 	#Finds all perfect matchings. Output is two lists: one containing all matchings represented by edges (only used for 				#recursion); the other containing all matchings represented by incidence matrices 
	n=len(L)
	if n==0:
		return [[]], [[]]
	else:
		listperm=[]
		listmat=[]
		i=0
		for j in range(1,n):
			temp=L[:]			
			a=temp[i]
			b=temp[j]
			del temp[j]			
			del temp[i]
			[sh, mat]=pairingperm(temp)
			for l in sh:
				l.append([a,b])
			for M in mat:
				for k in range(len(M)):
					M[k].insert(i,0)
					M[k].insert(j,0)
				rowi=[]
				rowj=[]				
				for r in range(len (M)+2):
					if r==i:
						rowj.append(1)
						rowi.append(0)
					elif r==j:
						rowi.append(1)
						rowj.append(0)
					else:
						rowi.append(0)
						rowj.append(0)
				M.insert(i,rowi)
				M.insert(j,rowj)
			listperm=listperm+sh
			listmat=listmat+mat
	return	listperm, listmat		


#FILE READING AND COMPUTING 

def parse(data): #Read data
	whl=[]
	n=int(data[0])
	for i in range(1, n+1):
		s=data[i].split()
		whl.append([int(s[0]), int(s[1])])
	return whl, n

def fromfile(filename): #Computes number of matchings for a specific input file
	database = open(filename)
	try:
		data=database.readlines()
		[whl, n]=parse(data)
		rng=rightneighbour(whl)
		matchings=pairingperm(range(n))[1]
		counter=0
		for M in matchings:
			counter+=cycle_completion(rng,M,n)
		
	finally:
		database.close()
	return counter


#Result (main)

rone=fromfile('problem5-input1.in')
rtwo=fromfile('problem5-input2.in')
print 'Sol. to file 1:', rone, 'Sol. to file 2:', rtwo, 'Sum:', rone+rtwo 

