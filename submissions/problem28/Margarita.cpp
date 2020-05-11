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
typedef long double ld;
typedef pair<ll,ll> pll;
#define dforn(i,n) for(int i=n-1; i>=0; i--)
#define sz(x) ((int)((x).size()))

#define MAXP 20000000	//no necesariamente primo
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
	forr (i,10000000,MAXP+1) if (!criba[i]) primos.push_back(i);
}

int mask[10] = {(1<<7) - 3, 32+64, (1<<6) - 9, (1<<3) - 1 + 32 + 64, 2+8+32+64,(1<<4)+63,(1<<5) + 63,1+8+32+64,(1<<7)-1, (1<<7)-17};

int digital_root(int n){
  int res = 0;
  while(n>0){
    res+= n%10;
    n/=10;
  }
  return res;
}

int f(int a, int b){
  int res = 0;
  while (a > 0 and b > 0) {
    res += __builtin_popcount(mask[a%10] & mask[b%10]);
    a/=10, b/=10;
  }
  return res;
}

int main() {
  buscarprimos();
  
  int res = 0;
  for(auto n: primos){
    while(n>=10){
      int dr = digital_root(n);
      res += 2*f(n,dr);
      n = dr;
    }
  }  
  cout << res << endl;
    
  return 0;
}
