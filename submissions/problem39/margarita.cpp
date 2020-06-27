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

ll s[1024][1024];
ll acums[1024][1024];

int main() {
  int n = 1000;
  int k = (n*(n+1))/2;
  ll t = 0;
  int i = 0, j = 0;  
  forn(_,k){
    t = (615949*t + 797807) % (1<<20);
    s[i][j] = t - (1<<19);
    if(j == i){
        i++;
        j = 0;
    } else j++;
  }
    
  forn(i,n){
    acums[i][0] = 0;
    forn(j,i+1){
      acums[i][j+1] = acums[i][j] + s[i][j];
    }
  }
  
  ll res = 0;
  forn(i,n) forn(j,i+1){
    ll sum = 0;
    forr(h,i,n){
      sum += acums[h][j+h-i+1] - acums[h][j];
      res = min(res,sum);
    }
  }
   
  cout << res << endl;
    
  return 0;
}
