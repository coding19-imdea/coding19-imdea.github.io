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

int n;

set<ll> s;

ll normalizar(ll mask, int n){
    ll m = mask;
    forn(i,n){
        ll last = mask & 1;
        mask >>= 1;
        if(last) mask |= (1<<(n-1));
        m = min(mask,m);
    }
    return m;
}

int main() {
    cin >> n;
    forn(collar, (1<<n)){
        ll collar2 = (collar << n) + collar;
        ll mask = (1<<5) - 1;
        bool valid = true;
        forn(i,n){
            if(__builtin_popcount(collar2 & mask) > 2){ valid = false; break;}
            mask <<=1;
        }
        if(valid) s.insert(normalizar(collar,n));
    }
    cout << s.size() << endl;
}

