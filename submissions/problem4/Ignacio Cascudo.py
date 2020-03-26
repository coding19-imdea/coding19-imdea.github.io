#Extremely slow code: takes 3 minutes to execute. Out of neurons to write more efficient solutions x-P

import re

print 'Go grab a coffee. This will take a while...'

def substring (stra,strb):
	straregex=stra[0]
	for i in range(1,len(stra)):
		straregex+='.*'+stra[i]
	if re.search(straregex,strb)==None:
		return None
	else:
		return 1

def prune(data):
	pruneddata=[]	
	S=set([])
	for i in range(len(data)):
		if data[i] not in S:
			pruneddata.append(data[i])
			S.add(data[i])
	return pruneddata

database = open('p079_keylog.txt')
try:
	data=database.readlines()
	pruneddata=prune(data)
	candidate=999999
	hit=0
	while hit==0:
		candidate+=1	
		if candidate%40000000==19999998:
			print '...I am almost done, just a sec...'
		if candidate%40000000==39999998:
			print '...I am so close, I can feel it...'		
		strcand=str(candidate)
		hit=1
		for i in range(len(pruneddata)):
			if (not substring(str(pruneddata[i][:-1]),strcand)):				
				hit=0
				break
	print 'Your password is likely', candidate, 'Better change your bank!'

finally:
	database.close()	

