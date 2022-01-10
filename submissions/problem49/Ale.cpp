#include<bits/stdc++.h>
using namespace std;

typedef long long ll;
ll p = 998244353;

vector<vector<int>> A;
vector<int> V;

ll exp(ll n, ll k) {
    if (k == 0) {
        return 1;
    }
    ll r = exp(n, k / 2);
    r = (r * r) % p;
    if (k & 1) {
        r = (r * n) % p;
    }
    return r;
}

int vc = 0, ec = 0;
void dfs(int v) {
    vc++;
    ec += int(A[v].size());
    V[v] = 1;
    for (int u : A[v]) {
        if (!V[u]) {
            dfs(u);
        }
    }
}

void solve() {
    int N, M;
    cin >> N >> M;
    A.resize(N);
    V.resize(N);
    for (int i = 0; i < M; i++) {
        int u, v;
        cin >> u >> v;
        u--; v--;
        A[u].push_back(v);
        A[v].push_back(u);
    }
    ll ats = 0;
    for (int i = 0; i < N; i++) {
        if (!V[i]) {
            vc = 0;
            ec = 0;
            dfs(i);
            if (vc != ec / 2) {
                cout << "0\n";
                return;
            }
            ats++;
        }
    }
    cout << exp(2ll, ats) << '\n';
}

int main() {
    ios::sync_with_stdio(0);
    cin.tie(0); cout.tie(0);
    solve();
    return 0;
}