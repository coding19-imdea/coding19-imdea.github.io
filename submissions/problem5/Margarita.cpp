#include <bits/stdc++.h>
using namespace std;
#define forr(i,a,b) for(int i=(a); i<(b); i++)
#define forn(i,n) forr(i,0,n)
#define zero(v) memset(v, 0, sizeof(v))
#define forall(it,v) for(auto it=v.benxtin();it!=v.end();++it)
#define pb push_back
#define fst first
#define snd second
typedef long long ll;
typedef pair<ll,ll> pll;
#define dforn(i,n) for(int i=n-1; i>=0; i--)
#define sz(x) ((int)((x).size()))

#define MAXN 12
#define INF 2*MAXN

vector<pll> input;

int nxt[2*MAXN];

int in(int v){
    return v;
}

int out(int v){
    return v + MAXN;
}

int valid_pairs(int n){
    int i = 0;
    while(i < n and nxt[in(i)] != -1) i++;
    
    if(i == n) {
        forn(j,n){
            int v = in(j);
            forn(_, 2*n+2){
                if(v == INF) break;
                v = nxt[v];
            }
            if(v!= INF) return 1;
        }
        return 0;
    }
    
    int res = 0;
    forr(j,i+1,n){
        if(nxt[in(j)] == -1){
            nxt[in(i)] = out(j);
            nxt[in(j)] = out(i);
            res +=valid_pairs(n);
            nxt[in(i)] = -1;
            nxt[in(j)] = -1;
        }  
    }
    
    return res;
}



int main() {
    ios::sync_with_stdio(0); cin.tie(0);
    int n; cin >> n;
    forn(_,n){
        ll x,y; cin >> x >> y;
        input.pb({y,x}); 
    }
    sort(input.begin(), input.end());
    
    forn(i,n-1) 
        if(input[i].fst == input[i+1].fst) nxt[out(i)] = in(i+1);
        else nxt[out(i)] = INF;
        
    nxt[out(n-1)] = INF;
    
    forn(i,n) nxt[in(i)] = -1;
    
    cout << valid_pairs(n) << endl;
    
    return 0;
}
