#include<bits/stdc++.h>

using namespace std;

typedef long long ll;
typedef vector<int> vi;

ll _sieve_size;

vector<ll> ps;
bitset<1000005> bs;

void sieve(ll upperbound) {
    _sieve_size = upperbound + 1;
    bs.set();
    bs[0] = bs[1] = 0;
    for (ll i = 2; i <= _sieve_size; i++)
        if (bs[i]) {
            ps.push_back(i);
            for (ll j = i * i; j <= _sieve_size; j += i)
                bs[j] = 0;
        }
}

bool is_prime(ll N) {
    N = abs(N);
    if (N <= _sieve_size)
        return bs[N];
    for (int i = 0; i < (int)ps.size(); i++)
        if (N % ps[i] == 0)
            return false;
    return true;
}

int main() {
    ll N, mx = -1, max_a, max_b;

    scanf("%lld", &N);
    sieve(1000000);

    for (ll a = -N; a <= N; a++) {
        for (ll b = -N; b <= N; b++) {
            ll n = 0;
            while (is_prime(n * n + a * n + b))
                n++;
            if (mx < n) {
                mx = n;
                max_a = a;
                max_b = b;
            }
        }
    }

    printf("%lld %lld %lld %lld\n", N, mx, max_a, max_b);
    printf("Product of coefficients is %lld\n", max_a * max_b);

    return 0;
}
