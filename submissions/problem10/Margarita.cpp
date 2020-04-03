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

int box[3][3];

int main() {
    
    ll tot = 0;
    forn(i,3) forn(j,3){
        cin >> box[i][j];
        tot += box[i][j];
    }
    
    vector<int> v = {0,1,2};
    
    ll res = tot;
    
    do {
        ll act = tot;
        forn(i,3) act -= box[i][v[i]];
        res = min(res,act);
    } while ( next_permutation(v.begin(), v.end()) );

    cout << res << endl;
    
    return 0;
}
