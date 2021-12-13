#include <bits/stdc++.h>
using namespace std;
typedef long long ll;

#define MAXN 312345
#define mod 998244353

ll a[MAXN];
ll f[MAXN];

ll expmod (ll b, ll e){
	if(!e) return 1;
	ll q = expmod(b,e/2); q = (q*q)%mod;
	return e%2 ? (b*q)%mod : q;
}

ll inverso(ll x){
	return expmod(x, mod-2);	
}

ll comb(ll n, ll k){
	f[0] = 1;
	for(ll i = 1; i <= n; i++){
		f[i] = (f[i-1]*i)%mod;
	}
	return (f[n] * inverso((f[k]*f[n-k])%mod))%mod;
}

int main() {
    ios::sync_with_stdio(0); cin.tie(0);
	ll n; cin >> n;
	
	for(int i = 0; i<2*n; i++){
		cin >> a[i];
	}
	
	ll c = comb(2*n,n);
	
	ll sum = 0;
	sort(a, a+2*n);
	for(int i = 0; i<n; i++){
		sum+= (a[i+n] - a[i]);
		sum%= mod;
	}
	
	cout << (c*sum)%mod << endl;
	
    return 0;
}
