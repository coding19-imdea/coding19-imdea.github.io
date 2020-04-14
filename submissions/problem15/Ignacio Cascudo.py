
def combi(n,avail):
	if n==0:
		return 1
	else:
		newavail2=avail[:]
		newavail1=avail[:]
		newavail0=avail[:]
	
		if avail[2]>0:
			newavail2[2]-=1
			newavail2[1]+=1
		
		if avail[1]>0:
			newavail1[1]-=1
			newavail1[0]+=1

		if avail[0]>0:
			newavail0[0]-=1
	
		return avail[2]*combi(n-1,newavail2)+avail[1]*combi(n-1,newavail1)+avail[0]*combi(n-1,newavail0)


availe=[0,1,9]

print 9*combi(17,availe)
