#include <bits/stdc++.h>
using namespace std;


#define MAXN 212345

#define no_visited 0
#define visiting 1
#define visited 2

vector<int> G[MAXN];
int dad[MAXN];
int state[MAXN];
bool is_in_cycle[MAXN];


void mark_cycle(int v, int u){
	while(v != u){
		is_in_cycle[v] = true;
		v = dad[v];
	}
	is_in_cycle[u] = true;
}

void find_cycle(int v, int p = -1){
	if(state[v] == visited) return;
	state[v] = visiting;
	dad[v] = p;
	for (int u : G[v]) if(u != p){
		if(state[u] == visiting){
			mark_cycle(v,u);
			break;
		}
		find_cycle(u,v);
	}
	state[v] = visited;
}

void clean(int n){
	for(int i = 0; i < n; i++){
		state[i] = no_visited;
		is_in_cycle[i] = false;
		G[i].clear();
	}
}

int dfs(int v){
	int res = 1;
	state[v] = visited;
	for(int u : G[v]) if(state[u] == no_visited) {
		res += dfs(u);
	}
	return res;
}

int main() {
    ios::sync_with_stdio(0); cin.tie(0);
    
    int t; cin >> t;
    for(int _ = 0; _ < t; _++){
		long long n; cin >> n;
		
		clean(n);
				
		for(int i = 0; i < n; i++){
			int u, v; cin >> u >> v; u--; v--;
			G[u].push_back(v);	
			G[v].push_back(u);	
		}
		
		for(int i = 0; i < n; i++) find_cycle(i);
		for(int i = 0; i < n; i++){
			if(!is_in_cycle[i]) state[i] = no_visited;
		}
		
		long long res = 0;
		for(int i = 0; i < n; i++) if(is_in_cycle[i]){
			long long t = dfs(i);
			res += (t*(t-1))/2 + t * (n-t);
		}
		cout << res << endl;
		
	}
	
    
    return 0;
}
