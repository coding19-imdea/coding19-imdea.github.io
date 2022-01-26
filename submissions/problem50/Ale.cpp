#include<bits/stdc++.h>
using namespace std;

typedef long long ll;

void solve() {
    ll n, m;
    cin >> n >> m;
    vector<ll> dp(n + 1), dps(n + 1);
    dp[1] = dps[1] = 1;
    for (int l, x = 2; x <= n; x++) {
        dp[x] = (dp[x] + dps[x - 1]) % m;
        l = 2;
        while (l <= x) {
            ll r = x / (x / l);
            dp[x] = (dp[x] + ((r - l + 1) * dp[x / l]) % m) % m;
            l = r + 1;
        }
        dps[x] = (dp[x] + dps[x - 1]) % m;
    }
    cout << dp[n] << '\n';
}

int main() {
    ios::sync_with_stdio(0);
    cin.tie(0); cout.tie(0);
    solve();
    return 0;
}