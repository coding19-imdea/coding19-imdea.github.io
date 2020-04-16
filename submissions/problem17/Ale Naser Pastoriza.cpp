#include<bits/stdc++.h>
using namespace std;

#define F first
#define S second
#define si pair<string, int>
#define vsi vector<si>
#define vsc vector<set<char>>
#define mfor(i,a,b) for(int i=(a);i<(b);i++)

const int N = 12;

void backtrack(const vsi v, const vsc st, const string s) {
    if (!v.size()) {
        mfor(i, 0, N)
            if (s[i] != ' ')
                printf("%c", s[i]);
            else
                for (char c = '0'; c <= '9'; c++)
                    if (!st[i].count(c))
                        printf("%c", c);
        puts("");
        exit(0);
    }
    for (auto s : st)
        if (s.size() == 10)
            return;

    bool any = false;
    for (char c : s)
        if (c == ' ') {
            any = true;
            break;
        }
    if (!any) {
        for (auto p : v) {
            string g = p.F;
            int c = p.S, cnt = 0;
            mfor(j, 0, N)
                if (s[j] == g[j])
                    cnt++;
            if (cnt != c)
                return;
        }
        cout << s << '\n';
        exit(0);
    }

    int c = v[0].S;
    string g = v[0].F;
    vsi w = v; w.erase(w.begin());
    switch (c) {
        case 1:
            mfor(i, 0, N) {
                if (st[i].count(g[i])) continue;
                if (s[i] != ' ' && s[i] != g[i]) continue;
                vsc pt = st;
                string t = s; t[i] = g[i];
                mfor(j, 0, N)
                    if (j != i)
                        pt[j].insert(g[j]);
                int cnt = 0;
                mfor(j, 0, N)
                    if (t[j] == g[j])
                        cnt++;
                if (cnt == 1)
                    backtrack(w, pt, t);
            }
            break;
        case 2:
            mfor(i, 0, N) {
                if (st[i].count(g[i])) continue;
                if (s[i] != ' ' && s[i] != g[i]) continue;
                mfor(j, i + 1, N) {
                    if (st[j].count(g[j])) continue;
                    if (s[j] != ' ' && s[j] != g[j]) continue;
                    vsc pt = st;
                    string t = s; t[i] = g[i]; t[j] = g[j];
                    mfor(k, 0, N)
                        if (k != i && k != j)
                            pt[k].insert(g[k]);
                    int cnt = 0;
                    mfor(j, 0, N)
                        if (t[j] == g[j])
                            cnt++;
                    if (cnt == 2)
                        backtrack(w, pt, t);
                }
            }
            break;
        case 3:
            mfor(i, 0, N) {
                if (st[i].count(g[i])) continue;
                if (s[i] != ' ' && s[i] != g[i]) continue;
                mfor(j, i + 1, N) {
                    if (st[j].count(g[j])) continue;
                    if (s[j] != ' ' && s[j] != g[j]) continue;
                    mfor(k, j + 1, N) {
                        if (st[k].count(g[k])) continue;
                        if (s[k] != ' ' && s[k] != g[k]) continue;
                        vsc pt = st;
                        string t = s; t[i] = g[i]; t[j] = g[j]; t[k] = g[k];
                        mfor(l, 0, N)
                            if (l != i && l != j && l !=k)
                                pt[l].insert(g[l]);
                        int cnt = 0;
                        mfor(j, 0, N)
                            if (t[j] == g[j])
                                cnt++;
                        if (cnt == 3)
                            backtrack(w, pt, t);
                    }
                }
            }
    }
}

bool cmp(si a, si b) {
    return a.S < b.S;
}

void solve() {
    int n; cin >> n;
    vsi v; vsc st(N);
    mfor(i, 0, n) {
        string s; int c;
        cin >> s >> c;
        if (c)
            v.emplace_back(s, c);
        else
            mfor(j, 0, N)
                st[j].insert(s[j]);
    }
    string t(N, ' ');
    sort(v.begin(), v.end(), cmp);
    backtrack(v, st, t);
}

int main() {
    ios::sync_with_stdio(0);
    cin.tie(0);

    solve();
    return 0;
}