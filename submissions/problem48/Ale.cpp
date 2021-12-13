#include<bits/stdc++.h>
using namespace std;

typedef long long ll;

ll p = 998244353;
vector<ll> f(300005, 1);

ll exp(ll n, ll k) {
    if (k == 0) {
        return 1;
    }
    ll r = exp(n, k / 2);
    r = (r * r) % p;
    if (k & 1) {
        r = (r * n) % p;
    }
    return r;
}

ll inv(ll a) {
    return exp(a, p - 2);
}

ll C(ll n, ll k) {
    return (f[n] * inv((f[n - k] * f[k]) % p)) % p;
}

void solve() {
    int n;
    cin >> n;
    vector<int> A(2 * n);
    for (int &a : A) {
        cin >> a;
    }
    sort(A.begin(), A.end());
    ll ans = 0;
    for (ll i = 1; i <= 2 * n; i++) {
        f[i] = (i * f[i - 1]) % p;
    }
    for (int i = 0; i < 2 * n; i++) {
        if (i >= n) {
            ans = (ans + A[i]) % p;
        }
        if (i < n) {
            ans = (p + (ans - A[i]) % p) % p;
        }
    }
    cout << (ans * C(2 * n, n)) % p << '\n';
}

int main() {
    ios::sync_with_stdio(0);
    cin.tie(0); cout.tie(0);
    solve();
    return 0;
}