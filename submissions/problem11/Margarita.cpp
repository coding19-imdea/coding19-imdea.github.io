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

#define MAXN 112345

int p[MAXN];
int d[MAXN];
int l[MAXN];

vector<pll> v;
set<int> si;

#define operacion(x, y) max(x, y)
const int neutro=0;
struct RMQ{
	int sz;
	int t[4*MAXN];
	int &operator[](int p){return t[sz+p];}
	void init(int n){//O(nlgn)
		sz = 1 << (32-__builtin_clz(n));
		forn(i, 2*sz) t[i]=neutro;
	}
	void updall(){//O(n)
		dforn(i, sz) t[i]=operacion(t[2*i], t[2*i+1]);}
	int get(int i, int j){return get(i,j,1,0,sz);} // [i,j) !
	int get(int i, int j, int n, int a, int b){//O(lgn)
		if(j<=a || i>=b) return neutro;
		if(i<=a && b<=j) return t[n];
		int c=(a+b)/2;
		return operacion(get(i, j, 2*n, a, c), get(i, j, 2*n+1, c, b));
	}
	void set(int p, int val){//O(lgn)
		for(p+=sz; p>0 && t[p]!=val;){
			t[p]=val;
			p/=2;
			val=operacion(t[p*2], t[p*2+1]);
		}
	}
}rmq;

int main() {
    
    int n; cin >> n;
    forn(i,n){
        cin >> p[i];
        v.pb({p[i],i});
    }
    sort(v.begin(), v.end());
 
    vector<int> pendientes;
        
    forn(i,n){
        int pos = v[i].snd;
        auto it = si.insert(pos).fst;
        if(it == si.begin()) l[pos] = -1;
        else {
            --it;
            l[pos] = *it + 1;
        }
        if(i<n-1 and v[i+1].fst == v[i].fst){
            si.erase(pos);
            pendientes.pb(pos);
        } else {
            for(auto x: pendientes) si.insert(x);
            pendientes.clear();
        }
    }
    
    int res = 0;
    rmq.init(n);
    forn(i,n){
        if(l[i] == -1) d[i] = 0;
        else d[i] = rmq.get(l[i],i)+1;
        rmq.set(i,d[i]);
        res = max(res,d[i]);
    }
   
    cout << res << endl;
    
    return 0;
}

/*
5
3 6 2 7 5 

7
6 5 8 4 7 10 9
*/ 
