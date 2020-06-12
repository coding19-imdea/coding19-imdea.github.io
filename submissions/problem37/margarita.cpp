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


bool f(ll n, ll sum){
    if(n < sum) return false;
    if(n == sum){
        return true;
    }
    int p = 10;
    while(n%p < sum){
        if(f(n/p,sum-n%p)) return true;
        p*=10;
    }
    return false;
}

int main() { 
  int n = 1000001;
  //~ cin >> n;
  ll sum = 0;  
  forr(i,2,n){
    if(f(i*i,i)) sum +=i*i;
  }  
  
  cout << sum << endl;
    
  return 0;
}
