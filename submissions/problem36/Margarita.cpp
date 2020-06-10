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

# define M_PI           3.14159265358979323846  /* pi */

int main() {  

  ld d;
  cin >> d;  
  ld centro = (sqrt(3) - 1)*(sqrt(3) - 1)*d*d/2 + d*d*M_PI/3 - d*d;
  ld dotted = (M_PI - 2)*d*d - 2*centro;
  cout << fixed << setprecision(3) << centro << " " << dotted << " " << d*d - centro - dotted << endl;
    
  return 0;
}
