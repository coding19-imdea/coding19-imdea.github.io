from sys import argv
MAX = int(argv[1])

def rev(i):
    return int(str(i)[::-1])

def is_rev(i):
    if i % 10 == 0:
        return False
    is_odd = lambda d: int(d) % 2
    return all([is_odd(d) for d in str(i + rev(i))])

print(len([i for i in range(1, MAX+1) if is_rev(i)]))
