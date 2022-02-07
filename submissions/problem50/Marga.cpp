#include <bits/stdc++.h>
using namespace std;
typedef long long ll;

#define MAXP 212345	//no necesariamente primo
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
	for (int i=2; i < MAXP+1; i++) if (!criba[i]) primos.push_back(i);
}

//factoriza bien numeros hasta MAXP
map<ll,ll> fact(ll n){ //O (lg n)
	map<ll,ll> ret;
	while (criba[n]){
		ret[criba[n]]++;
		n/=criba[n];
	}
	if(n>1) ret[n]++;
	return ret;
}
//Usar asi:  divisores(fac, divs, fac.begin()); NO ESTA ORDENADO
void divisores(const map<ll,ll> &f, vector<ll> &divs, map<ll,ll>::iterator it, ll n=1){
    if(it==f.begin()) divs.clear();
    if(it==f.end()) { divs.push_back(n);  return; }
    ll p=it->first, k=it->second; ++it;
    for(int i = 0; i < k+1; i++) divisores(f, divs, it, n), n*=p;
}    

int m;   
   
ll dpf[MAXP], dpg[MAXP], dpacc[MAXP];
vector<ll> divs[MAXP];

ll g(int n);
ll acc(int n);

ll f(int n){
	ll &res = dpf[n];
	if(res != -1) return res;
	if(n == 1) return res = 1;
	res = (acc(n) + g(n))%m;
	return res;
}

ll acc(int n){
	ll &res = dpacc[n];
	if(res !=-1) return res;
	if(n == 1) return res = 0;
	res = (f(n-1) + acc(n-1))%m;
	return res;
}

ll g(int n){
	ll &res = dpg[n];
	if (res != -1) return res;
	if (n == 1) return res = 0;
	map<ll,ll> fac = fact(n);
	divisores(fac, divs[n], fac.begin());
	res = (g(n-1) + f(1)) %m;
	for(auto d: divs[n]) if (d != 1 and d != n){
		res +=	f(d) - f(d-1) + m;
		res %= m;
	}
	return res;
}


int main() {
    ios::sync_with_stdio(0); cin.tie(0);
	int n;
	cin >> n >> m;
	buscarprimos();
	memset(dpf,-1,sizeof dpf);
	memset(dpg,-1,sizeof dpg);
	memset(dpacc,-1,sizeof dpacc);
	cout << f(n) << endl;
	return 0;
}    
