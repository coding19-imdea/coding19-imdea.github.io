#include <bits/stdc++.h>
using namespace std;
#define forr(i,a,b) for(ll i=(a); i<(b); i++)
#define forn(i,n) forr(i,0,n)
#define zero(v) memset(v, 0, sizeof(v))
#define forall(it,v) for(auto it=v.begin();it!=v.end();++it)
#define pb push_back
#define fst first
#define snd second
typedef long long ll;
typedef pair<ll,ll> pll;
#define dforn(i,n) for(int i=n-1; i>=0; i--)
#define sz(x) ((int)((x).size()))


int f(int mask){
    int a = (mask >> 5);
    int b = (mask >> 4) & 1;
    int c = (mask >> 3) & 1;
    return ((mask << 1) | (a ^ (b & c))) & ((1<<6) - 1);
}

int nxt[70];
bool vis[70];
ll dp[70];

int main() {
    
    int n = 6;
    forn(mask, 1<<n) nxt[mask] = f(mask);
    
    ll res = 1;
    
    dp[0] = 1;
    dp[1] = 2;
    
    forr(i,2,(1<<n)+5) dp[i] = dp[i-1] + dp[i-2];
    
    forn(i,1<<n) if(!vis[i]){
        vis[i] = true;
        int l = 1;
        int v = nxt[i];
        while(v != i){
            vis[v] = true;
            l++;
            v = nxt[v];
        }
        if(l == 1) res *= 1;
        if(l == 2) res *= 3;
        else res *= (dp[l-1] + dp[l-3]);
    }
    
    cout << res << endl;
    
    return 0;
}
