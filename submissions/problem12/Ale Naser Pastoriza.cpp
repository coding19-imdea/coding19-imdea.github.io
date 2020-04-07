#include<bits/stdc++.h>

using namespace std;

typedef long long ll;

int main() {
    int n = 21, a = 1 << (n - 1), b = 1 << (n - 2),
        c = 1 << (n - 3), d = 1 << (n - 4);

    unordered_set<int> s = {
        a | 8 | 4 | 2 | 1,
        a | b | 4 | 2 | 1,
        a | b | c | 2 | 1,
        a | b | c | d | 1
    };

    set<int> ans;
    for(int i = 0; i < (1 << n); i++){
        int any = 0;
        for(int j = 0; j <= n - 5; j++)
            if (__builtin_popcount(i & (31 << j)) > 2)
                any = 1;
        for(int j : s)
            if (__builtin_popcount(i & j) > 2)
                any = 1;
        if(any)
            continue;
        for(int k = 0; k < n; k++){
            int i_rot = 0;
            for(int j = 0; j < n; j++)
                if(i & (1 << ((j + k) % n)))
                    i_rot |= 1 << j;
            if (ans.count(i_rot))
                any  = 1;
        }
        if (!any)
            ans.insert(i);
    }

    printf("%lld\n", (ll)ans.size());

    return 0;
}