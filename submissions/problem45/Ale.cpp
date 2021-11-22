#include<bits/stdc++.h>
using namespace std;

typedef long long ll;

bitset<200001> in_cyc;
vector<vector<int>> adj(200001);
vector<int> par(200001), vis(200001);

void find(int v, int p) {
    vis[v] = 1;
    par[v] = p;
    for (int u : adj[v]) {
        if (u != p) {
            if (!vis[u]) {
                find(u, v);
            } else if (vis[u] == 1) {
                par[u] = v;
                in_cyc[u] = 1;
            }
        }
    }
    vis[v] = 2;
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
    for (int v = 0; v < n; v++) {
        vis[v] =  0;
        par[v] = -1;
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
    in_cyc.reset();
    find(0, 0);
    int s = 0;
    while (!in_cyc[s]) {
        s++;
    }
    for (int v = par[s]; v != s; v = par[v]) {
        in_cyc[v] = 1;
    }
    for (int v = 0; v < n; v++) {
        vis[v] = in_cyc[v];
    }
    ll ans = n * (n - 1);
    for (int v = 0; v < n; v++) {
        if (in_cyc[v]) {
            ll z = dfs(v);
            ans -= z * (z - 1) / 2;
        }
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