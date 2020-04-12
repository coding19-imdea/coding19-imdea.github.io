def merge(L,M,i):
	l=len(L)
	m=len(M)
	if l==0:
		return M
	else:
		N=[]
		while L!=[] and M!=[]:
			if L[0][i]<M[0][i]:
				a=L.pop(0)
				N.append(a)
			else:
				a=M.pop(0)
				N.append(a)
		if L==[]:
			N=N+M
		elif M==[]:
			N=N+L
		return N

def mergesort(L,i):
	l=len(L)
	if l==1:
		return L
	else:
		u=l//2
		M=L[:u]
		N=L[u:]
		Ms=mergesort(M,i)
		Ns=mergesort(N,i)
		R=merge(Ms,Ns,i)
		return R	

def breedtoint(breed):
	if breed=='S':
		return 1
	else:
		return -1

def burst(M):
	m=0
	burststart=M[0][0]
	burstend=M[0][0]
	s=M[0][1]
	for i in range(1,len(M)-1):
		if M[i][1]!=s:
			if burstend-burststart>m:
				m=burstend-burststart			
			burstend=M[i-1][0]
			burststart=M[i][0]
	if M[len(M)-1][1]==s and M[len(M)-1][0]-burststart>m:
		m=M[len(M)-1][0]-burststart
				
	return m


db=open('p14-input.txt')

try:
	cows=db.readlines()
	c=len(cows)
	C=[]
	positions=[]
	for i in range(1,c):
		d=cows[i].split()
		b=breedtoint(d[1])		
		e=[int(d[0]),b]
		C.append(e)
				
	sortedcows=mergesort(C,0)
	same=burst(sortedcows)	
	s=0
	
	l=len(sortedcows)
	maximum=-1
	minimum=0
	sortedcows[0].append(0)
	sortedcows[0].append(0)
	u=sortedcows[1][0]
	sortedcows[0].append(u)
	
	for i in range(len(sortedcows)):
		s+=sortedcows[i][1]
		sortedcows[i].append(s)
		if s>maximum:
			maximum=s
			sortedcows[i].append(s)
		elif s<minimum:
			minimum=s
			sortedcows[i].append(s)
		else:
			sortedcows[i].append(0)
		
			
	maxreverse=sortedcows[len(sortedcows)-1][2]
	minreverse=sortedcows[len(sortedcows)-1][2]+1
	for i in range(len(sortedcows)-1,-1,-1):
		a=sortedcows[i][2]
		
		if a>maxreverse:
			maxreverse=a
			sortedcows[i].append(a)
		elif a<minreverse:
			minreverse=a
			sortedcows[i].append(a)
		else:
			sortedcows[i].append(0)
	for i in range(1,len(sortedcows)-1):
		u=sortedcows[i+1][0]
		sortedcows[i].append(u)
		

	
	for i in range(len(sortedcows)-1,-1,-1):
		if sortedcows[i][3]-sortedcows[i][4]==0:
			del sortedcows[i]
	
	nsortedcows=mergesort(sortedcows,2)
	
	

	result=0
	l=len(nsortedcows)
	i=0	
	posresult=0
	for i in range(l-1):
		if nsortedcows[i][2]==nsortedcows[i+1][2]:
			if nsortedcows[i][0]<nsortedcows[i+1][0]:
				m=nsortedcows[i+1][0]-nsortedcows[i][5]
			else:
				m=nsortedcows[i][0]-nsortedcows[i+1][5]			
			if m>result:
				result=m
		
		
	if result>same:
		print 'Result:', result
	else:
		print 'Result:', same

	

	
finally:
	db.close()

