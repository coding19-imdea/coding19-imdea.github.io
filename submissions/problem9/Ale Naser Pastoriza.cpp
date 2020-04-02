#include<bits/stdc++.h>

using namespace std;

#define PB push_back

int main() {
    int a, n;
    string s;
    vector<int> u, v;
    long long ans = 0;

    while (getline(cin, s)) {
        stringstream ss(s);
        u.clear(); v.clear();
        while (ss >> a) {
            v.PB(a);
            u.PB(a);
        }
        n = v.size();
        sort(u.begin(), u.end());
        for (int i = 0; i < n - 1; i++) {
            ans += v[i];
            printf("%d ", v[i]);
        }
        ans += v[n - 1];
        printf("%d\n", v[n - 1]);
        for (int i = n - 1; 0 < i; i--) {
            auto it = v.begin();
            if (v[i] == u[i])
                continue;
            int j = i - 1;
            while (v[j] != u[i])
                j--;
            if (j > 0) {
                ans += n - j;
                printf("%d ", n - j);
                reverse(it, it + j + 1);
            }
            ans += n - i;
            printf("%d ", n - i);
            reverse(it, it + i + 1);
        }
        puts("0");
    }
    printf("%lld\n", ans);

    return 0;
}