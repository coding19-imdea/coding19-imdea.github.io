
import sys
import math


file = open('dsinput.txt', 'r')
lines = file.readlines()

n = int(lines[0].strip())
arr = list(map(int, lines[1].rstrip().split()))

part_inc = sorted(arr[:n])
part_dec = sorted(arr[n:], reverse=True)
psum = 0

for i, elem in enumerate(part_inc):
    psum += abs(part_inc[i] - part_dec[i])

print((psum * math.comb(n * 2, n)) % 998244353)