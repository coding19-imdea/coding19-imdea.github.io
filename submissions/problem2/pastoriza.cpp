#include<bits/stdc++.h>

using namespace std;

int mod = 1e9 + 7;

int main() {
    int T, N;
    vector<int> cs = {1, 2, 5, 10, 20, 50, 100, 200};
    vector<int> dp(100500);

    dp[0] = 1;
    for (int c : cs)
        for (int N = 0; N <= 100005; N++) {
            dp[N + c] += dp[N];
            dp[N + c] %= mod;
        }

    scanf("%d", &T);
    while (T--) {
        scanf("%d", &N);
        printf("%d\n", dp[N]);
    }

    return 0;
}