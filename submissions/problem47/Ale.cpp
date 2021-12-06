#include<bits/stdc++.h>
using namespace std;

typedef long long ll;

void solve() {
    int d, m, p = 0;
    cin >> d >> m;
    while (1 << (p + 1) <= d) {
        p++;
    }
    ll ans = 1;
    for (int i = 0; i < p; i++) {
        ans = (ans * (1 + (1 << i)) % m) % m;
    }
    ans = (ans * (1 + (d - (1 << p) + 1)) % m) % m;
    cout << (ans + m - 1) % m << '\n';
}

int main() {
    ios::sync_with_stdio(0);
    cin.tie(0); cout.tie(0);
    int t;
    cin >> t;
    while (t--) {
        solve();
    }
    return 0;
}
