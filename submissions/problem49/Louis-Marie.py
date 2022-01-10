inputname="justone.input"

def parseinput():
    with open(inputname,"r") as input:
        n,m=map(int,input.readline().split())
        vertex_list = [[] for i in range(n)]
        for i in range(m):
            k,l=map(int,input.readline().split())
            vertex_list[k-1].append(l-1)
            vertex_list[l-1].append(k-1)
    return n,m,vertex_list

def count_nm_scc(p,v):
    l=[]
    todo=[p]
    m=0
    done=[0]*len(v)
    while len(todo)!=0:
        current=todo.pop(0)
        if done[current]==0:
            for q in v[current]:
                if done[q]==0:
                    todo.append(q)
            done[current]=1
            l.append(current)
            m+=len(v[current])
    return m//2,l

def main():
    n,m,v=parseinput()
    #The idea is that all SCCs have exactly as many nodes as edges
    if n!=m:
        print(0)
        return
    seen=[0]*n
    nb_scc=0
    for p in range(n):
        if seen[p]==0:
            m,scc=count_nm_scc(p,v)
            if len(scc)!=m:
                print(0)
                return
            nb_scc+=1
            for q in scc:
                seen[q]=nb_scc
    print((2**nb_scc)%998244353) 
    return

main()



