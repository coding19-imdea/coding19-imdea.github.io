#include<bits/stdc++.h>
using namespace std;

typedef long long ll;

bool f;
bitset<200001> vis;
vector<int> pth, cyc;
vector<vector<int>> adj(200001);

void find_cyc(int v, int p) {
    vis[v] = 1;
    pth.push_back(v);
    for (int u : adj[v]) {
        if (u != p) {
            if (!vis[u]) {
                find_cyc(u, v);
            } else {
                if (!f) {
                    cyc.clear();
                    reverse(pth.begin(), pth.end());
                    for (int v : pth) {
                        cyc.push_back(v);
                        if (v == u) {
                            break;
                        }
                    }
                    f = 1;
                }
            }
        }
    }
    pth.pop_back();
}

int dfs(int v) {
    int z = 1;
    vis[v] = 1;
    for (int u : adj[v]) {
        if (!vis[u]) {
            z += dfs(u);
        }
    }
    return z;
}

void solve() {
    ll n;
    cin >> n;
    vis.reset();
    pth.clear();
    for (int v = 0; v < n; v++) {
        adj[v].clear();
    }
    for (int _ = 0; _ < n; _++) {
        int u, v;
        cin >> u >> v;
        u--;
        v--;
        adj[u].push_back(v);
        adj[v].push_back(u);
    }
    f = 0;
    find_cyc(0, 0);
    vis.reset();
    for (int v : cyc) {
        vis[v] = 1;
    }
    ll ans = n * (n - 1);
    for (int v : cyc) {
        ll z = dfs(v);
        ans -= z * (z - 1) / 2;
    }
    cout << ans << '\n';
}

int main() {
    ios::sync_with_stdio(0);
    cin.tie(0); cout.tie(0);
    int t;
    cin >> t;
    while (t--) {
        solve();
    }
    return 0;
}