#include <bits/stdc++.h>
using namespace std;
typedef long long ll;

int main() {
    ios::sync_with_stdio(0); cin.tie(0);
    int t; cin >> t;
    while(t--){
        int d, m; cin >> d >> m;
        ll res = 1;
        ll pot = 1;
        while(2*pot <= d){
            res *= (pot + 1);
            res %= m;
            pot*=2;
        }
        res *= (d - pot + 2);
        res %= m;
        cout << (res + m - 1) % m << endl;
    }
    return 0;
}
