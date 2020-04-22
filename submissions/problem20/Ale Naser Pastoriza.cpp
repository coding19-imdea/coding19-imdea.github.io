#include<bits/stdc++.h>
using namespace std;

#define PB push_back
#define PPB pop_back
#define vtx array<int, 3>
#define SZ(x) (int)x.size()
#define mfor(i,a,b) for(int(i)=(a);(i)<=(b);i++)

int N, S;
set<vtx> st;
map<vtx, bool> VIS;
map<vtx, vector<vtx>> ADJ;

vector<vtx> sol;
set<string> ans;

void dfs(vtx v, vtx p, vtx t) {
    if (SZ(sol) == N) {
        set<int> st;
        for (vtx v : sol)
            st.insert({v[0], v[1], v[2]});
        if (v == t && SZ(st) == 2 * N) {
            string s; int sz = SZ(sol);
            for (int i = sz - 1; i < 2 * sz - 1; i++) {
                vtx v = sol[i % sz];
                VIS[v] = 1;
                for (int e: v)
                    s += to_string(e);
            }
            ans.insert(s);
        }
        return;
    }
    for (vtx w : ADJ[v]) {
        if (w != p) {
            sol.PB(w);
            dfs(w, v, t);
            sol.PPB();
        }
    }
}

void solve() {
    string out;
    N = 5;
    mfor (S, 3, 27) {
        st.clear();
        mfor (a, 1, 2 * N)
            mfor (b, 1, 2 * N) {
                if (a == b)
                    continue;
                mfor (c, 1, 2 * N) {
                    if (a == c || b == c)
                        continue;
                    if (a + b + c == S)
                        st.insert({a, b, c});
                }
            }
        for (vtx v : st)
            for (vtx w : st)
                if (v != w && v[2] == w[1])
                    ADJ[v].PB(w);
        VIS.clear();
        for (vtx v : st)
            if (!VIS[v])
                dfs(v, v, v);
        for (string s : ans)
            if (s.size() == 16)
                out = max(out, s);
    }
    cout << out << '\n';
}


int main() {
    ios::sync_with_stdio(0);
    cin.tie(0);

    solve();
    return 0;
}