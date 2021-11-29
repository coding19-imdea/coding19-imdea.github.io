#include <bits/stdc++.h>
using namespace std;
typedef long long ll;

int main() {
    ios::sync_with_stdio(0); cin.tie(0);
	ll l, r; cin >> l >> r;
	ll x = l ^ r;
	ll res = 0;
	for(ll mask = ll (1)<<62; mask > 0; mask >>=1){
		if(mask & x){
			res = mask*2 - 1;
			break;
		}
	}
	cout << res << endl;	
    return 0;
}
