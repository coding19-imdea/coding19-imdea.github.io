
def side (p,q): #Returns boolean that says if (0,0) is on the left or right half-plane respect p->q.
	return  (p[0]*q[1]-p[1]*q[0])>0

def inn(p,q,r): #(0,0) is in the triangle iff (0,0) is in the same side of p->q, q->r, r->p iff this function is 1.
	return (side(p,q)+side(q,r)+side(r,p))%3==0

try:
	db=open('p102_triangles.txt')
	triangles=db.readlines()
	S=0
	for i in range(len(triangles)):
		co=triangles[i].split(",")
		ver=[]
		for j in range(0,6,2):
			ver.append([int(co[j]),int(co[j+1])])
		S+=inn(ver[0],ver[1],ver[2])
	print 'There are ', S, ' triangles containing the origin'

finally:
	db.close()

