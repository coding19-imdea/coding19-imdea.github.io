#Syntax: python sierpinski.py arg1 (arg2)
#arg 1=n (iteration, starts at 0, must be <=5)
#arg 2=row (starts at 0, must be <=31)

import sys

def remove(triangle): #Takes triangle given by upper vertex and height, and creates 3 triangles applying one iteration of Sierpinski
	h=triangle[1]/2
	t1=[triangle[0],h]
	t2=[[triangle[0][0]-h,triangle[0][1]+h],h]
	t3=[[triangle[0][0]+h,triangle[0][1]+h],h]
	return t1,t2,t3


def sierp_vert(n): #Computes a list of all triangles in n-th iteration, given by upper vertices and heights 
	
	triangle=[[31,0],32]
	trianglelist=[triangle]
	for i in range(n):
		temp=[]
		while trianglelist:
			t=trianglelist.pop()			
			s=list(remove(t))
			temp=temp+s
			
		
		trianglelist=temp
		
	return trianglelist

def sierpinsk(n): #Creates a list of 32 rows of figure for n-th iteration of Sierpinski. Rows are char strings.
	M=[]
	picrows=[]
	for i in range(32):
		row=63*['_']
		M.append(row)
	tlist=sierp_vert(n)
	for t in tlist:
		for j in range(t[1]):
			for k in range(j+1):
				M[t[0][1]+j][t[0][0]+k]='1'
				M[t[0][1]+j][t[0][0]-k]='1'
	for i in range(32):
		picrows.append("".join(M[i]))
	return picrows


le=len(sys.argv)

if le<2:
	print 'Syntax: python sierpinski.py arg1 (arg2)'
	print 'arg1=n'
	print 'arg2=row'

if le>=2 and int(sys.argv[1]) not in range(6):
	raise ValueError ('arg1 must be integer between 0 and 5')



if le==2:
	for i in range(32):
		print sierpinsk(int(sys.argv[1]))[i]
if le>=3:
	if int(sys.argv[2]) not in range(32):
		raise ValueError ('arg2 must be integer between 0 and 31')
	else:
		print sierpinsk(int(sys.argv[1]))[int(sys.argv[2])]


