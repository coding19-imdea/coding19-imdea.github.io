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
typedef pair<ll,ll> frac;
#define dforn(i,n) for(int i=n-1; i>=0; i--)
#define sz(x) ((int)((x).size()))

#define MAXP 100000000	//no necesariamente primo
int criba[MAXP+1];
void crearcriba(){
	int w[] = {4,2,4,2,4,6,2,6};
	for(int p=25;p<=MAXP;p+=10) criba[p]=5;
	for(int p=9;p<=MAXP;p+=6) criba[p]=3; 
	for(int p=4;p<=MAXP;p+=2) criba[p]=2;
	for(int p=7,cur=0;p*p<=MAXP;p+=w[cur++&7]) if (!criba[p]) 
		for(int j=p*p;j<=MAXP;j+=(p<<1)) if(!criba[j]) criba[j]=p;
}

vector<int> primos;
void buscarprimos(){
	crearcriba();
	forr (i,2,MAXP+1) if (!criba[i]) primos.push_back(i);
}

//factoriza bien numeros hasta MAXP
bool fact2(ll n, set<ll> &f){ //O (lg n)
	ll act = n;
  while (criba[act]){
    ll d = criba[act];
    if(criba[d+n/d]) return false;
		f.insert(d);
		act/=d;
	}
	if(act>1){
    if(criba[act+n/act]) return false;
    f.insert(act);
	}
  return true;
}
void divisores(const set<ll> &f, vector<ll> &divs, set<ll>::iterator it, ll n=1){
    if(it==f.begin()) divs.clear();
    if(it==f.end()) { divs.pb(n);  return; }
    ll p=*it; ++it;
    forn(_, 2) divisores(f, divs, it, n), n*=p;
}

bool prime_generating(ll n){ 
	set<ll> f;
  if(!fact2(n,f)) return false;
  vector<ll> divs;
  divisores(f,divs,f.begin());
  for(auto d: divs){
    if(criba[d+n/d]) return false;
  }
	return true;
}



int main() {  
  buscarprimos();
  ll res = 0;
  
  for(int p: primos){
    ll n = p - 1;
    if(prime_generating(n)) res +=n; 
  }

  cout << res << endl;
  
  return 0;
}
