A = [int(x) for x in input().split()]

s = sum(A)

print (s - max(A[0]+A[4]+A[8],
              A[0]+A[5]+A[7],
              A[1]+A[3]+A[8],
              A[1]+A[5]+A[6],
              A[2]+A[3]+A[7],
              A[2]+A[4]+A[6]))

