def merrier(C, O, I) : #C list of combine, O list of opposed, I inputs list
    L = []
    # for each new virus
    for i in I :
        L = L + [i]
        change = 1
        # can we combine it ?
        while change == 1 and len(L) > 1 :
            change = 0
            for c in C :
                if [L[-1],L[-2]] == [c[0],c[1]] or [L[-1],L[-2]] == [c[1],c[0]]:
                    L.pop()
                    L.pop()
                    L += c[2]
                    change = 1
                    break
        change = 1
        # can we oppose it ?
        while change == 1 and len(L) > 1 :
            change = 0
            for o in O :
                for l in L[:-1] :
                    if [l,L[-1]] == [o[0],o[1]] or [L[-1],l] == [o[0],o[1]]:
                        L[:] = []
                        change = 1
                        break
    return L

from sys import argv
script, filename = argv
f = open(filename)
lines = f.readlines()
nb_lines = int(lines[0])
M = 0
# for each line
for i in range(nb_lines) :
    s = lines[i+1].split()
    # creation of list C, O and I
    nb_c = int(s[0])
    C = []
    j = 1
    for c in range(nb_c) :
        C += [s[j]]
        j += 1
    nb_o = int(s[j])
    j += 1
    O = []
    for o in range(nb_o) :
        O += [s[j]]
        j += 1
    nb_i = int(s[j])
    j += 1
    I = s[j]
    # apply merrier
    L = merrier(C,O,I)
    # print the result
    K =  "Case #"+str(i+1)+": "+("["+', '.join(['%c']*len(L))+"]") %tuple(L)
    print K
    M += len(L)
print M
f.close()
