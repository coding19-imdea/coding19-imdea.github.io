#include <bits/stdc++.h>
using namespace std;
#define forr(i,a,b) for(ll i=(a); i<(b); i++)
#define forn(i,n) forr(i,0,n)
#define zero(v) memset(v, 0, sizeof(v))
#define forall(it,v) for(auto it=v.begin();it!=v.end();++it)
#define pb push_back
#define fst first
#define snd second
#define num first
#define div second
typedef long long ll;
typedef long double ld;
typedef pair<ll,ll> pll;
#define dforn(i,n) for(int i=n-1; i>=0; i--)
#define sz(x) ((int)((x).size()))

vector<int> all[10];
vector<int> v[10][100];

int f(int p, int n){
    if(p == 3) return (n*(n+1))/2;
    if(p == 4) return n*n;
    if(p == 5) return (n*(3*n-1))/2;
    if(p == 6) return n*(2*n-1);
    if(p == 7) return (n*(5*n-3))/2;
    if(p == 8) return n*(3*n-2);
    return -1;
}

bool esta(int mask, int pos){
    return mask & (1<<pos);
}

int prender(int mask, int pos){
    return mask | (1<<pos);
}

int find_set(int n, int mask, int start){
    if(mask + 1 == 1<<5){
        if (n%100 == start/100) return n;
        return -1;
    }
    forr(j,4,9) if(!esta(mask,j-4)){
        for(auto x: v[j][n%100]) {
            int res = find_set(x, prender(mask,j-4), start);
            if(res > 0) return res + n;
        }
    }    
    return -1;
}

int main() {  

  forr(j,3,9) forn(i,200) {
    int n = f(j,i);
    if(n >= 10000) break;
    if(n >= 1000){
        all[j].pb(n);
        v[j][n/100].pb(n);
    }
  }  
  int res = 0;
  for(auto x: all[3]){
    res = find_set(x, 0, x);
    if(res > 0) break;
  }  
  
  cout << res << endl;
    
  return 0;
}
