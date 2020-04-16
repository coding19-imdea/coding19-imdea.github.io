#include<bits/stdc++.h>
using namespace std;

#define ll long long
#define vi vector<int>
#define date array<ll, 3>

ll td(date dt) {
    ll l = 0, y = dt[0],
        m = dt[1], d = dt[2], ans;
    auto il = [](ll y) {
        return y % 4 == 0 &&
            (y % 100 != 0 || y % 400 == 0);
    };
    auto ly = [](ll y) {
        return y / 4 - y / 100 + y / 400;
    };
    auto f = [](ll y) {
        return (y - 1900) * 365;
    };
    auto g = [](ll m) {
        ll ans = 0;
        vi mp = {0, 31, 28, 31, 30, 31, 30,
                    31, 31, 30, 31, 30, 31};
        for (ll i = 1; i < m; i++)
            ans += mp[i];
        return ans;
    };
    l = ly(y - 1) - ly(1900) + (m > 2 && il(y));
    return  f(y) + l + g(m) + d;
}

void solve() {
    int t; cin >> t;
    while (t--) {
        ll ans = 0, M = 0;
        ll Y1, M1, D1, Y2, M2, D2;
        cin >> Y1 >> M1 >> D1;
        cin >> Y2 >> M2 >> D2;
        date cur = {Y1, M1,  1},
             min = {Y1, M1, D1},
             max = {Y2, M2, D2};
        while (cur <= max) {
            if (min <= cur && !(td(cur) % 7))
                ans++;
            M++;
            cur[0] = Y1 + (M1 + M - 1) / 12;
            cur[1] = (M1 + M) % 12 == 0 ? 12 : (M1 + M) % 12;
        }
        cout << ans << '\n';
    }
}

int main() {
    ios::sync_with_stdio(0);
    cin.tie(0);

    solve();
    return 0;
}
