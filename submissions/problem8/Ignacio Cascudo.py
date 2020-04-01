def factorial(n):
	if n==1:
		return 1
	else: return n*factorial(n-1)

def binomial(n,t):
	return factorial(n)/(factorial (n-t)*factorial(t))


def proballbad(n,m): #Probability that all m designated elements out of n are misplaced.
	if m==0:
		return 1
	elif m==1:
		return float(n-1)/float(n)
	else:
		return (float(n-m)/float(n))*proballbad(n-1,m-1)+(float(m-1)/float(n))*proballbad(n-1,m-2) 
#Probability when in first position a non-prime is chosen + probability when in first position a different prime is chosen 



result=binomial(25,3)*1./(100*99*98) *proballbad(97,22)
print ("%.12f" % result)

#(Ways of choosing 3 primes (25 choose 3) * prob of allocating those correctly(1/100)*(1/99)*(1/98)) * prob (no other of 22 primes is in correct position of remaining 97)

