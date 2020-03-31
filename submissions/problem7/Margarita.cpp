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

int cant[2][2];

int main() {
    ios::sync_with_stdio(0); cin.tie(0);

    forn(i,10) forn(j,10){
        int sum = i + j;
        cant[sum&1][sum>=10]++;
    }
    
    ll tot = 0;
    ll act = cant[1][0] - 5 * 2;
    forn(i,4) { //len 2 4 6 8
        tot += act;
        act *= cant[1][0];
    }
        
    act = (cant[1][0] - 5 * 2) * 5;
    forn(i,2){ // len 3 7
        tot += act;
        act *= cant[0][0]*cant[1][1];
    }
    
    cout << tot << endl;
    
    return 0;
}

