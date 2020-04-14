#include <bits/stdc++.h>
using namespace std;
#define forr(i,a,b) for(ll i=(a); i<(b); i++)
#define forn(i,n) forr(i,0,n)
#define zero(v) memset(v, 0, sizeof(v))
#define forall(it,v) for(auto it=v.begin();it!=v.end();++it)
#define pb push_back
#define fst first
#define snd second
#define pos first
#define b second
typedef long long ll;
typedef pair<ll,ll> pll;
#define dforn(i,n) for(int i=n-1; i>=0; i--)
#define sz(x) ((int)((x).size()))

ll dp[20][2<<20];

int n;

int count(int mask, int v){
    return (mask >> (2*v)) & 3;
}

int add(int mask, int v){
    return mask + (1 << (2*v));
}

ll f(int pos, int mask){
    ll &res = dp[pos][mask];
    if(res !=-1) return res;
    
    if(pos == n) return res = 1;
    
    res = 0;
    forn(i,10){
        if(pos == 0 and i == 0) continue;
        if(count(mask,i) < 3) res += f(pos+1, add(mask,i));
    }
    
    return res;
}

int main() {
    cin >> n;
    memset(dp,-1,sizeof dp);
    cout << f(0,0) << endl;
    return 0;
}
