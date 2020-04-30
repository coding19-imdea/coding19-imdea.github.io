#n/phi(n)= prod (1+1/(p_i-1)) where p_i are all primes in the decomposition of n regardless of their exponent. Clearly the maximum is reached when there are as many primes as possible and when these are small as possible. Hence the problem is simply to find the product of the first few primes until reaching the cut-bound. Obviously (2*3*5*7)*(11*13*17*19)>210 * 10**4>10**6, hence these 8 primes are enough.


def result():
	L=[2,3,5,7,11,13,17,19]
	prod=1
	i=0
	while 1:
		a=prod*L[i]	
		if a>10**6:
			return prod
		else:
			prod=a
			i+=1

def main():
	print result()

if __name__=="__main__":
	main()

