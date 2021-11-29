#include<bits/stdc++.h>
using namespace std;

typedef long long ll;

void solve() {
    ll l, r;
    cin >> l >> r;
    if (l == r) {
        cout << "0\n";
        return;
    }
    int k = 64 - __builtin_clzll(l ^ r);
    cout << (1LL << k) - 1 << '\n';
}

int main() {
    ios::sync_with_stdio(0);
    cin.tie(0); cout.tie(0);
    solve();
    return 0;
}