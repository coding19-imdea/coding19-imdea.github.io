#include <bits/stdc++.h>
using namespace std;
#define forr(i,a,b) for(int i=(a); i<(b); i++)
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

ll dp[16][256];
vector<int> coins = {1,2,5,10,20,50,100,200};

ll f(int pos, int sum){
    ll &res = dp[pos][sum];
    if(res != -1) return res;
    res = 0;
    if(sum == 200) return res = 1;
    if(pos == 8) return res;
    while(sum <= 200){
        res += f(pos+1, sum);
        sum += coins[pos];
    }
    
    return res;
}

int main() {
    ios::sync_with_stdio(0); cin.tie(0);
    memset(dp,-1,sizeof dp);
    cout << f(0,0) << endl;
    
    return 0;
}
