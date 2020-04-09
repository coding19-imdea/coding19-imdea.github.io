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


vector<pll> v;

map<int, int> m;

int main() {
    int n;
    cin >> n;
    forn(i,n){ 
        int x;
        char c;
        cin >> x >> c;
        if(c == 'S') v.pb({x,1});
        else v.pb({x,-1});    
    }
    
    sort(v.begin(), v.end());
    
    int sum = 0;
    ll res = 0;
    //~ ll act = 0;
    //~ int start = 0;
    m[0] = v[0].pos;
    forn(i,n){
        sum += v[i].b;
        if(m.count(sum)) res = max(res, v[i].pos - m[sum]);
        else if(i<n-1) m[sum] = v[i+1].pos;
        
        //~ if(i > 0){
            //~ if(v[i-1].b == v[i].b) act += v[i].pos - v[i-1].pos;
            //~ else {
                //~ if(act == res){
                    //~ forr(j,start,i) assert(v[j].b == v[start].b);
                    //~ assert(act == v[i-1].pos - v[start].pos);
                //~ }
                //~ act = 0;
                //~ start = i;
            //~ }
        //~ }
        //~ res = max(res, act);
    }
    
    cout << res << endl;
    
    return 0;
}
