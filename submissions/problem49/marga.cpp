#include <bits/stdc++.h>
using namespace std;
typedef long long ll;

#define MAXN 2112345
#define MOD 998244353

vector<int> G[MAXN];
bool visited[MAXN];
int nodes, edges;

void dfs(int v){
	visited[v] = true;
	nodes++;
	edges+= G[v].size();	
	for(int u : G[v]) if(!visited[u]) dfs(u);
}

int main() {
    ios::sync_with_stdio(0); cin.tie(0);
	int n, m; cin >> n >> m;
	
	for(int i = 0; i < m; i++){
		int u, v; cin >> u >> v; u--; v--;
		G[u].push_back(v);
		G[v].push_back(u);
	}
	
	ll res = 1;
	
	for(int i = 0; i < n; i++) if(!visited[i]){
		nodes = edges = 0;
		dfs(i);
		if(2*nodes == edges){
			res *= 2;
			res %= MOD; 
		} else res = 0;
	}
	
	cout << res << endl;
	
    return 0;
}
