def reverse(v):
	return v[-1::-1]

def flip(v,t):
	if t==1:
		return reverse(v)
	else:
		wtop=v[:-t+1]
		wbottom=v[-t+1:]
		return (reverse(wtop)+wbottom)

def disordered(v):
	l=len(v)
	i=-1
	j=-2
	while (v[i]>v[j]):
		i-=1
		j-=1
		if -j>l:
			return 0
	return -i

def max(v):
	s=0
	j=0
	if len(v)==0:
		return 0
	for i in range(len (v)):	
		if v[i]>s:
			s=v[i]
			j=i
	return (len(v)-j)

def put(v):
	j=-1
	while v[0]<v[j]:
		j-=1
	v=flip(v,-j)
	return -j,v

def pancake(v):
	Mov=[]
	s=1
	while (s<len(v)-1):
		s=disordered(v)
		t=max(v[:-s])+s

		v=flip(v,t)
		
		if t<len(v) and t>0:
			Mov.append(t)
			
		[s,v]=put(v)
		if s<len(v):
			Mov.append(s)
			
	Mov.append(0)	
	return v, Mov

db=open ('problem9.in')

try:
	S=0
	messypancakes=db.readlines()
	for i in range(len(messypancakes)):
		messypancakes[i]=messypancakes[i].split()
		for j in range(len(messypancakes[i])):
			messypancakes[i][j]=int(messypancakes[i][j])
			S+=messypancakes[i][j]
		[v,Mov]=pancake(messypancakes[i])
		S+=sum(Mov[j] for j in range(len(Mov)))
	print S
finally:
	db.close()



