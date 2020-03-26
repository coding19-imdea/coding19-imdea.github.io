
import sys

def combine(virlist, virus, comb_rules):
	free=1
	pair=set([virlist[-1],virus])
	for rule in comb_rules:
		
		if rule[0]<=pair and pair<=rule[0]:
			virlist.pop()
			virlist.append(rule[1])
			free=0
			break
	return free
	

def oppose(virlist, virus, oppose_rules): 
	alive=1	
	for rule in oppose_rules:
		if virus in rule:
			dif=rule.difference(set([virus]))
			for elem in virlist:
				if elem in dif:
					del virlist[:]
					alive=0
					break
	if alive:
		virlist.append(virus)



def transform(viruses, comb_rules, oppose_rules):
	virlist=[viruses[0]]
	for i in range(1,len(viruses)):
		if len(virlist)>0:
			free=combine(virlist, viruses[i], comb_rules)
			if free:				
				oppose(virlist, viruses[i], oppose_rules)
		else:
			virlist.append(viruses[i])
	return virlist

def nextnumber(string, begin):
	k=begin	
	while(string[k]!=' '):
		k+=1
	return k, int(string[begin:k])


le=len(sys.argv)

namefile=''

if le==2:
	namefile=sys.argv[1]	
else:
	raise ValueError ('Syntax must be: python virus_ignacio.py file,  where file is problem3-small.in or problem3-large.in')
	
if namefile!='problem3-small.in' and namefile!='problem3-large.in':
	raise ValueError ('Wrong name of file, must be problem3-small.in or problem3-large.in')

database = open(namefile)
try:
	data=database.readlines()
	nodatalines=int(data[0])
	M=0
	for i in range(1,nodatalines+1):
		[k,nc]=nextnumber(data[i],0)		
		comb=[]
		endcomb=k+1+4*nc
		for j in range(k+1,endcomb,4):
			comb.append([set(data[i][j:j+2]), data[i][j+2]])
				
		[k,no]=nextnumber(data[i],endcomb)
		oppo=[]
		endoppo=k+1+3*no
		for j in range(k+1,endoppo,3):
			oppo.append(set(data[i][j:j+2]))
		[k,ld]=nextnumber(data[i],endoppo)
		vir=data[i][k+1:k+ld+1]
		result=transform(vir, comb, oppo)
		M+=len(result)
		print 'Case#', i, '[%s]' % ', '.join(map(str, result))
	print M		
finally:
	database.close()

	



