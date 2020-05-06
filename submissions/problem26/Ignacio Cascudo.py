st,ch=0,0
d=open('p26-input.txt')
unord=d.read()
for i in range(len(unord)):
	if unord[i]=='(':
		st+=1
	elif (unord[i]==')' and st==0):
		st+=1
		ch+=1
	else:
		st-=1
d.close()
print (ch+st), 'changes suffice'
