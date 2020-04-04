def max(M):
	r=0
	for i in range(3):
		for j in (range(3)):
			if i!=j:
				a=M[i]+M[3+j]+M[9-i-j]
				if a>r:
					r=a
	return r

def result(M):
	S=sum (M[i] for i in range(9))
	return S-max(M)

print result([85263245, 25965748, 69854785, 15874569, 36985745, 12365478, 36985526, 32147859, 96587458])
