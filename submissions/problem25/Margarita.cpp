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

struct pto{
	ll x, y;
	pto(ll x=0, ll y=0):x(x),y(y){}
	pto operator-(pto a){return pto(x-a.x, y-a.y);}
	pto operator*(ll a){return pto(x*a, y*a);}
	ll operator^(pto a){return x*a.y-y*a.x;}
	bool left(pto q, pto r){return ((q-*this)^(r-*this))>0;}
};

int main() {
    pto t[3];    
    pto center;
    char c;
    
    ll res = 0;
    
    while(cin >> t[0].x >> c >> t[0].y >> c >> t[1].x >> c >> t[1].y >> c >> t[2].x >> c >> t[2].y){
        int act = 1;
        forn(i,3){
            pto a = t[i], b = t[(i+1)%3], c = t[(i+2)%3];
            if(a.left(b,c) != center.left(b,c)) act = 0;
        }
        res += act;
    }
    cout << res << endl;

    return 0;
}
