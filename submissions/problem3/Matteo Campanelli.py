from sys import stdin, argv
from functools import reduce

def parse_test(l):
    parts = l.split()
    n_transf = int(parts[0])
    parts = parts[1:]
    
    t_pair = lambda T: (T[0], T[1])
    t_opp_pair = lambda T: (T[1], T[0])
    t_rslt = lambda T: T[2]

    transf = { t_pair(T) : t_rslt(T) for T in  parts[:n_transf] }
    # Add reversals
    transf.update({ t_opp_pair(T) : t_rslt(T) for T in  parts[:n_transf] })

    n_antipairs = int(parts[n_transf])
    antipairs = parts[n_transf+1:n_transf+1+n_antipairs]
    
    outbreaks = parts[-1]

    return (transf, antipairs, outbreaks)

def apply_transform(transf, state):
    if len(state) < 2:
        return (state, False)

    last_pair = (state[-2], state[-1])
    if last_pair in transf: # transformation!
        new_last = transf[last_pair]
        return (state[:-2] + [new_last], True)

    return (state, False)

def solve(transf, antipairs, outbreaks):
    state = []
    for virus in outbreaks:
        state.append(virus)
        state, did_transform = apply_transform(transf, state)
        if did_transform:
            continue

        # Check antipairs
        all_els = set(state)
        for p in antipairs: 
            if p[0] in all_els and p[1] in all_els:
                # annihilation!
                state = []

    return state


def main(fn):
    f = (open(fn) if fn else stdin)
    lines = f.readlines()
    N = 0
    for i, l in enumerate(lines[1:]):
        transf, antipairs, outbreaks = parse_test(l)
        sol = solve(transf, antipairs, outbreaks)
        N += len(sol)
        sol_str = ", ".join(sol)
        print(f"Case #{i+1}: [{sol_str}]")
    print(N)



if __name__ == '__main__':
    fn = ("" if len(argv) < 2 else argv[1])
    main(fn)